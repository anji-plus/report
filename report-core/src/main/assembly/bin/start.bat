@echo off & setlocal enabledelayedexpansion

set LIB_JARS=""
cd ..\lib
for %%i in (*) do set LIB_JARS=!LIB_JARS!;..\lib\%%i
cd ..\bin

set JAVA_OPTS=" -server -Xmx2g -Xms2g -Xmn256m -XX:PermSize=128m -Xss256k "

java %JAVA_OPTS% -jar -Dspring.config.location=..\conf\bootstrap-dev.yml ..\lib\report-core-1.0.0-SNAPSHOT.jar -Xbootclasspath/a:%LIB_JARS%

pause
