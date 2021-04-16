pushd %~dp0
echo off
pushd <Guidewire Location>\PolicyCenter
title PolicyCenter Studio
cls
rem and FINALLY kick off the app with the arguments needed for debugging and other nonsense
gwb studio -a
popd


