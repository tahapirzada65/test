'''
Created on Jan 6, 2017

@author: Administrator
'''
import os
import sys
from fnmatch import fnmatch
from subprocess import call

home_dir = "/home/chesbuild/rpmbuild/RPMS"
platforms = ["galileo-3", "Broadwell-32", "Baytrail-x64-2", "Broadwell-x64", "Haswell-x64-2", "BYT-x32", "x86_32", "x86_64"]

for platform in platforms:
    command = "cd "+str(home_dir)+"/"+str(platform)
    call(command)
    call('cd  "$(\ls -1dt ./*/ | head -n 1)"')
    print command