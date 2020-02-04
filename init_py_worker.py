#!python3

limit = 2
end_cmd=b"\x00\n"

pwp=Py_worker_pool(size=os.cpu_count())

def gen_new_py_worker(name,py_workers): #{{{
    if len(py_workers) > limit:
        if name in py_workers.keys():
            py_workers.pop(name)
            return py_workers
    pw=subprocess.Popen(["python3",environ["vcd"]+psep+"py_worker.py", vim.vvars['servername'], name ], start_new_session=False,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    # set the workers nonblocking , so nvim does not hang
    set_blocking( pw.stdout.fileno(), False )
    set_blocking( pw.stderr.fileno(), False )
    set_blocking( pw.stdin.fileno(),  False )
    py_workers[name]=pw
    return py_workers

def check_py_worker_0( name, py_workers ):
    if not py_workers[name].poll() is None:
        print("py_worker "+name+" crashed")
        py_workers.pop(name)
        return {},py_workers
    t0=time()
    py_workers[name].stdin.write( "status()".encode() + end_cmd )
    py_workers[name].stdin.flush()
    return {'t0':t0 },py_workers

def check_py_worker_1(name,py_workers,status_report):
    if not py_workers[name].poll() is None:
        print("py_worker "+name+" crashed")
        py_workers.pop(name)
        return {}, py_workers
    if 'status' in status_report.keys():
        if status_report['status']=='ok':
            t1=time()
            return {'name':name,'t1':t1},py_workers
    return {'t1':inf}, py_workers


def timecheck(py_workers,dt=0.01,action=None):
    # messure time
    data={}
    for k in list(py_workers.keys()):
        data.update({k:{}})
    for k in list(py_workers.keys()):
        _data,py_workers=check_py_worker_0(k,py_workers)
        data[k].update(_data)
    sleep(dt)
    for k in list(py_workers.keys()):
        _data,py_workers=check_py_worker_1( k, py_workers, vim.vars['py_workers_status_report_'+k])
        data[k].update(_data)
    for k in py_workers.keys():
        if not ((dt* 0.667) < (data[k]['t1'] - data[k]['t0']) < (dt * 1.5)):
            print("pyw "+k+" unresponsponsive")
            if action=='term':
                py_workers[k].terminate()
            if action=='kill':
                py_workers[k].kill()
            py_workers=gen_new_py_worker(k,py_workers)
    return py_workers                       #}}}
#" vim: set foldmethod=marker foldlevel=0      :
