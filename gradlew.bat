@echo off
rem ------------------------------------------------------------------------------
rem Gradle start up script for Windows
rem ------------------------------------------------------------------------------

@if "%DEBUG%" == "" @echo off
@setlocal

rem Get script directory
set DIR=%~dp0
if "%DIR%" == "" set DIR=.

set APP_BASE_NAME=%DIR%
set APP_HOME=%DIR%

set DEFAULT_JVM_OPTS=

rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
echo.
exit /b 1

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
echo.
exit /b 1

:init
rem Setup the command line

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

if "%CLASSPATH%" == "" goto execute

set CLASSPATH=%CLASSPATH%;%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

:execute
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

endlocal
