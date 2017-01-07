'''
Created on Jan 6, 2017

@author: Administrator
'''
import os
import sys
from fnmatch import fnmatch
from subprocess import call

home_dir = "/home/chesbuild/rpmbuild/RPMS"
platforms = ["x86_32", "x86_64"]

build_number = sys.argv[1]
platform = sys.argv[2]

if platform in platforms:
   path = str(home_dir)+"/"+str(platform)
   os.chdir(path)
   
   for x in ["hidapi", "llapi", "hlapi", "llapitestapp", "hlapitestapp", "nritranslationlibrary", "ingenicotranslationlibrary", "nv9translationlibrary", "Kiosk3Library", "secureheadmsrlibrary", "Kiosk3TranslationLibrary", "secureheadtranslationlibrary"]:
	active_path = x+"/"+x+"-2.0-"+str(build_number)
	os.chdir(active_path)
	call('ls')
	os.chdir(path)   


