#!python3

from sys import argv
import pynvim
nvim = pynvim.attach( "socket", path=argv[1] )

exec(argv[2])
