divert(-1)dnl
# configuration file for generating registry files for emacs and cygwin apps/scripting languages

# TODO: Shell action is default for cmd.exe and not the Open ?

# Documentation sources
# https://superuser.com/questions/361816/pass-command-line-arguments-to-windows-open-with
# http://www.gnu.org/software/emacs/manual/html_mono/efaq-w32.html
# https://msdn.microsoft.com/en-us/library/bb165967.aspx
# https://msdn.microsoft.com/en-us/library/bb166549.aspx
# http://msdn.microsoft.com/en-us/library/windows/desktop/ee872121%28v=vs.85%29.aspx
# https://msdn.microsoft.com/en-us/library/windows/desktop/ee872121(v=vs.85).aspx
# http://msdn.microsoft.com/en-us/library/windows/desktop/cc144148%28v=vs.85%29.aspx
# http://msdn.microsoft.com/en-us/library/windows/desktop/bb762506%28v=vs.85%29.aspx  EditFlags
# http://mc-computing.com/winexplorer/WinExplorerEditFlags.htm EditFlags
# https://social.msdn.microsoft.com/Forums/ie/en-US/61c2afb4-22b5-470b-8fbe-1b5e24588129/where-is-the-microsoft-documentation-for-browserflags-and-editflags?forum=ieextensiondevelopment BrowseFlags
# keys under HKLM\Software\Classes or HKCR

# 1. Where to install associations
# HKEY_CURRENT_USER\Software\Classes or HKEY_LOCAL_MACHINE\Software\Classes or HKEY_CLASSES_ROOT ( HKCR not suggested )
define(SWCLASSES,HKEY_CURRENT_USER\Software\Classes)
# icons %SystemRoot%\system32\imageres.dll,-102

# cygwin basic config
define(`CYGWIN_PATH',`C:\\cygwin64')

# common icon dir
define(`ICON_DIR',CYGWIN_PATH`\\usr\\local\\share\\icons') # icon dir for ruby, perl, GNU R, elisp... (Windows path style is required)

# uncomment this to generate a script which uninstalls associations, but preserves keys like cygwin64.ruby.rb
# define(UNINSTALL_ASSOCIATION)
# When UNINSTALL then UNINSTALL_ASSOCIATION is mandatory
ifdef(`UNINSTALL',`define(`UNINSTALL_ASSOCIATION')')

# cygwin prefix param for HKLM/Sofware/Classes/<CYGWIN_PROGID>.Perl.pl , HKLM/Sofware/Classes/<CYGWIN_PROGID>.Ruby.rb ....
# used as distinction between cygwin installations ( 32bit 64bit )
define(`CYGWIN_PROGID',`cygwin64')

# A wrapper for all context menu text shown on right click on icon.
# When only one cygwin instance is installed: $1
# When more than one cygwin instances (32/64 bit) are installed: InstanceName $1
define(`CONTEXT_MENU',`CygWin64 $1')

# Emacs config, the following variables must be defined, but may be empty. No comma inside is allowed.
define(EMACS_FLAVOUR,) # can be any string without spaces... generically keep it empty unless having several EMACSes
define(EMACS_VERSION,) # keep EMACS_VERSION empty unless you are going to use several emacses
# define(EMACS_SOCKET,EMACS_FLAVOUR`.'EMACS_VERSION) # TODO: support running mutiple emacses simultanenously

define(EMACS_BIN_DIR,CYGWIN_PATH\\bin)
define(`EMACS_ICON',EMACS_BIN_DIR`\\emacsclient-w32.exe,0')

define(EMACS_OPEN_FILE,\"EMACS_BIN_DIR\\emacsclient-w32.exe\" --no-wait --alternate-editor= --create-frame %1) # dir with doubled backslashes

# see emacsclient manual for usage of ALTERNATE_EDITOR, we will use the --alternate-editor= switch by default
# ALTERNATE_EDITOR must not contain any parameters for emacs < 25.1
define(ALTERNATE_EDITOR,EMACS_BIN_DIR\\emacs-w32.exe --daemon)

define(`EMACS_IS_DEFAULT_FOR_TEXTFILES') # comment out if you do not want emacs to be your default editor for text files

# Back to a generic Cygwin confguration

# And now generic editor ( not emacs scpecific ) for
# default edit action for edit scripts (perl, ruby, R, shell,...), it must include parameter %1
# required
define(`SCRIPT_EDITOR',EMACS_OPEN_FILE)

# defines an evironment variable EDITOR, comment out if you do not want to set it up
# --no-wait as parameter emacsclientw-32 results no window at all
define(`EDITOR',\"EMACS_BIN_DIR\\emacsclient-w32.exe\" --create-frame --alternate-editor=)

define(`GENERATED_FILE_HEADER',`; Generated file from [__file__]. Do not edit.
; Licence MIT
;
; prefix: CYGWIN_PROGID 
; cygwin path: CYGWIN_PATH
; script_editor: SCRIPT_EDITOR
; icon dir : ICON_DIR
; `UNINSTALL' : ifdef(`UNINSTALL',YES,NO)
; `UNINSTALL_ASSOCIATION' : ifdef(`UNINSTALL_ASSOCIATION',YES,NO)
')

######################################
# end of standard config
######################################

# exec command for terminal ; a macro with 1 parameter
# TODO: --hold always ?
define(`CYGWIN_RUN_IN_TERMINAL',`CYGWIN_PATH\\bin\\mintty.exe $1 \"%1\" %*')

divert(0)dnl
