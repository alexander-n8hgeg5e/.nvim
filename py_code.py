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
    p=vim.vars['pyvar_includeexpr']
    l=p.split("/")
    l2=vim.call("expand","%p").split("/")
    dirlist=[]
    for i in range(len(l)):
        for j in range(len(l2)):
            dirlist.append("/".join(l2[:-j]+l[i:]))
    l_dirs=[]
    l_files=[]
    tex_suffix= True if vim.eval('&filetype') in ['tex','plaintex'] else False
    for pp in dirlist:
        if path.exists(pp):
            if path.isdir(pp):
                l_dirs.append(pp)
            else:
                l_files.append(pp)
    if tex_suffix:
        for p in dirlist:
            pp=p+".tex"
            if path.exists(pp):
                l_files.append(pp)
    if len(l_files) > 0:
        l_files.sort(key=len,reverse=True)
        return l_files[0]
    if len(l_dirs) > 0:
        l_dirs.sort(key=len,reverse=True)
        return l_dirs[0]
"""
pycode.add_pycode( name , code ,uses_vim_vars=['pyvar_includeexpr'],doc=doc)

# vim: set syntax=py_worker_code      :
