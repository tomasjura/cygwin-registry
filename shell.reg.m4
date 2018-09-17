include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`SH_PROG_ID',`CYGWIN_PROGID.Shell.sh')dnl
define(`BASH_PROG_ID',`CYGWIN_PROGID.Shell.bash')dnl
define(`ZSH_PROG_ID',`CYGWIN_PROGID.Shell.zsh')dnl
define(`ICON_SH',`ICON_DIR\\sh.ico,0')dnl
define(`ICON_BASH',`ICON_DIR\\sh.ico,0')dnl
define(`ICON_ZSH',`CYGWIN_PATH\\bin\\zsh.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin Ruby registry
; Author: Tomas Jura (tomas.jura1@gmail.com)
GENERATED_FILE_HEADER

; suffix assigment
; .sh shell script
; .bash shell script
; .zsh shell script

ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`SH',`SWCLASSES\SH_PROG_ID')dnl
script_key(`SH',Shell,`ICON_SH',`\"CYGWIN_PATH\\bin\\dash.exe\"',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\dash.exe\"',Shell,`ICON_SH')
undefine(`SH')dnl

[SWCLASSES\.sh]
@="SH_PROG_ID"
"ContentType"="text/x-shellscript"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.sh\OpenWithProgIds,"SH_PROG_ID")

def_key(`BASH',`SWCLASSES\BASH_PROG_ID')dnl
script_key(`BASH',Shell,`ICON_BASH',`\"CYGWIN_PATH\\bin\\bash.exe\"',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\bash.exe\"',Shell,`ICON_BASH')
undefine(`BASH')dnl

[SWCLASSES\.bash]
@="BASH_PROG_ID"
"ContentType"="text/x-shellscript.bash"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.bash\OpenWithProgIds,"SH_PROG_ID")

def_key(`ZSH',`SWCLASSES\ZSH_PROG_ID')dnl
script_key(`ZSH',Shell,`ICON_ZSH',`\"CYGWIN_PATH\\bin\\zsh.exe\"',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\zsh.exe\"',Shell,`ICON_ZSH')
undefine(`ZSH')dnl

[SWCLASSES\.zsh]
@="ZSH_PROG_ID"
"ContentType"="text/x-shellscript.zsh"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.zsh\OpenWithProgIds,"ZSH_PROG_ID")

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')
