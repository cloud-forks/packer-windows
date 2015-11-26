fsutil behavior set disabledeletenotify 0

@setlocal enableextensions enabledelayedexpansion
@echo off
for /f "tokens=3" %%a in ('dir c:\') do (
set bytesfree1=%%a
)
set bytesfree1=%bytesfree1:,=%
echo FREE SPACE: %bytesfree1%
endlocal && set bytesfree1=%bytesfree1%
fsutil file createnew 000 %bytesfree1%
for /f "tokens=3" %%a in ('dir c:\') do (
set bytesfree2=%%a
)
set bytesfree2=%bytesfree2:,=%
echo FREE SPACE: %bytesfree2%
endlocal && set bytesfree2=%bytesfree2%
timeout /t 3
del 000
for /f "tokens=3" %%a in ('dir c:\') do (
set bytesfree3=%%a
)
set bytesfree3=%bytesfree3:,=%
echo FREE SPACE: %bytesfree3%
endlocal && set bytesfree3=%bytesfree3%
