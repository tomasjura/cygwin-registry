Windows Registry Editor Version 5.00
include(`flags.m4')dnl
include(`reg_expand.m4')dnl
include(`uninstall.m4')dnl
include(`script.m4')dnl
define(`JAVA_PROG_ID',`CYGWIN_PROGID.java')dnl
define(`CLASS_PROG_ID',`CYGWIN_PROGID.class')dnl
define(`PROPERTIES_PROG_ID',`CYGWIN_PROGID.properties')dnl
define(`JAR_PROG_ID',`CYGWIN_PROGID.jar')dnl
define(`WAR_PROG_ID',`CYGWIN_PROGID.war')dnl
define(`ICON_JAVA',ICON_DIR`\\java.ico,0')dnl
define(`ICON_CLASS',ICON_DIR`\\class.ico,0')dnl
define(`ICON_PROPERTIES',ICON_DIR`\\properties.ico,0')dnl
define(`ICON_JAR',ICON_DIR`\\jar.ico,0')dnl
define(`ICON_WAR',ICON_DIR`\\war.ico,0')dnl
; Cygwin Ruby registry
; Author: Tomas Jura (tomas.jura1@gmail.com)
; TODO:
;  - show content of jar/war/ear file
;  - run the jar
GENERATED_FILE_HEADER
ifdef(`UNINSTALL_ASSOCIATION',`divert(`-1')')

; Java
def_key(`JAVA_KEY',`SWCLASSES\JAVA_PROG_ID')dnl
text_file_key(`JAVA_KEY',Java code,`ICON_JAVA',`SCRIPT_EDITOR')
undefine(`JAVA_KEY')

[SWCLASSES\.java]
@="JAVA_PROG_ID"
"ContentType"="text/x-java"
"PerceivedType"="text"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.java\OpenWithProgIds,"JAVA_PROG_ID")

; Class
def_key(`CLASS',`SWCLASSES\CLASS_PROG_ID')dnl
text_file_key(`CLASS',JVM byte code,`ICON_CLASS')
undefine(`CLASS')

[SWCLASSES\.class]
@="CLASS_PROG_ID"
"ContentType"="application/java-byte-code"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.java\OpenWithProgIds,"CLASS_PROG_ID")

; JAR 
def_key(`JAR',`SWCLASSES\JAR_PROG_ID')dnl
text_file_key(`JAR',Java archive,`ICON_JAR')
undefine(`JAR')

[SWCLASSES\.jar]
@="JAR_PROG_ID"
"ContentType"="application/java"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME|FTA_AlwaysUnsafe)

association(SWCLASSES\.jar\OpenWithProgIds,"JAR_PROG_ID")

def_key(`PROPERTIES_KEY',`SWCLASSES\PROPERTIES_PROG_ID')dnl
text_file_key(`PROPERTIES_KEY',Java code,`ICON_',`SCRIPT_EDITOR')
undefine(`PROPERTIES_KEY')

[SWCLASSES\.properties]
@="PROPERTIES_PROG_ID"
"ContentType"="text/x-java-properties"
"EditFlags"=DWORD_BITMASK(FTA_HasExtension|FTA_NoRemove|FTA_NoEditMIME)

association(SWCLASSES\.properties\OpenWithProgIds,"PROPERTIES_PROG_ID")

ifdef(`UNINSTALL_ASSOCIATION',`divert(`0')')dnl
