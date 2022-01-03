#!python3
import subprocess
from os import environ
from os.path import sep as psep
import traceback

class Py_worker_error(Exception):
    def __init__(self, name, msg=[] , py_worker=None):
        if not type(msg is list):
            self.msg=[msg]
        if len(self.msg) == 0:
            self.msg=['ERROR: something erroneous happended to a py worker.']
        self.msg+= [ "Py worker's pool key: " + str(name) ]
        if not py_worker is None:
            self.py_worker=py_worker
            self.msg+= ["exit code: "+str(self.py_worker.poll())]
        super().__init__("\n".join(self.msg))

class Py_worker_crash_error(Py_worker_error):
    def __init__(self, name, msg=[] , py_worker=None):
        if len(msg) == 0 :
            self.msg=["Py worker crashed."]
        super().__init__(name,msg=self.msg,py_worker=py_worker)

class Py_worker_start_error(Py_worker_crash_error):
    def __init__(self, name, py_worker=None):
        self.msg=["ERROR: Failed to start py worker"]
        super().__init__(name,msg=self.msg,py_worker=py_worker)

class Py_worker_need_restart_error(Py_worker_crash_error):
    def __init__(self, name, py_worker=None):
        self.msg=["ERROR: pyworker crashed and needs restart, restarting crashed py worker..."]
        super().__init__(name,msg=self.msg,py_worker=py_worker)


class Py_worker(subprocess.Popen):

    @classmethod
    def terminate_pycode(cls,cmd):
        return cmd.encode() + b"\x00\x00"

    pyfile=environ["vcd"]+psep+"py_worker.py"

    def __init__( self, name , logfilepath ):
        self.name=name
        self.cls=self.__class__
        self.logfilepath=logfilepath
        if self.logfilepath == "syslog":
            self.logger  = subprocess.Popen(['logger', '-p', 'user.err'] , stdin=subprocess.PIPE)
            self.logfile = self.logger.stdin
        else:
            self.logfile = open(self.logfilepath,mode="ab")
        super().__init__( [ "python3" , 
                            self.cls.pyfile,
                            vim.vvars['servername'],
                            name
                          ],
                          start_new_session=False,
                          stdin=subprocess.PIPE,
                          stdout=self.logfile,
                          stderr=self.logfile,
                        )
        set_blocking( self.stdin.raw.fileno(),  False )

    def run_pycode( self, code ,flush=True):
        pycmd = self.cls.terminate_pycode( code )
        l=len(pycmd)
        wsum=0
        while wsum < l:
            w=self.stdin.raw.write( pycmd )
            if not w is None:
                wsum+=w
                if flush:
                    self.stdin.raw.flush()
    def __del__(self):
        if self.logfilepath == "syslog":
            try:
                t0=time()
                self.logger.terminate()
                while self.logger.poll() is None:
                    sleep(0.0001)
                    t=time()-t0
                    if t > 0.1:
                        from warnings import warn
                        if self.logger.poll is None:
                            warn(f"logger of pyworker \"{self.name}\" refuses to terminate in time")
                        break
                #t=time()-t0
                #print(f"time logger of pyworker {self.name}: {t}[s]")
            finally:
                self.logger.kill()
                self.logger.wait
        else:
            self.logfile.close()


class Py_worker_pool(dict):

    logfilepath="syslog"

    @staticmethod
    def vim_escape(msg):
        '''
        # vim esape the msg ' -> ''
        # and surround it with single '
        '''
        return "'" +  re.sub( "[']", "''", msg ) + "'"
    
    @staticmethod
    def py_escape(msg):
        return "'"+re.sub("'","\\'" , msg )+"'"

    def __init__(self, *z, size=2, **zz):
        """
        only runs ones at vim start
        so not as time critical as run_pycode
        """
        super().__init__( *z, **zz )
        self.cls=self.__class__
        self.size=size
        self.logfilepath=self.cls.logfilepath
        for i in range(self.size):
            name=str(i)
            self.update({ name : Py_worker(name,self.logfilepath) })
        self._keylist=list(self.keys())
        self.cycle_key= -1
        self.cycle_end= len(self) - 1

    def nvim_msg( self, msg,flush=True ):
        nvimcmd = " ".join([ 'echo', self.cls.vim_escape(msg) ])
        self.nvim_cmd(nvimcmd,flush=flush)
        
    def nvim_cmd( self,  cmd , flush=True):
        cmd='nvim.command(' + self.cls.py_escape( cmd ) + ')' + lsep
        self.run_pycode(cmd,flush=flush)

    def cycle_keys(self):
        if self.cycle_key == self.cycle_end:
            self.cycle_key = -1
        self.cycle_key += 1
        return str(self.cycle_key)
            
    def run_pycode(self,cmd,flush=True):
        name=self.cycle_keys()
        try:
            self[name].run_pycode(cmd, flush=flush)
        except BrokenPipeError:
            self[name]=Py_worker(name,self.logfilepath)
            self[name].run_pycode(cmd, flush=flush)

    def __del__(self):
        try:
            t0=time()
            for v in self.values():
                v.terminate()
            while any([v.poll() is None for v in self.values()]):
                sleep(0.001)
                t = time() - t0
                if t > 0.2:
                    from warnings import warn
                    for v in self.values():
                        if v.poll() is None:
                            warn(f"pyworker \"{v.name}\" refuses to terminate in time")
            #t = time() - t0
            #print(f"pool termination time: {t}[s]")
        finally:
            for v in self.values():
                v.kill()
                v.wait()

# vim: set foldmethod=indent foldlevel=0 :
