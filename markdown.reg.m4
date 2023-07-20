include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`MARKDOWN_PROG_ID',`CYGWIN_PROGID.markdown')dnl
define(`ICON_MARKDOWN',ICON_DIR`\\markdown.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin Ruby registry
; Author: Tomas Jura (tomas.jura1@gmail.com)
GENERATED_FILE_HEADER
ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`MARKDOWN_KEY',`SWCLASSES\MARKDOWN_PROG_ID')dnl
text_file_key(`MARKDOWN_KEY',Markdown text,`ICON_MARKDOWN',`SCRIPT_EDITOR')
undefine(`MARKDOWN_KEY')

[SWCLASSES\.md]
@="MARKDOWN_PROG_ID"
"ContentType"="text/x-script.m4"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME)

association(SWCLASSES\.md\OpenWithProgIds,MARKDOWN_PROG_ID)

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
