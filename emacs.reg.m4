include(flags.m4)dnl
include(reg_expand.m4)dnl
include(uninstall.m4)dnl
include(fatal_error.m4)dnl
include(foreachq.m4)dnl
divert(-1)
# divert(-1)dnl
#TODO several emacses https://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html; need socket setup

# TODO: check definition of EMACS_BIN_DIR,

ifdef(EMACS_FLAVOUR,,define(EMACS_FLAVOUR))
ifdef(EMACS_VERSION,,define(EMACS_VERSION))

define(`EMACS_KEY',ifelse(EMACS_FLAVOUR,,`Emacs',`Emacs_'EMACS_FLAVOUR))
define(`EMACS_VERSION_SUFFIX',ifelse(EMACS_VERSION,,,`.'EMACS_VERSION))
define(`EMACS_EL',EMACS_KEY`.el'EMACS_VERSION_SUFFIX)
define(`EMACS_ELC',EMACS_KEY`.elc'EMACS_VERSION_SUFFIX)
define(`EMACS_EL_ICON',ICON_DIR`\\el.ico,0')
define(`EMACS_ELC_ICON',ICON_DIR`\\elc.ico,0')

define(`EMACS_HOME',%USERPROFILE%\AppData\Emacs) # User's Emacs HOME see http://www.emacswiki.org/emacs/MsWindowsRegistry
define(`EMACS_PROGID',EMACS_KEY`'EMACS_VERSION_SUFFIX) # generic ProgId for editing files
# In any case the following suffixes will be associated with emacs as minor open program using OpenWithProgIds
define(EMACS_ASSOCIATED_SUFFIXES,`txt,pl,plw,rb,rbw,py,m4,sed,sh,zsh,bash,c,cc,h,m,R,sql,pls,pks,plb,pkb,ora,log,cmd,bat,ps1,psm,ps1xml,reg,ini,xml,htm,html,css,js,java,properties,cs,bld,config,scala,sbt')
divert(0)dnl
Windows Registry Editor Version 5.00
; Cygwin Emacs / NTEmacs registry keys
;
; Author: Tomas Jura (t.jura@volny.cz)
;
GENERATED_FILE_HEADER
; Emacs flavour: ifelse(EMACS_FLAVOUR,,,EMACS_FLAVOUR)
; Emacs version: ifelse(EMACS_VERSION,,,EMACS_VERSION)

ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
[HKEY_CURRENT_USER\Software\GNU\Emacs]
; Users emacs config dir = EMACS_HOME
"`HOME'"=REG_EXPAND(EMACS_HOME)

ifdef(`ALTERNATE_EDITOR',[HKEY_CURRENT_USER\Environment]
"``ALTERNATE_EDITOR''"="ALTERNATE_EDITOR")dnl

dnl TODO: move EDITOR setup outside the Emacs registry file, this is Cygwin related stuff, not the Emacs related
ifdef(`EDITOR',`[HKEY_CURRENT_USER\Environment]
"`EDITOR'"="EDITOR"')dnl

; Emacs Program - default Edit action/verb
def_key(`EMACS_SW_KEY',`SWCLASSES\EMACS_PROGID')
[EMACS_SW_KEY]
@="Emacs"
"EditFlags"=DWORD_BITMASK(FTA_Show|FTA_NoEditDflt)
"FriendlyAppName"="Emacs editor EMACS_FLAVOUR EMACS_VERSION"
; "UseExecutableForTaskbarGroupIcon"="" ; TODO find values

[EMACS_SW_KEY\DefaultIcon]
@="EMACS_ICON"

[EMACS_SW_KEY\Shell]
@="Edit"

[EMACS_SW_KEY\Shell\Edit]
@="Edit in Emacs"
[EMACS_SW_KEY\Shell\Edit\command]
@="EMACS_OPEN_FILE"

; Emacs elisp

def_key(`EMACS_EL_KEY',`SWCLASSES\EMACS_EL')
[EMACS_EL_KEY]
@="EMACS_PROGID"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_OpenIsSafe)
"FriendlyTypeName"="Emacs ELisp"
"AlwaysShowExt"=""

[EMACS_EL_KEY\DefaultIcon]
@="EMACS_EL_ICON"

[EMACS_EL_KEY\Shell\Open]
@="Edit in Emacs"
[EMACS_EL_KEY\Shell\Open\command]
@="EMACS_OPEN_FILE"

dnl TODO add a compile command to compile .el files. Do we need a wrapper script?
undefine(EMACS_EL_KEY)dnl

association(SWCLASSES\.el,,EMACS_EL)
"ContentType"="text/x-script.elisp"
; really we want PerceivedType=text ? This associates the elisp scripts with notepad, wordpad and other ugly programs
;"PerceivedType"="text"
"PerceivedType"=-

association(SWCLASSES\.el\OpenWithProgIds,EMACS_EL)

; `handler 5e941... allows file to be indexed as a text file'
[SWCLASSES\.el\PersistentHandler]
@="{5e941d80-bf96-11cd-b579-08002b30bfeb}"

; Emacs byte code
def_key(EMACS_ELC_KEY,SWCLASSES\EMACS_ELC)
[EMACS_ELC_KEY]
@="Emacs elisp bytecode"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoEdit|FTA_NoRemove|FTA_NoEditVerb|FTA_NoEditDesc|FTA_NoEditMIME|FTA_AlwaysUnsafe|FTA_NoRecentDocs)
"FriendlyTypeName"="Emacs elisp bytecode"
"AlwaysShowExt"=""

[EMACS_ELC_KEY\DefaultIcon]
@="EMACS_ELC_ICON"

association(SWCLASSES\.elc,,EMACS_ELC)
"ContentType"="application/x-elisp.compiled"

undefine(EMACS_ELC_KEY)dnl

;
; associations with other file types
;

; associations with PerceivedType==text => Classes\txtfile 
ifdef(`EMACS_IS_DEFAULT_FOR_TEXTFILES',
association(SWCLASSES\txtfile\shell\open\command,,EMACS_OPEN_FILE,`REG_EXPAND(%SystemRoot%\system32\NOTEPAD.EXE %1)')

association(SWCLASSES\txtfile\OpenWithProgIds,EMACS_PROGID)

; Classes\textfile . What is this key "textfile" ?
association(SWCLASSES\textfile\OpenWithProgIds,EMACS_PROGID)

; all files and directories
def_assoc_key(STAR_KEY,SWCLASSES\*\shell\EMACS_PROGID)
[STAR_KEY]
@="Edit with &Emacs EMACS_VERSION"
[STAR_KEY\command]
@="EMACS_OPEN_FILE"
undefine(STAR_KEY)dnl

; directories
def_assoc_key(DIR_KEY,SWCLASSES\Directory\shell\EMACS_PROGID)
[DIR_KEY]
@="Open in &Emacs EMACS_FLAVOUR EMACS_VERSION"
[DIR_KEY\command]
@="EMACS_OPEN_FILE")
undefine(DIR_KEY)dnl

association(SWCLASSES\cmdfile\OpenWithProgIds,EMACS_PROGID)
association(SWCLASSES\cmdfile\shell\edit\command,,EMACS_PROGID,`REG_EXPAND(%SystemRoot%\System32\NOTEPAD.EXE %1)')

; associations with other suffixes
foreachq(SUFFIX,`EMACS_ASSOCIATED_SUFFIXES',
`association(SWCLASSES\.SUFFIX\OpenWithProgIds,EMACS_PROGID)')

ifdef(`UNINSTALL_ASSOCIATION',divert(`0'))dnl
