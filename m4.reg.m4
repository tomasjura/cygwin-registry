include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`M4_PROG_ID',`CYGWIN_PROGID.m4')dnl
define(`ICON_M4',ICON_DIR`\\m4.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin Ruby registry
; Author: Tomas Jura (tomas.jura1@gmail.com)
GENERATED_FILE_HEADER
ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`M4_KEY',`SWCLASSES\M4_PROG_ID')dnl
text_file_key(`M4_KEY',M4 macroprocessor text,`ICON_M4',`SCRIPT_EDITOR')
undefine(`M4_KEY')

[SWCLASSES\.m4]
@="M4_PROG_ID"
"ContentType"="text/x-script.m4"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.m4\OpenWithProgIds,"M4_PROG_ID")

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
