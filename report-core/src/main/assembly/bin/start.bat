@echo off & setlocal enabledelayedexpansion

cd ..\lib

for /f "delims=" %%i in ('dir /a-d /b /on aj-report*.jar') do (
   set BOOT_JAR=%%i
)

for %%i in (*) do set LIB_JARS=!LIB_JARS!..\lib\%%i;
cd ..\bin

echo %LIB_JARS%
echo ""

set JAVA_HOME=D:\App\Java\jdk1.8.0_172
set JAVA_OPTS= -server -Xmx2g -Xms2g -Xmn256m -XX:PermSize=128m -Xss256k

%JAVA_HOME%\bin\java %JAVA_OPTS% -jar -Dspring.config.location=..\conf\bootstrap.yml ..\lib\%BOOT_JAR% -Xbootclasspath/a:%LIB_JARS%
