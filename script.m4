include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`quote.m4')dnl
divert(`-1')dnl
# Creates standard program key. Used in ruby,perl,python,...
# $1 - key 
# $2 - name
# $3 - icon
# $4 - prog.exe
# $5 - editor
# $6 - terminal program
# $7 - terminal class
# $8 - terminal icon
define(`script_key',`dnl
[$1]
@="$2"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)
"FriendlyAppName"="CONTEXT_MENU(quote($2))"

[$1\DefaultIcon]
@="$3"

[$1\Shell]
; default key is defined here
@="Open" 

[$1\Shell\Open]
@="CONTEXT_MENU(Run)"
[$1\Shell\Open\command]
@="$4 \"%1\" %*"

[$1\Shell\RunTerminal]
@="CONTEXT_MENU(Run in Terminal)"

[$1\Shell\RunTerminal\command]
@="CYGWIN_RUN_IN_TERMINAL(`--hold always ifelse(`$7',,,`--class $7') ifelse(`$8',,,`--icon \"quote($8)\"') $6')"

ifelse($5,,,`dnl
[$1\Shell\Edit]
@="Edit"

[$1\Shell\Edit\command]
@="$5"')

[$1\ShellEx\DropHandler]
@="{60254CA5-953B-11CF-8C96-00AA00B8708C}"
; @="{86C86720-42A0-1069-A2E8-08002B30309D}"')

# defines key just for edit 
# $1 key
# $2 name
# $3 icon
# $4 editor

define(`text_file_key',`dnl
[$1]
@="$2"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)
"FriendlyAppName"="$2"

[$1\DefaultIcon]
@="$3"

ifdef(`$4',`dnl
[$1\Shell]
@="Edit"

[$1\Shell\Edit]
@="Edit"
[$1\Shell\Edit\command]
@="$4"')')

divert(`0')dnl
