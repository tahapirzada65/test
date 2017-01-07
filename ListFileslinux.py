'''
Created on Jan 6, 2017

@author: Administrator
'''
import os
import sys
from fnmatch import fnmatch

home_dir = "/home/chesbuild/rpmbuild/RPMS"
platforms = ["x86_32", "x86_64"]

build_number = sys.argv[1]
platform = sys.argv[2]

# Write the location of these executables in the configuration files
config = r'/home/chesbuild/rpmbuild/scripts/codesign/config.ini'
cert_name = "[IOTG RSD Visual Retail]"

os.remove(config)
file = open(config, 'w')
file.write(str(cert_name)+"\n")

def absoluteFilePaths(directory, pattern):
    for dirpath,_,filenames in os.walk(directory):
        for f in filenames:
            if fnmatch(f, pattern):
                old = str(os.path.abspath(os.path.join(dirpath, f)))
                file.write(str(old.replace('C:\\', ''))+"\n")

if platform in platforms:
    path = str(home_dir)+"/"+str(platform)
    os.chdir(path)
   
    for x in ["hidapi", "llapi", "hlapi", "llapitestapp", "hlapitestapp", "nritranslationlibrary", "ingenicotranslationlibrary", "nv9translationlibrary", "Kiosk3Library", "secureheadmsrlibrary", "Kiosk3TranslationLibrary", "secureheadtranslationlibrary"]:
        absolute_path = path+x+"/"+x+"-2.0-"+str(build_number)
        absoluteFilePaths(absolute_path, "*.rpm")
        os.chdir(path)   

file.close()
