#!/usr/bin/env python3
import neovim
from  subprocess import call
@neovim.plugin
class PimpTheNeoVim(object):

    def __init__(self, nvim):
        self.nvim = nvim

    @neovim.command('OpenBrowserpy', range='', nargs='*', sync=False)
    def command_handler(self, args, range):
        call(['rind','qutebrowser'])
