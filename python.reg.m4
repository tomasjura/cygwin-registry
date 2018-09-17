include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`PYTHON_PROG_ID_PY',`CYGWIN_PROGID.Python.py')dnl
define(`PYTHON_PROG_ID_PYW',`CYGWIN_PROGID.Python.pyw')dnl
define(`ICON_PYTHON',ICON_DIR`\\python.ico,0')dnl
define(`ICON_PY',ICON_DIR`\\py.ico,0')dnl
define(`ICON_PYW',ICON_DIR`\\pyw.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin Python registry
; Author: Tomas Jura (tomas_jura1@gmail.com)
GENERATED_FILE_HEADER

; before modification https://www.python.org/dev/peps/pep-0514/
; TODO: implement support for pep-0514

; suffix assigment
; .py text mode script
; .pyw windows mode script
; .pyc python bytecode

ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`PYTHON_PY',`SWCLASSES\PYTHON_PROG_ID_PY')dnl
script_key(`PYTHON_PY',Python,`ICON_PY',`\"CYGWIN_PATH\\bin\\python3.6m.exe\"',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\python3.6m.exe\"',Python,`ICON_PYTHON')
undefine(PYTHON_PY)dnl

def_key(`PYTHON_PYW',`SWCLASSES\PYTHON_PROG_ID_PYW')dnl
script_key(`PYTHON_PYW',Python Windows,`ICON_PYW',`\"CYGWIN_PATH\\bin\\run.exe\" python3',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\python3.6m.exe\"',Python,`ICON_PYTHON')
undefine(PYTHON_PY)dnl


[SWCLASSES\.py]
@="PYTHON_PROG_ID_PY"
"ContentType"="text/x-script.python"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

[SWCLASSES\.pyw]
@="PYTHON_PROG_ID_PYW"
"ContentType"="text/x-script.python"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.py\OpenWithProgIds,"PYTHON_PROG_ID_PY")
association(SWCLASSES\.py\OpenWithProgIds,"PYTHON_PROG_ID_PYW")
association(SWCLASSES\.pyw\OpenWithProgIds,"PYTHON_PROG_ID_PY")
association(SWCLASSES\.pyw\OpenWithProgIds,"PYTHON_PROG_ID_PYW")

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
