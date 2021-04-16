choice /C LCN /T 5 /D C /M "Would you like to c(L)ean, full (C)ompile or ru(N)?"
set ConEmu=StartDevEnvC.txt
IF %ERRORLEVEL% EQU 1 set ConEmu=StartDevEnvL.txt
IF %ERRORLEVEL% EQU 3 set ConEmu=StartDevEnvN.txt

set EXE=ConEmu64.exe
Call :CheckProcess
if %running% EQU 0 start "" "C:\Program Files\ConEmu\ConEmu64.exe" -run @<Scripts Location>\%ConEmu%
goto Fin
:CheckProcess
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
set running=0
exit /B
:FOUND
set running=1
exit /B
:FIN













