SHELL_ICONS=sh.ico bash.ico
RUBY_ICONS=ruby.ico rb.ico rbw.ico rhtml.ico
PERL_ICONS=perl.ico pl.ico plw.ico
PYTHON_ICONS=python.ico py.ico pyw.ico pyc.ico
JAVA_ICONS=java.ico class.ico jsp.ico tml.ico jar.ico war.ico ear.ico properties.ico
SCALA_ICONS=scala.ico sbt.ico
C_ICONS=c.ico h.ico cpp.ico hpp.ico
TOOL_ICONS=m4.ico sed.ico
XML_ICONS=xml.ico xsl.ico xslt.ico
EMACS_ICONS=el.ico elc.ico
CS_ICONS=cs.ico
ALL_ICONS = $(SHELL_ICONS) $(RUBY_ICONS) $(PYTHON_ICONS) $(PERL_ICONS) $(TOOL_ICONS) $(C_ICONS) \
	$(EMACS_ICONS) \
	$(JAVA_ICONS) $(SCALA_ICONS) $(XML_ICONS) log.ico R.ico markdown.ico $(CS_ICONS)

INSTALL_DIR=$(shell echo ICON_DIR| m4 ../config.m4 - )

all: $(ALL_ICONS)

clean:
	rm -f $(ALL_ICONS)

MAKEICO=convert $< $(2) +repage \
	-colors 256 -resize 256 \
	-family Helvetica -pointsize 100 -gravity SouthEast -annotate 0,0 '$(1)' \
	-define icon:auto-resize="256,128,96,64,48,32,16" $(3) $@

ruby.ico : ruby.svg
	$(call MAKEICO,)

rb.ico : ruby.svg
	$(call MAKEICO,rb)

rbw.ico : ruby.svg
	$(call MAKEICO,rbw)

rhtml.ico : ruby.svg
	$(call MAKEICO,rhtml)

rjs.ico : ruby.svg
	$(call MAKEICO,rjs)

python.ico : python.svg
	$(call MAKEICO,)

py.ico : python.svg
	$(call MAKEICO,py)

pyw.ico : python.svg
	$(call MAKEICO,pyw)

pyc.ico : python.svg
	$(call MAKEICO,pyc,-colorspace Gray)

perl.ico : perl.jpg
	$(call MAKEICO,,-white-threshold 93% -transparent white -crop 370x370+15+15)

pl.ico : perl.jpg
	$(call MAKEICO,pl,-white-threshold 93% -transparent white -crop 370x370+15+15)

plw.ico : perl.jpg
	$(call MAKEICO,plw,-white-threshold 93% -transparent white -crop 370x370+15+15)

markdown.ico : markdown.png
	$(call MAKEICO,,)

MAKE_SHELL_ICO=convert $< $(2) +repage \
	-colors 256 -resize 256 \
	-family Helvetica -pointsize 100 -gravity center -annotate 0,0 '$(1)' \
	-define icon:auto-resize="256,128,96,64,48,32,16" $(3) $@

bash.ico : shell.png
	$(call MAKE_SHELL_ICO,bash)

sh.ico : shell.png
	$(call MAKE_SHELL_ICO,sh)

java.ico : java.svg
	$(call MAKEICO,,-background white)

properties.ico : java.svg
	$(call MAKEICO,.prop,)

jsp.ico : java.svg
	$(call MAKEICO,jsp,-background white)

class.ico : java.svg
	$(call MAKEICO,,-colorspace Gray)
#	$(call MAKEICO,class,-grayscale Rec601Luma -background lightBlue -alpha remove)

tml.ico : tapestry.svg
	$(call MAKEICO,tml)

#TODO: make .jar .war .ear icons from package.svg
MAKE_PACKAGE_ICO=convert $< -resize 600x600 -crop 520x520+40+40 $(2) +repage \
	-colors 256 -resize 256 \
	-family Helvetica -weight Heavy -pointsize 80 -gravity center -annotate 0,0+0+50 '$(1)' \
	-define icon:auto-resize="256,128,96,64,48,32,16" $(3) $@

jar.ico : package.svg
	$(call MAKE_PACKAGE_ICO,JAR)

war.ico : package.svg
	$(call MAKE_PACKAGE_ICO,WAR)

ear.ico : package.svg
	$(call MAKE_PACKAGE_ICO,EAR)

el.ico : emacs_color.png
	$(call MAKEICO,el)

elc.ico : emacs_BW.svg
	$(call MAKEICO,elc)

scala.ico : scala.svg
	$(call MAKEICO)

sbt.ico : sbt.png
	$(call MAKEICO)

log.ico : log.svg
	$(call MAKEICO,log)

R.ico : R_logo.svg
	$(call MAKEICO,,-background transparent -gravity Center -extent 724x724)

# TODO: make it nicer see http://www.imagemagick.org/Usage/fonts/
m4.ico :
	convert -size 256x256 canvas:none \
	-font Helvetica-Narrow-Bold -pointsize 130 -gravity Center \
	-annotate 0,0 m4 -blur 0x6 \
	-stroke lightBlue -fill darkBlue -annotate 0,0 m4 \
	-define icon:auto-resize="256,128,96,64,48,32,16" $@

sed.ico :
	convert -size 256x256 canvas:none \
	-font Helvetica-Narrow-Bold -pointsize 130 -gravity Center \
	-annotate 0,0 sed -blur 0x6 \
	-stroke lightBlue -fill darkBlue -annotate 0,0 sed \
	-define icon:auto-resize="256,128,96,64,48,32,16" $@

# TODO: make it nicer see http://www.imagemagick.org/Usage/fonts/
C_ICO=convert -size 256x256 canvas:none \
	-font Helvetica-Narrow-Bold -pointsize 130 -gravity Center \
	-annotate 0,0 '$(1)' -blur 0x6 \
	-strokewidth 8 -stroke darkBlue -fill lightBlue -annotate 0,0 '$(1)' \
	-define icon:auto-resize="256,128,96,64,48,32,16" $@

c.ico :
	$(call C_ICO,C)
h.ico :
	$(call C_ICO,h)
cpp.ico :
	$(call C_ICO,C++)
hpp.ico :
	$(call C_ICO,h++)
cs.ico :
	$(call C_ICO,C#)

X_ICO=convert -size 256x256 canvas:none \
	-font Helvetica-Bold -pointsize 180 -gravity North -annotate 0,0 '</>' -blur 0x6 \
	-font Helvetica-Bold -pointsize 180 -gravity North -strokewidth 8 \
	-stroke navy -fill lightBlue -annotate 0,0 '</>' \
	-fill black -stroke lightBlue -strokewidth 2 -gravity SouthEast -pointsize 120 -annotate 0,0 '$(1)' \
	-define icon:auto-resize="256,128,96,64,48,32,16" $@

xml.ico :
	$(call X_ICO,xml)
xsl.ico :
	$(call X_ICO,xsl)
xslt.ico :
	$(call X_ICO,xslt)

install:
	mkdir -p $(INSTALL_DIR)
	install -t $(INSTALL_DIR) $(ALL_ICONS) php.ico
