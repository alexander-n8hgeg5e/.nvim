#!/usr/bin/python3
from os import environ
from time import sleep
import neovim
import subprocess as sp
path=environ['NVIM_LISTEN_ADDRESS']
nvim = neovim.attach('socket',path=path)
nvim.command('set verbosefile=""')
sp.call(["rm", "/tmp/v"])
nvim.command('set verbosefile=/tmp/v')
nvim.command('set verbose=15')
sleep(1); nvim.feedkeys(nvim.replace_termcodes('<C-Up>'),options='t',escape_csi=False)
sleep(1)
nvim.command('set verbose=0')
