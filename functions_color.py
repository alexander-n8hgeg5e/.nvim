#!/usr/bin/python3
from os import environ
import neovim
path=environ['NVIM_LISTEN_ADDRESS']
nvim = neovim.attach('socket',path=path)

def Daytimecolor():
    """
    returns colorschemename.
    uses list and the systems clock.
    """
    from datetime import datetime
    hr = datetime.today().hour
    if ( hr <= 3 ):   #   0 o'clock  < time <=  3 o'clock
        i = 0
    
    elif ( hr <= 7 ):   #  3 o'clock  < time <=  7 o'clock
        i = 1
    
    elif ( hr <= 14 ):  #  7 o'clock  < time <= 14 o'clock
        i = 2
    
    elif ( hr <= 18 ):  # 14 o'clock  < time <= 18 o'clock
        i = 3
    
    else:               # 18 o'clock  < time <=  0 o'clock
        i = 4
    
    return nvim.eval("g:nowcolors").split()[i]

Daytimecolor()
