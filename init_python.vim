

py3file $vcd/init_python_import.py
py3file $vcd/init_suntimes.py
py3file $vcd/py_worker_tools.py
py3file $vcd/py_code.py
py3file $vcd/init_py_worker.py


py3 vcd=environ["vcd"]

"py3 nvim = pynvim.attach( "socket", path=vim.vvars["servername"] )
