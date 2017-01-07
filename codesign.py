#!/usr/bin/env python -tt

#
# IDENTIFICATION SECTION
# FILE NAME      : codesign.py
# COMPLETED DATE : 02/17/2015
# UPDATED        : 03/05/2015
# PURPOSE        : ECSS Code Sign Automation
# DESCRIPTION    : This script is to automate the code signning process
# SUPPORTED OS   : Windows & Linux
# AUTHOR         : Tan, Roy Lee Keen
# EMAIL          : roy.lee.keen.tan@intel.com
# TEAM           : IOTG PED SW ESC
#

import os, errno, sys, platform, getpass, getopt, subprocess, re, time, random

# Python 2.7 and above compatibility. Import with the correct module name.
if re.match('^2.7', sys.version):
    import ConfigParser
    from BaseHTTPServer import BaseHTTPRequestHandler
    from urllib2 import Request, urlopen, URLError, HTTPError
else:
    import configparser as ConfigParser
    from urllib.request import Request, urlopen
    from urllib.error import URLError, HTTPError
    from http.server import BaseHTTPRequestHandler
    raw_input = input

# Base path, script path and script name
base_path   = os.getcwd()
script_path = os.path.dirname(os.path.realpath(__file__))
script_name = os.path.basename(os.path.realpath(__file__))

# Global variables and dictionary
os_type, os_bit, slash, tmp_path, username, password, configfile, signfile_path, signfile_name = [None] * 9
signfile_options = []
container = {}

# Error exit mode
OTHER_ERR  = 1
SYNTAX_ERR = 2

# Variable/dictionary/list may change
intel_domain    = ['amr', 'ccr', 'gar', 'ger']
os_type_list    = {'AMD64':64, 'x86_64':64, 'x86':32, 'i686':32, 'i386':32}
tool_path       = r'https://ubit-artifactory-sh.intel.com/artifactory/esc-local/utils/codesign/3.2.278'
urls            = ['{0}/SignFile.config.xml'.format(tool_path), '{0}/SignFile.info.xsl'.format(tool_path)]


# Output usage information or error messages
def exit_output(mode = 0, usage = True, errmsg = None):
    # Output error message if available
    if errmsg:
        if mode == SYNTAX_ERR: errmsg = "\nSYNTAX ERROR: {0}".format(errmsg)
        else: errmsg = "\nERROR: {0}".format(errmsg)
        print("{0}\n".format(errmsg))

    # Usage menu
    if usage:
        print('Usage: {0} -c <CONFIG FILE> [OPTIONS]\n'.format(script_name))
        print('Required parameter:')
        print(' -c or --config <CONFIG FILE>         Configuration file which store the')
        print('                                      certificate(s) and file(s) information.\n')
        print('Optional parameters:')
        print(' -u or --username <DOMAIN\IDSID>      User name to login ECSS. Make sure you have')
        print('                                      signer role for the project.\n')
        print(' -p or --password <PASSWORD>          Password for the specified username.\n')
        print(' -b or --basedir <BASE DIRECTORY>     Base directory is the directory containing')
        print('                                      the file(s) to be signed. By default it is')
        print('                                      set to the current working directory.\n')
        print(' -a                                   (Windows) Sign all files with cross-certificate.')
        print('                                      It will be selected automatically depending on')
        print('                                      the certificate used for signing.')
        print('Example:')
        print('{0} -c <CONFIG FILE>'.format(script_name))
        print('{0} -c <CONFIG FILE> -b <BASE DIRECTORY>'.format(script_name))
        print('{0} -c <CONFIG FILE> -u <DOMAIN\IDSID> -p <PASSWORD> -b <BASE DIRECTORY>\n'.format(script_name))
        print('Note: This script require Python 2.7 and above.')

    sys.exit(mode)

# Verify OS version and bit
def verify_os():
    global os_type, os_bit, slash, tmp_path, signfile_name

    os_bit = os_type_list.get(platform.machine(), None)

    if os.name == 'nt' and re.match('32|64', str(os_bit)):
        os_type       = 'windows'
        tmp_path      = r'C:\TEMP'
        slash         = '\\'
        signfile_name = 'SignFile.exe'
        if not os.path.exists(tmp_path): os.makedirs(tmp_path)
    elif os.name == 'posix' and re.match('32|64', str(os_bit)):
        os_type       = 'linux'
        tmp_path      = '/tmp'
        slash         = '/'
        signfile_name = 'SignFile'
    else:
        msg = '{0}, {1}, problem to determine the OS version.'.format(os.name, platform.machine())
        exit_output(mode = OTHER_ERR, usage = False, errmsg = msg)

# Verify option(s) and arguement(s)
def arguement_verification(argv):
    global username, password, configfile, base_path, signfile_options

    # Get options and arguments
    try:
        opts, args = getopt.getopt(argv, "hu:p:c:b:a", ["help", "username=", "password=", "config=", "basedir="])
    except getopt.GetoptError as e:
        exit_output(mode = SYNTAX_ERR, errmsg = e)

    # Verify options and arguments
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            exit_output()
        elif opt in ("-u", "--username"):
            username = arg
        elif opt in ("-p", "--password"):
            password = '"{0}"'.format(arg)
        elif opt in ("-c", "--config"):
            configfile = arg
        elif opt in ("-b", "--basedir"):
            base_path = arg
            base_path = base_path.rstrip('\\')
            base_path = base_path.rstrip('/')
        elif opt in ("-a"):
            signfile_options.append('-a')

    if not opts:
        exit_output()
    elif (username and not password) or (not username and password):
        exit_output(mode = SYNTAX_ERR, errmsg = 'both options -u and -p are required if either one is called.')
    elif not configfile:
        exit_output(mode = SYNTAX_ERR, errmsg = 'option -c is required.')
    elif not os.path.exists(configfile):
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "Config file doesn't exists, {0}.".format(configfile))
    elif not os.path.exists(base_path):
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "Base directory does't exist, {0}.".format(base_path))
    elif not username and not password:
        loginmsg = 'User <domain>\\<IDSID>: '
        username = raw_input(loginmsg) if re.match('^2.7', sys.version) else input(loginmsg)
        if username_validation(username): password = '"{0}"'.format(getpass.getpass())
    else:
        username_validation(username)

    if os_type == 'linux': username = "'{0}'".format(username)

# Username validation
def username_validation(usr = None):
    if not usr:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = 'Username cannot be null.')
    elif len(usr.split('\\')) != 2:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = 'Invalid username.')
    elif usr.partition('\\')[0].lower() not in intel_domain:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = 'Invalid domain name.')
    else:
        return True

# Download SignFile tool
def download_signfile_tool():
    global os_type, os_bit, slash, urls, signfile_path, signfile_name, tmp_path, username

    # Download the SignFile tool from artifactory
    print('OS Type : {0}'.format(os_type))
    print('OS Bit  : {0}'.format(os_bit))

    urls.extend(['{0}/{1}{2}/{3}'.format(tool_path, os_type, os_bit, signfile_name)])
    signfile_path = '{0}{1}{2}'.format(script_path, slash, signfile_name)

    for url in urls:
        print('Download: {0}'.format(url))

        filename = url.split('/')[-1]
        destination = '{0}{1}{2}'.format(script_path, slash, filename)

        if os.path.exists(destination): os.remove(destination)

        req = Request(url)
        req.add_header('Cache-Control', 'max-age=0')
        try:
            response = urlopen(req)
        except HTTPError as e:
            shorterr, longerr = BaseHTTPRequestHandler.responses[e.code](0)
            exit_output(OTHER_ERR, usage = False, errmsg = 'HTTPError [Errno {0}] {1}'.format(e.code, shorterr))
        except URLError as e:
            exit_output(OTHER_ERR, usage = False, errmsg = 'URLError {0}'.format(e.reason))
        else:
            dlfile = writefile(destination)
            dlfile.write(response.read())
            dlfile.close()

    if os_type == 'linux': os.chmod(signfile_path, 0O755)

    print('Status  : Success')

# Verify the existence of certificate(s) and file(s)
def verify_certs_files():
    global username, password, slash, configfile, container, signfile_path

    # Dictionary and list to store error
    certserr  = {}
    fileserr  = []
    totalfile = 0

    # Read config file
    config = ConfigParser.ConfigParser(allow_no_value=True)
    config.optionxform = str

    try:
        config.read(configfile)
    except:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "Invalid format of configuration file, {0}.".format(configfile))

    # Verify existence of certificate(s)
    certificates = config.sections()

    for cert in certificates:
        cmd = "{0} -vv -u {1} -p {2} -c \"{3}\"".format(signfile_path, username, password, cert)
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
        out, err = process.communicate()

        if re.search(r'.+non-existing certificate.+', err.decode(), re.I):
            certserr[cert] = "doesn't exist"
        elif re.search(r'.+not authorized to sign.+', err.decode(), re.I):
            certserr[cert] = "not authorized".format(username)
        elif re.search(r'.+Error code: 401 Unauthorized', err.decode(), re.I):
            exit_output(mode = OTHER_ERR, usage = False, errmsg = "Invalid username or password.")
        elif err:
            exit_output(mode = OTHER_ERR, usage = False, errmsg = "Unexpected error.\n{0}".format(err))

        container[cert] = config.options(cert)

    if certserr:
        for cert, err in certserr.items():
            print("Certificate: {0} <-- {1}.".format(cert, err))
    else:
        print('Certificate(s): {0}'.format(len(certificates)))

    # Verify existence of file(s)    
    for cert, files in container.items():
        totalfile += len(files)
        for file in files:
            tmp_file = file.replace('/', '\\') if os_type == 'windows' else file.replace('\\', '/')
            filepath = '{0}{1}{2}'.format(base_path, slash, tmp_file)

            if not os.path.exists(filepath):
                fileserr.extend([filepath])
            else:
                fileindex = files.index(file)
                files[fileindex] = filepath

    if fileserr:
        for file in fileserr:
            print("File: {0} <-- doesn't exist.".format(file))
    else:
        print('File(s)       : {0}'.format(totalfile))

    # Exit with error message if certificate(s) or file(s) problem.
    if certserr and not fileserr:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "Certificate(s) doesn't exist and/or {0} is not authorized.".format(username))
    elif not certserr and fileserr:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "The listed file(s) doesn't exist.")
    elif certserr and fileserr:
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "Make sure the certificate(s) and file(s) exist and {0} is authorized to sign.".format(username))
    else:
        print('Status        : Success')

# Perform sign file(s)
def perform_sign_file():
    global username, password, slash, tmp_path, container

    # Check each certificate
    datetime = time.strftime("%y%m%d_%H%M%S") + "_" + str(random.randint(1000,9999))
    for cert, files in container.items():
        filename = None

        # Get the total number of file to be signed
        totalfiles = len(files)

        # Generate the temporary file list
        tmp_certname = cert.replace(' ', '_')
        filename = '{0}{1}codesign_{2}_{3}'.format(tmp_path, slash, tmp_certname, datetime)
        filelist = writefile(filename)

        for file in files:
            file = '{0}\n'.format(file)
            filelist.write(bytes(file.encode('utf-8')))

        filelist.close()

        # Perform sign file(s)
        cmd = "{0} -vv -u {1} -p {2} {3} -c \"{4}\" -f {5}".format(signfile_path, username, password, " ".join(signfile_options), cert, filename)

        print('Certificate  : {0}'.format(cert))
        print('File List    : {0}'.format(filename))
        print('Total file(s): {0}'.format(totalfiles))
        print('Command      : {0} -vv -u {1} -p **** {2} -c {3} -f {4}'.format(signfile_path, username, " ".join(signfile_options), cert, filename))

        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
        out, err = process.communicate()
        os.remove(filename)

        out = out.decode()
        result = re.search("\W*Total\sfiles\sprocessed[^:]*:\D*(\d+)\W*Signed with success[^:]*:\D*(\d+)", out)

        # Exit with error message if sign problem occur.
        if err or totalfiles != int(result.group(1)) or totalfiles != int(result.group(2)):
            if err:
                print("\n[ERROR OUTPUT]\n", err)
                msg = "Problem with file signing."
            else:
                print('\n[RESULT OUTPUT]')
                sign_result(out, filename)
                msg = "Some of the file(s) not sign."

            exit_output(mode = OTHER_ERR, usage = False, errmsg = msg)
        else:
            print('\n[RESULT OUTPUT]')
            sign_result(out, filename)
            print('Status: Success\n\n')

# Sign Result
def sign_result(result = None, filename = None):
    output = result.split('\r\n') if os_type == 'windows' else result.split('\n')
    for line in output:
        if line:
            if re.match('^(SignFile|Session\sID)', line): print('{0}\n'.format(line))
            elif re.match('^Total\sfiles\sprocessed', line): print('\n{0}\n{1}\n'.format(line, '-' * 85))
            else: print(line)

# Write file
def writefile(filename = None):
    try:
        filelist = open(filename, 'wb')
    except IOError as e:
        os.remove(filename)
        exit_output(mode = OTHER_ERR, usage = False, errmsg = "I/O error({0}): {1}.".format(e.errno, e.strerror))

    return filelist

# Main function
def main():
    # Verify OS version and bit
    verify_os()

    # Verify option(s) and arguement(s)
    arguement_verification(sys.argv[1:])

    # Download SignFile tool
    print('\nStarting Stage 1: Download SignFile tool...\n{0}'.format('=' * 71))
    download_signfile_tool()

    # Verify the existence of certificate(s) and file(s)
    print('\nStarting Stage 2: Verify the existence of certificate(s) and file(s)...\n{0}'.format('=' * 71))
    verify_certs_files()

    # Perform sign file(s)
    print('\nStarting Stage 3: Perform sign file(s)...\n{0}'.format('=' * 71))
    perform_sign_file()


if __name__ == '__main__':
    main()