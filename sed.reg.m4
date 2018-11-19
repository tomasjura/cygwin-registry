include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`SED_PROG_ID',`CYGWIN_PROGID.sed')dnl
define(`ICON_SED',ICON_DIR`\\sed.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin Ruby registry
; Author: Tomas Jura (tomas.jura1@gmail.com)
GENERATED_FILE_HEADER
ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`SED',`SWCLASSES\SED_PROG_ID')dnl
text_file_key(`SED',Sed filter,`ICON_SED',`SCRIPT_EDITOR')
undefine(`SED')

[SWCLASSES\.sed]
@="SED_PROG_ID"
"ContentType"="text/x-script.sed"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.sed\OpenWithProgIds,SED_PROG_ID)

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
