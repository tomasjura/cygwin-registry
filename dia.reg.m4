Windows Registry Editor Version 5.00
;  Portable Dia
;
;  Author: Tomas Jura (t.jura@volny.cz)
GENERATED_FILE_HEADER
;
define(`DIA_PROG_ID',`GNU.Dia.0.97.2')dnl
define(`DIA_EXE',`C:\\Apps\\DiaPortable\\DiaPortable.exe')dnl
include(uninstall.m4)dnl
include(flags.m4)dnl
include(reg_expand.m4)dnl
ifdef(UNINSTALL_ASSOCIATION,divert(`-1'))

[SWCLASSES\.dia]
@="DIA_PROG_ID"
"ContentType"="application/x-dia-diagram"
"PerceivedType"="document"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.dia\OpenWithProgIds,@,"DIA_PROG_ID")

def_key(`DIA_SW',`SWCLASSES\DIA_PROG_ID')dnl
@="Dia Diagram"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)
"FriendlyAppName"="Dia Diagram"

[DIA_SW\DefaultIcon]
@="DIA_EXE,0"

[DIA_SW\Shell\Open]
; Shell\Open action is default when running from cmd.exe
@="Open in Dia"
[DIA_SW\Shell\Open\command]
@="DIA_EXE \"%1\""

[DIA_SW\Shell\Export1024]
; Shell action is default when running from cmd.exe
@="Export to PNG size 1024"
[DIA_SW\Shell\Export1024\command]
@="DIA_EXE -n -t png --size=x1024 \"%1\""

[DIA_SW\ShellEx\DropHandler]
@="{60254CA5-953B-11CF-8C96-00AA00B8708C}"
; @="{86C86720-42A0-1069-A2E8-08002B30309D}"
ifdef(UNINSTALL_ASSOCIATION,divert(`0'))
