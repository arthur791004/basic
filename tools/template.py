#!/usr/bin/env python
# This Python file uses the following encoding: utf-8

########################################
# <description>
########################################

########################################
# import
########################################
import sys
import os
import logging
import commands

########################################
# global constants (path, cmd, 
########################################
LOG_FILE = "<tool name>.log"
LOG_DEBUG_LEVEL = logging.DEBUG
LOG_FORMAT = "[%(asctime)s][%(funcName)s:%(lineno)d][%(levelname)s] %(message)s"
LOG_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"

########################################
# global variables
########################################
gCwd = os.getcwd()

########################################
# chdir to abs path
########################################
def Chdir(szDir, bAbs = True):
    if True == bAbs and os.path.exists(szDir):
        if szDir != os.getcwd():
            os.chdir(szDir)
    elif False == bAbs and os.path.exists(os.path.abspath(szDir)):
        os.chdir(szDir)
    else:
        ShowError("chdir: %s not existed!" % szDir)
        sys.exit()
# end of chdir

########################################
# cmd line
########################################
def CmdLine(szCmd, szFormat = None):
    ShowInfo(szCmd)
    szResult = commands.getoutput(szCmd)
    if szFormat:
        return szFormat.format(szResult)
    else:
        return szResult
# end of cmd line

########################################
# exec cmd
########################################
def ExecCmd(szCmd, bIgnoreErr = False):
    ShowInfo("Exec Cmd: {0}".format(szCmd))
    status, output = commands.getstatusoutput(szCmd)
    if 0 != status:
        ShowError("{%s} (errno={%d}, errmsg={%s})" % (szCmd, status, output))
        if False == bIgnoreErr:
            sys.exit()
    return status, output
# end of ExecCmd

########################################
# show info
########################################
def ShowInfo(szText):
    ShowColorText(33, "[INFO] %s" % szText)
    logging.info(szText)
# end of show info

########################################
# show warning
########################################
def ShowWarning(szText):
    ShowColorText(33, "[WARN] %s" % szText)
    logging.warn(szText)
# end of show info

########################################
# show error
########################################
def ShowError(szText):
    ShowColorText(31, "[ERROR] %s" % szText)
    logging.error(szText)
# end of show error

########################################
# show color text
########################################
def ShowColorText(nColor, szText, bNewLine = True):
    if bNewLine:
        print "\033[1;%dm%s\033[1;m" % (nColor, szText)
    else:
        print "\033[1;%dm%s\033[1;m" % (nColor, szText),
    sys.stdout.flush()
# end of show color text

########################################
# print usage
########################################
def PrintUsage():
    ShowInfo("Usage: python gen_mail_office.py")
# end of print usage

########################################
# main
########################################
def main():
    ########################################
    # initialize settings
    ########################################
    logging.basicConfig(
        filename = LOG_FILE,
        format = LOG_FORMAT,
        datefmt = LOG_DATE_FORMAT,
        level = LOG_DEBUG_LEVEL
    )
# end of main()

if __name__ == "__main__":
    main()
