CSC?=C:/Windows/Microsoft.NET/Framework64/v4.0.30319/csc.exe
# WinXP,server 2008 method
# REFRESH=RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True

MODULES?=$(patsubst %.reg.m4,%,$(wildcard *.reg.m4))

REGFILES = $(addsuffix .reg,$(MODULES))
UNINSTALL_REGFILES=$(addprefix uninstall_,$(REGFILES))

# command to run for refresh associations in a running explorer session
REFRESH=( test -x $(CSC) && make notify_apps.exe && ./notify_apps.exe || true )

# cygwin commands which we want to run with the hidden console
# those are bound to suffixes: ruby:.rbw perl:.plw python:.pyw wish:.tk
WINPROGS=ruby.exe perl.exe python.exe wish.exe emacs-w32.exe emacsclient-w32.exe
MAKE_RUNNER=( for f in $(1) ; do if test -x /bin/$$f -a ! -f /bin/run$$f -a -x /bin/run ; then  cp /bin/run /bin/run$$f ; fi ; done )

.PHONY : all install clean check
all : $(REGFILES) $(UNINSTALL_REGFILES)
	make -C icons all


MAKEREG={ set -o pipefail ; printf '\xFF\xFE' ;  m4 $(1) config.m4 $< | unix2dos | iconv -f UTF-8 -t UTF-16LE ; } >$@
CHECK=! m4 config.m4 $< | grep --label=$< -H -E -f watched --color=auto

.DELETE_ON_ERROR:
%.reg : %.reg.m4 config.m4 uninstall.m4 Makefile
	$(CHECK)
	$(call MAKEREG)

check_% : %.reg.m4
	$(CHECK)

check : $(MODULES:%=check_%)

uninstall_%.reg : %.reg.m4 config.m4
	$(call MAKEREG,-DUNINSTALL)

install_% : %.reg
	reg import $<
	make -C icons install
	$(REFRESH)
	$(call MAKE_RUNNER,%.exe)

install: $(MODULES:%=install_%)

install_runners:
	$(call MAKE_RUNNER,$(WINPROGS))

.PHONY : install_emacs
install_emacs : emacs.reg
	reg import $<
	make -C icons install
	$(REFRESH)

uninstall_% : uninstall_%.reg
	reg import $<
	$(REFRESH)

.PHONY: install_pathext
install_pathext:
	./install_pathext.sh -a

notify_apps.exe : notify_apps.cs
	$(CSC) /nologo /t:exe /unsafe+ /platform:x64 $<

clean:
	$(RM) $(REGFILES) $(UNINSTALL_REGFILES) notify_apps.exe 
	make -C icons clean

# TODO : generate dependencies for REGFILES ? from lines include(xxxx)
%.reg  : flags.m4 reg_expand.m4 script.m4 uninstall.m4
emacs.reg : foreachq.m4
foreachq.m4 : quote.m4
