include(`quote.m4')dnl
divert(`-1')dnl
# macros for de-installation
# usage
# ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')
# ...
# text with macros below
#
# ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')') <= this dumps accumulated uninstall commands

# if UNINSTALL then also UNINSTALL_ASSOCIATION
ifdef(`UNINSTALL',`define(`UNINSTALL_ASSOCIATION',)')

# def_key( key_name, definition )
# defines key_name as macro definition, and stores it for deinstalation if UNINSTALL is defined
define(`def_key',`define(quote($1),quote($2))ifdef(`UNINSTALL',`m4wrap(`[-$2]

')')')

# def_key( key_name, definition )
# define key_name as macro and proposes its deletion when UNINSTALL_ASSOCIATION  is defined
define(`def_assoc_key',`define(quote($1),quote($2))ifdef(`UNINSTALL_ASSOCIATION',`m4wrap(`[-$2]

')')')

#association(key,value,data,data_uninstall)
# creates association value
# under key define value with data, during deinstalation use data uninstall
# empty key set-up a default value (named as `@' inside .reg script)
# default data install is an empty string
# default data uninstall is - (aka delete value)
# dedicated for association with .suffixes
# examples:
# associate .el with EMACS_EL as default : association(SWCLASSES\.el,,EMACS_KEY) ; defult key for .el
# associate .el with EMACS_EL as default : association(SWCLASSES\.txt\OpenWithProgIds,EMACS_KEY) ; opener for .txt

define(`association',`[$1]
ifelse($2,,@,"$2")="quote($3)"
ifdef(`UNINSTALL_ASSOCIATION',`m4wrap(`[$1]
ifelse($2,,@,"$2")=ifelse($#,4,"quote($4)",-)

')')')

divert(`0')dnl
