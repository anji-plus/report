@echo off & setlocal enabledelayedexpansion

cd ..\lib
for %%i in (*) do set LIB_JARS=!LIB_JARS!..\lib\%%i;
cd ..\bin

echo %LIB_JARS%

set JAVA_OPTS=" -server -Xmx2g -Xms2g -Xmn256m -XX:PermSize=128m -Xss256k "

java $JAVA_OPTS -jar -Dspring.config.location=..\conf\bootstrap.yml ..\lib\aj-report-*.jar -Xbootclasspath/a:%LIB_JARS%

pause
