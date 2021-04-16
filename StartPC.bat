echo off
pushd <Guidewire Location>\PolicyCenter
rem change the title bar
title PolicyCenter Jetty Run
rem make sure we don't have a server already runnning
rem call gwk stopServer
cls
rem and FINALLY kick off the app with the arguments needed for debugging and other nonsense
set Compiler=-x compile
set OptSuspend=n
set Suspend=--no-suspend
set Mode=dev
set Env=local

choice  /C LCSN /T 5 /D N /M "Would you like to c(L)ean, full (C)ompile, (S)uspend or ru(N)?"
IF %ERRORLEVEL% EQU 1 (
    call gwk clean
    rem call gwk compile
    set Compiler=
)

IF %ERRORLEVEL% EQU 2 (
    set Compiler=
    rem call gwk compile
)

IF %ERRORLEVEL% EQU 3 (
	set Suspend=
	set OptSuspend=y
)

choice /C DP /T 2 /D D /M "(D)ev or (P)rod?"
IF %ERRORLEVEL% EQU 2 (
    set Mode=prod
)

choice /C SH /T 2 /D S /M "(S)ql or (H)2?"
IF %ERRORLEVEL% EQU 2 (
    set Env=h2
)

rem echo set JAVA_OPTS=-Xdebug -Xrunjdwp:transport=dt_shmem,server=y,suspend=%OptSuspend%,address=javadebug.3
echo gwk runServer -a -Denv=%Env% %Suspend% %Compiler% --debug-shmem -Dgw.server.mode=%Mode% -Dgw.port=8180
rem set JAVA_OPTS=-Xdebug -Xrunjdwp:transport=dt_shmem,server=y,suspend=%OptSuspend%,address=javadebug.3
gwb runServer -a -Denv=%Env% %Suspend% %Compiler% --debug-shmem -Dgw.server.mode=%Mode% -Dgw.port=8180
