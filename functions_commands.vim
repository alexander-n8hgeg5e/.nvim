function! Rsync_root_edit(host,path)
    let path=expand(a:path)
    silent exe 'e rsync://root@' . a:host . ':' . path
    py3 << EOF
ip ='/var/src/pylib'
if not sys.path[0] == ip:
    sys.path.insert(0,ip)
from pylib import path_utils
import importlib
importlib.reload(path_utils)
EOF
    let pycmd = 'path_utils.shorten_uniq("' . path . '",l=8)'
    let tabname = 'root@' . a:host . ':' .  py3eval(pycmd)
    call SetTabName(tabname)
endfunction
