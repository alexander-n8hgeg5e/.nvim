
#!python3
"""
this prog runs
python cmds received from stdin linewise
the prog connects to nvim by default
and needs the socket as first argument
"""
logfilepath = "/tmp/py_worker_error_log"
import pynvim
from sys import argv,exit
from sys import stdin,stdout,stderr
from os import linesep as lsep
from time import time,sleep
from traceback import format_tb
from os import set_blocking
from math import ceil
from pylib.file_utils.py_split import split_file_on_sep

name = argv[2]
socketpath=argv[1]


nvim = pynvim.attach( "socket", path=socketpath )

cmds=[]
do_log=True
flush_instantly=False
buflen_blocking=1
buflen_nonblocking=1024

def log(bin_msg,flush=False,file=stdout,cmd_log_max_len_half=50):
    if not type(bin_msg) is str:
        if type(bin_msg) is bytes:
            logmsg = bin_msg.decode()
        else:
            logmsg = str(bin_msg)
    else:
        logmsg=bin_msg
    if not logmsg[-1]=="\n":
        logmsg+="\n"
    if len(logmsg) > 2 * cmd_log_max_len_half:
        logmsg=logmsg[:cmd_log_max_len_half]+"\n...skipped...\n" + logmsg[ - cmd_log_max_len_half:]
    print(logmsg,file=file)
    if flush_instantly or flush:
        file.flush()

def run_cmds():
    while len(cmds) > 0: # something to do
        cmd=cmds.pop()
        try:
            exec(cmd)
        except:
            if do_log:
                log("ERROR, Exception during cmd:",file=stderr)
                log( cmd, file=stderr,flush=True, cmd_log_max_len_half=2000 )
            raise
        if do_log:
            log("cmd:")
            log( cmd )

    log("pyworker "+name+" from nvim "+socketpath+" is done with cmds and waiting for new ones.")
    stdout.flush()
    stderr.flush()

buflen=buflen_blocking
print("py worker "+name+" is waiting for cmds from nvim "+ socketpath  +"\n")
stdout.flush()
cmds=[]
data=b''
while True:
    t=time()
    _data=stdin.buffer.read(buflen)
    if _data:
        # store it 
        data+=_data
        # speed up
        buflen=buflen_nonblocking
        set_blocking(stdin.buffer.fileno(),False)
        while True:
            # loop to process all data
            # maybe its much
            # check for end
            pos=data.find(b'\x00')
            # the last would not be enough to have the full code
            # double zero byte marks the end
            # if the sender could not send the full code
            # he marks the already sent stuff as inst
            if pos != -1 and pos+1 != len(data):
                if data[pos+1] == 0 :
                    # code pack is fully received
                    cmds.append(data[:pos])
                    data=data[pos+1:]
                    run_cmds()
                else:
                    # transmission was interrupted
                    # discard the data but not the non null byte
                    data=data[pos+1:]
            else:
                ## need to read more
                break
    else:
        # slow down , do not eat the cpu
        buflen=buflen_blocking
        set_blocking(stdin.buffer.fileno(),True)

raise Exception("ERROR: py worker refuses to do any more work")
