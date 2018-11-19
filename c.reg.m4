include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`C_PROG_ID',`CYGWIN_PROGID.c')dnl
define(`H_PROG_ID',`CYGWIN_PROGID.h')dnl
define(`CPP_PROG_ID',`CYGWIN_PROGID.cpp')dnl
define(`HPP_PROG_ID',`CYGWIN_PROGID.hpp')dnl
define(`ICON_C',ICON_DIR`\\c.ico,0')dnl
define(`ICON_H',ICON_DIR`\\h.ico,0')dnl
define(`ICON_CPP',ICON_DIR`\\cpp.ico,0')dnl
define(`ICON_HPP',ICON_DIR`\\hpp.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin registry for C,C++ source files
; Author: Tomas Jura (tomas.jura1@gmail.com)
GENERATED_FILE_HEADER

ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`C_KEY',`SWCLASSES\C_PROG_ID')dnl
text_file_key(`C_KEY',C code,`ICON_C',`SCRIPT_EDITOR')
undefine(`C_KEY')

def_key(`H_KEY',`SWCLASSES\H_PROG_ID')dnl
text_file_key(`H_KEY',C header,`ICON_H',`SCRIPT_EDITOR')
undefine(`H')

def_key(`CPP_KEY',`SWCLASSES\CPP_PROG_ID')dnl
text_file_key(`CPP_KEY',C++ code,`ICON_CPP',`SCRIPT_EDITOR')
undefine(`CPP_KEY')

def_key(`HPP_KEY',`SWCLASSES\HPP_PROG_ID')dnl
text_file_key(`HPP_KEY',C++ header,`ICON_HPP',`SCRIPT_EDITOR')
undefine(`HPP_KEY')

[SWCLASSES\.c]
@="C_PROG_ID"
"ContentType"="text/x-c"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME)

association(SWCLASSES\.c\OpenWithProgIds,C_PROG_ID)

[SWCLASSES\.h]
@="H_PROG_ID"
"ContentType"="text/x-h"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME)

association(SWCLASSES\.h\OpenWithProgIds,H_PROG_ID)

[SWCLASSES\.cpp]
@="CPP_PROG_ID"
"ContentType"="text/x-c"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME)

association(SWCLASSES\.cpp\OpenWithProgIds,CPP_PROG_ID)

[SWCLASSES\.hpp]
@="HPP_PROG_ID"
"ContentType"="text/x-h"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME)

association(SWCLASSES\.h\OpenWithProgIds,HPP_PROG_ID)

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
