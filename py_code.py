#!python3
from base64 import b64encode

class Py_code(dict):
    def __init__(self,*z,**zz):
        super().__init__(*z,**zz)
    def add_pycode(self, name, code, uses_vim_vars=[] ,doc=""):
        self.update({
                        name : {
                                'code':code ,
                                'uses_vim_vars':uses_vim_vars ,
                                'doc': doc ,
                               }
                    })
    def b64name(self,name):
        return re.sub( b'=', b'', b64encode(name.encode())).decode()


pycode=Py_code()





name = '''wait_buf_exists_set_bufmodified_bufvar'''
code="""
bufnr=int(nvim.vars["pyvar_0"])
c=0
while not nvim.call('bufnr', bufnr ) == bufnr:
    sleep(0.1)
    c+=1
    if c>10:
        print("ERROR: timeout")
        exit(1)
modified=nvim.eval("&modified")

nvim.call("setbufvar", bufnr ,'modified', modified  )
"""
pycode.add_pycode( name , code ,uses_vim_vars=['pyvar_0'])


name='tmux_status_line_checker'
doc="""Checks for valid tmux statusline at the last line of the current buffer.
If you switch buffers, new buffer will be checked from then on.
"""
code="""
from time import sleep
from pprint import pformat

count=100
line=nvim.call("getline","$")
if len(line)==0:
    line=" "
while not line[0] == "|":
    line=nvim.call("getline","$")
    if len(line)==0:
        line=" "
    sleep(0.01)
    count-=1
    if count==0:
        break

if count > 0:
    log('waited '+str(100-count)+"times 10ms"+lsep)
    nvim.call("Tmux_finish_exit_copy_mode")
else:
    log('timeout'+lsep)
"""
pycode.add_pycode( name , code ,uses_vim_vars=['pyvar_0'],doc=doc)

name='poll_grep_sub_buffer'
doc="""searches the buffer for regex (re.match) and if found does a
substitution ,then runs a vim function with the substitution as arg
repeats until timeout is reached
"""
code="""
try:
    if not 'pyvar_poll_grep_sub_buffer_input' in nvim.vars:
        nvim.vars['pyvar_poll_grep_sub_buffer_input']=   {
                                                            'range_start': None,
                                                            'range_end': None,
                                                            'timeout': None,
                                                            'match_expr': None,
                                                            'sub_match_expr': None,
                                                            'sub_sub_expr': None,
                                                            'callback_func_name': None,
                                                        }
    input=nvim.vars['pyvar_poll_grep_sub_buffer_input']
    
    for r in "range_start","range_end":
        if type(input[r]) is int:
            input[r]=str(input[r])
    
    results=[]
    t0=time()
    counter=0
    while True:
        lines=nvim.call("getbufline","%",input['range_start'],input["range_end"])
        for line in lines:
            log(line)
            if re.match(input['match_expr'],line):
                log("match",flush=True)
                results.append(re.sub(input['sub_match_expr'],input['sub_sub_expr'],line))
                nvim.call(input['callback_func_name'],result[-1])
        if counter % 10  == 0 and time()-t0 >= input['timeout']:
            break
    log(results,cmd_log_max_len_half=5000)

except Exception as e:
    for line in format_tb(e.__traceback__):
        log(line,cmd_log_max_len_half=inf)
    log(e,cmd_log_max_len_half=inf)
"""
pycode.add_pycode( name , code ,uses_vim_vars=['pyvar_poll_grep_sub_buffer_input'],doc=doc)


name='load_and_run_python_script'
varname = 'pyvar_'+ pycode.b64name(name[5:10])
doc="""only python >= 3.6"""
code="""
with open(nvim.vars['""" + varname + """'] , 'rb' ) as f:
    code=f.read()
    exec(code)
"""
pycode.add_pycode( name , code ,uses_vim_vars=[ varname ],doc=doc)


name='split_clipboard'
doc="""only python >= 3.6"""
code="""
split_file_on_sep('/dev/shm/sodufosuuu',sep=b"\\x00\\x00",reverse=True)
"""
pycode.add_pycode( name , code ,uses_vim_vars=[],doc=doc)

name='find_file_for_includeexpr'
doc="""only python >= 3.6"""
code="""
def find_file_for_includeexpr():
    l_dirs=[]
    l_files=[]
    FLAG_TEX = 1
    flags = 0
    flags |= FLAG_TEX if vim.eval('&filetype') in ['tex','plaintex'] else 0
    def do(s,flags=0):
        s=re.sub(r'[:][0-9]+$','',s)
        if flags > 0:
            if FLAG_TEX in flags:
                s_ = s + '.tex'
                if path.isfile(s_):
                    return s_
            if path.isfile(s):
                l_dirs.append(s)
            if path.isdir(s):
                l_dirs.append(s)
        else:
            if path.isfile(s):
                return s
            if path.isdir(s):
                l_dirs.append(s)
    words2check=vim.vars['pyvar_includeexpr']
    #pwp.run_pycode(f'log(\"words2check:\"+\"{words2check}\",cmd_log_max_len_half=5000)')
    path_roots=[]
    pathes=[]
    if vim.eval('&buftype') == 'terminal':
        tmux_cmdbase = vim.eval('b:tmux_cmdbase')
        pane_id = vim.eval('b:tmux_data')['pane_id']
        cmd = tmux_cmdbase.split(" ") + [ 'list-panes','-t',pane_id, '-F', '#{pane_current_path}']
        cwd = subprocess.check_output(cmd).decode().strip()
        path_roots.append(cwd)
        #pwp.run_pycode(f'log(\"path_roots:\"+\"{path_roots}\")')
    else:
        path_roots.append(vim.call("expand","%:h"))
        path_roots.append(path.dirname(vim.call("expand","%:p")))
    # infinity "quad" loop
    for word in words2check:
        for root in path_roots:
            l =  root.split("/")
            l2  =  word.split("/")
            # all the beginnings and all the ends
            # all shortened and full versions combined
            ll=len(l)
            for i in range(len(l)):
                for j in range(len(l2)):
                    p2c = "/".join(l[:ll-i]+l2[j:])
                    r = do(p2c,flags=flags)
                    if not r is None:
                        return r
    #pwp.run_pycode(f'log(\"pathes:\"+\"{pathes}\",cmd_log_max_len_half=5000)')
    if len(l_files) > 0:
        l_files.sort(key=len,reverse=True)
        return l_files[0]
    if len(l_dirs) > 0:
        l_dirs.sort(key=len,reverse=True)
        return l_dirs[0]
"""
pycode.add_pycode( name , code ,uses_vim_vars=['pyvar_includeexpr'],doc=doc)

name='clipboard_update_xorg_s'
doc="""only python >= 3.6"""
code="""
clipboard_file_path=os.environ['CLIPBOARD_FILE']
data=nvim.eval('@"').encode(encoding="utf-8")
displays=pylib.list_utils.uniq([i['x_server'] for i in pylib.screen_utils.parse_screen_layout_env_var_v3()])
for display in displays:
    os.environ['DISPLAY']=display
    cmd=["xclip", "-selection", "primary"] # 'primary' is  middle mouse , 'clipboard' ctrl-v
    p=subprocess.Popen(cmd,stdin=subprocess.PIPE,env=os.environ)
    p.communicate(input=data)
    if p.returncode != 0 and re.match("\S+:[0-9.]+",display):
        display = ":"+ display.split(":")[1]
        os.environ['DISPLAY']=display
        p=subprocess.Popen(cmd,stdin=subprocess.PIPE,env=os.environ)
        p.communicate(input=data)
        if not p.returncode == 0:
            raise subprocess.CalledProcessError(p.returncode,cmd) # TODO: add args
"""
pycode.add_pycode( name , code ,uses_vim_vars=[],doc=doc)

name='clipboard_update_xorg_p'
doc="""only python >= 3.6"""
code="""
clipboard_file_path=os.environ['CLIPBOARD_FILE']
data=nvim.eval('@"').encode(encoding="utf-8")
displays=pylib.list_utils.uniq([i['x_server'] for i in pylib.screen_utils.parse_screen_layout_env_var_v3()])
for display in displays:
    os.environ['DISPLAY']=display
    cmd=["xclip", "-selection", "clipboard"] # 'primary' is  middle mouse , 'clipboard' ctrl-v
    p=subprocess.Popen(cmd,stdin=subprocess.PIPE,env=os.environ)
    p.communicate(input=data)
    if p.returncode != 0 and re.match("\S+:[0-9.]+",display):
        display = ":"+ display.split(":")[1]
        os.environ['DISPLAY']=display
        p=subprocess.Popen(cmd,stdin=subprocess.PIPE,env=os.environ)
        p.communicate(input=data)
        if not p.returncode == 0:
            raise subprocess.CalledProcessError(p.returncode,cmd) # TODO: add args
"""
pycode.add_pycode( name , code ,uses_vim_vars=[],doc=doc)

name="tmux-sessions_open_non-attached"
doc="""Opens all tmux sessions that were created by keybind and are currently not connected."""
code="""
cmd =   [
        "tmux", "-S",
        nvim.vars['tmux_socket'],
        "list-sessions", "-F" ,
        '#{session_attached} #{session_name}\\n' 
        ]
outp = subprocess.check_output( cmd ).decode().split("\\n")
outp=[o.strip() for o in outp]
a=[]
for o in outp:
    if re.match( "^0 [a-zA-Z0-9]{6}(_+[0-9][0-9]*){4}(__.*$)?" ,o ):
        a.append(o[2:])
tmux_sessions = a
for tmux_session in tmux_sessions:
    nvim.command("tabnew")
    nvim.eval(f'Create_Terminal_buffer(\"\",\"{tmux_session}\",\"\")')
"""
pycode.add_pycode( name , code ,uses_vim_vars=['tmux_socket'],doc=doc )

# vim: set syntax=py_worker_code     foldmethod=syntax foldlevel=0:
