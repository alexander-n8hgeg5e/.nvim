from os import listdir
from os import environ
from os.path import sep as psep
from os import linesep as lsep

vimfiles_list_filename="vimfiles.list"
vim_config_dir=environ['HOME']+psep+".config/nvim"
dirlist = listdir(vim_config_dir)
vimfiles_list_path = vim_config_dir + psep + vimfiles_list_filename

vimfiles=[]
for i in dirlist:
    if i[-4:]== ".vim":
        vimfiles.append(i)

vimfiles.sort()

with open(vimfiles_list_path,'wt') as f:
    for vf in vimfiles:
        f.write(vf+lsep)
