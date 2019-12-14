

offset=localtime().tm_hour*3600+localtime().tm_min*60-gmtime().tm_hour*3600-gmtime().tm_min*60
sun=Sun()
coords=vim.eval("g:coords")
for k,v in coords.items():
    coords[k]=float(v)
dawntime=sun.getSunriseTime(coords)
dusktime=sun.getSunsetTime(coords)
dawnhour = dawntime['hr']+ dawntime['min']/60  + offset/3600
duskhour = dusktime['hr']+ dusktime['min']/60  + offset/3600
vim.command("let g:dawntime="+str(dawnhour))
vim.command("let g:dusktime="+str(duskhour))
