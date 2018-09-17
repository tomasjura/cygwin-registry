include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`RUBY_PROG_ID_RB',`CYGWIN_PROGID.Ruby.rb')dnl
define(`RUBY_PROG_ID_RBW',`CYGWIN_PROGID.Ruby.rbw')dnl
define(`RUBY_PROG_ID_RHTML',`CYGWIN_PROGID.Ruby.rhtml')dnl
define(`RUBY_PROG_ID_RJS',`CYGWIN_PROGID.Ruby.rjs')dnl
define(`ICON_RB',ICON_DIR`\\rb.ico,0')dnl
define(`ICON_RBW',ICON_DIR`\\rbw.ico,0')dnl
define(`ICON_RUBY',ICON_DIR`\\ruby.ico,0')dnl
define(`ICON_RHTML',ICON_DIR`\\rhtml.ico,0')dnl
define(`ICON_RJS',ICON_DIR`\\rjs.ico,0')dnl
Windows Registry Editor Version 5.00
; Cygwin Ruby registry
; Author: Tomas Jura (tomas.jura1@gmail.com)
GENERATED_FILE_HEADER

; suffix assigment
; .rb text mode script
; .rbw windows script ( hidden console )
; .rhtml Ruby on Rails html template
; .rjs Ruby on Rails java script

ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
def_key(`RUBY_RB',`SWCLASSES\RUBY_PROG_ID_RB')dnl
script_key(`RUBY_RB',Ruby,`ICON_RB',`\"CYGWIN_PATH\\bin\\ruby.exe\"',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\ruby.exe\"',Ruby,`ICON_RUBY')
undefine(`RUBY_RB')dnl

def_key(`RUBY_RBW',`SWCLASSES\RUBY_PROG_ID_RBW')dnl
script_key(`RUBY_RBW',Ruby Windows,`ICON_RBW',`\"CYGWIN_PATH\\bin\\run\" ruby',`SCRIPT_EDITOR',`\"CYGWIN_PATH\\bin\\ruby.exe\"',Ruby,`ICON_RUBY')
undefine(`RUBY_RBW')dnl

[SWCLASSES\.rb]
@="RUBY_PROG_ID_RB"
"ContentType"="text/x-script.ruby"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

[SWCLASSES\.rbw]
@="RUBY_PROG_ID_RBW"
"ContentType"="text/x-script.ruby"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.rb\OpenWithProgIds,"RUBY_PROG_ID_RB")
association(SWCLASSES\.rb\OpenWithProgIds,"RUBY_PROG_ID_RBW")
association(SWCLASSES\.rbw\OpenWithProgIds,"RUBY_PROG_ID_RB")
association(SWCLASSES\.rbw\OpenWithProgIds,"RUBY_PROG_ID_RBW")


def_key(`RUBY_RHTML',`SWCLASSES\RUBY_PROG_ID_RHTML')dnl
text_file_key(`RUBY_RHTML',Ruby HTML,`ICON_RHTML',`SCRIPT_EDITOR')
undefine(`RUBY_RHTML')

[SWCLASSES\.rhtml]
@="RUBY_PROG_ID_RHTML"
"ContentType"="text/x-script.ruby.html"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.rhtml\OpenWithProgIds,"RUBY_PROG_ID_RHTML")

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
