# About

This is a generator for the [Windows registry files
(.reg)](https://en.wikipedia.org/wiki/Windows_Registry) files which:

* integrates scripting languages (ruby, perl, python, ...) of
  [cygwin](http://www.cygwin.com) to windows desktop
* integrates [Emacs](https://www.gnu.org/software/emacs/) to Windows desktop
* helps to integrate portable applications to Windows Desktop ( [Dia](https://portableapps.com/apps/office/dia_portable) example included )

Distributed under [MIT Licence](https://choosealicense.com/licenses/mit/)
Copyrigth (c) 2016,2017 Tomas Jura

Icon images licences are separate. 

# Installation Requirements
## cygwin packages
The installation requires the following cygwin packages:

* make
* m4  - m4 templates are core of this package 
* sed - implicit in standard cygwin installtion 
* iconv -
* od - octal dump program 
* imagemagic - optional for icon building

## .NET C# compiler
There is written a small .NET application in C# which signals to
windows applications that file association/icons are changed. To
compile it you need a c# compiler which is proably present in your
computer. Search for the `csc.exe` under path
`C:\Windows\Microsoft.NET\Framework64`. If not available, you will
have to logout and login to see the registry changes in file explorer
after installation.

# Concept 
## The .reg files generation
The [`.reg`](https://en.wikipedia.org/wiki/Windows_Registry#.REG_files)
file is a text file (encoded as UTF-16). It is a simple recipie how to
add or remove or change the registry keys. They are processed by
reg.exe command which is included in the default windows installation
and also by [regedit](https://ss64.com/nt/regedit.html) program.

[M4](https://www.gnu.org/software/m4/m4.html) is a macro processor for text
files.  The `.reg.m4` is a `.reg` file with m4 macros which provides:

* directives to generate uninstall `.reg` script
* association of the extension, with a program ( like `.pl` with `perl.exe` )
* defines text names of some registry constants ( see file flags.m4 )
* provides macros for simple looping over a list and expanding it in a block of text

The basic .reg file generation workflow is `(config.m4 + <file>.reg.m4 ) => <file>.reg`

And installation  `<file>.reg => reg.exe <file>.reg`

## Icons
There are icons for common file types (.rb, py, .pl, .C, ... ) are prepared from
images. The icons are not necessary to install `.reg` files. But makes the
desktop nicer.

# Configuration
The basic configuration is made in the file config.m4. The m4
macroprocessor uses by default for quoting strings characters ``` `` and
``'``. Which is good, because it does not interfere with quotes `"` used for
strings in `.reg` files. So `` `this is quoted string in m4' ``.

`#` are comments in m4

The `\` character in `.reg` and also `.reg.m4` files must be escaped by `\` so
it is written as `\\`.

Keep all source files in encoding utf-8 with LF (0x0A) line ends when
modifying sources ( including Makefile ).

## Configuration
### Makefile
Edit file `Makefile` and configure the following variables:
####### CSC 
Modify the CSC variable to point to your csc.exe. Probably the provided path to csc.exe will be sufficient.
####### MODULES
Modify the MODULES variable to contain modules you want. By default all possible `.reg` files are generated and installed.
Module roughly corresponds to one programming language (perl,ruby,sed ...) in cygwin
Example: MODULES="ruby perl python"
to list modules run `ls *.reg.m4`

### config.m4

###### SWCLASSES 
select either `HKEY_CURRENT_USER\Software\Classes` or `HKEY_LOCAL_MACHINE\Software\Classes` according to whether you are
doing configuration to self or all users. If unsure use the `HKEY_CURRENT_USER\Software\Classes`.

###### ICON_DIR
Icon directory where the icons will be installed. This path is also used in .reg.m4 file to locate icons. If unsure let
the default one `CYGWIN_PATH`\\usr\\local\\share\\icons`.

###### EMACS_IS_DEFAULT_FOR_TEXTFILES
Comment this if you do not want Emacs to became the default text editor for all text files. This is important, if Emacs
is not your favourite editor! 

TODO: check/add support editors as default: 
* [gvim](https://www.vim.org/download.php#pc) 
* [PSPad](http://www.pspad.com/en/)
* [Notepad++](https://notepad-plus-plus.org/)

## Cygwin configuration

###### CYGWIN_PATH
A path to your cygwin installation
###### CYGWIN_PROGID
A basic key name base for cygwin programs. Select one of `cygwin32` or `cygwin64`. Can be any string without spaces.
###### SCRIPT_EDITOR 
A command to open a (ruby/perl/...) script in your editor. Typicaly "C:\\Program Files\\PSPad\\pspad.exe", or something
like this. Include %1 parameter, which represents the file requested for opening. Quoting the %1 by " seems to be a good
idea. The `"` and `\` must be escaped by `\`.

A default SCRIPT_EDITOR is Emacs which is not a good choose for
everyone. [PSPad](https://www.pspad.com/) or
[Notepad++](https://notepad-plus-plus.org/) can be a better choice for
Windows users.

###### EDITOR
An environment variable EDITOR will be setup for Emacs. Simply skip if you do not want to install Emacs registry files.

###### CONTEXT_MENU 
A macro which expands to a label in context menu. It accepts one argument - represented by $1 - the name of
program/action. Select one of the `CygWin32 $1` or `CygWin64 $1` according to your cygwin version installation.

## Emacs configuration (config.m4 file)
The explicit Emacs configuration is necessary only if you want to use other Emacs then the Cygwin Emacs (like `NT
Emacs`). The default configuration is for Cygwin Emacs W32 (gui) version.

###### EMACS_BIN_DIR
Directory where you emacs.exe lives
###### EMACS_ICON
Icon file (.exe,.dll,.ico ) for Emacs. Also use the resource ID separated by comma.
###### EMACS_FLAVOUR 
Simple string indentifing Emacs ( NT, Lucid ) among other installed emacses.
###### EMACS_VERSION
Optional, usefull only if several Emacs versions are installed.

### Installation
## creating "run" wrappers
In cygwin shell run `make install_runners`
## Creating .reg files
In cygwin shell run in the root project direcory
> make all
You should see the required .reg files. If you have modified the source files (.reg.m4), check them in text editor before installation.
## Applying to registry
> make all
Instals your selected `.reg` files defined by MODULES variable
### After installation
## Preserve uninstall files
Save your config file at save place. You never know when you will need the uninstall files.

## PATHEXT
[Modify your environment variable](https://www.java.com/en/download/help/path.xml) `PATHEXT` and set it as
`%PATHEXT%;.SH;.ZSH;.BASH;.RB;.PL;.PY;.TCL` which allows you run the scripts in ruby,perl,python,tcl,Shell,ZShell,Bash without writing
extension in cmd.exe.  Alternativelly you can run command `setx PATHEXT ^%PATHEXT^%;.SH;.ZSH;.BASH;.RB;.PL;.PY;.TCL` in the command line
prompt.

# FAQ
## Emacs shows no windows in Windows 10
Cygwin's emacs-w32 do not show new frames unless the emacsclient is in
the wait mode (see switch `-n` in the emacsclient manual).  Solution
is currently not known. Workaround is to use [Native Emacs](https://www.gnu.org/software/emacs/download.html#windows)
instead of Cygwin Emacs.
