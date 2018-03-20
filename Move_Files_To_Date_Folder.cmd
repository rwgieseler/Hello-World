@echo on


set "source=W:\party"
set "targetRoot=W:\Archive\party"

dir %source%
dir %targetRoot%

pause

::move file, folders and subfolders from the X folder to YYYY_MM folder based on Month & year on date modified 

:: ????





:: ------- Move files to folders matching the file's YEAR and then MONTH DATE STAMP -----
for %%F in ("%source%\*") do (
  for /f "tokens=1,2,3 delims=/ " %%A in ("%%~tF") do (
    If Not Exist "%targetRoot%\%%C\" MD "%targetRoot%\%%C"
    If Not Exist "%targetRoot%\%%C\%%C-%%A-xx" MD "%targetRoot%\%%C\%%C-%%A-xx"
    Copy "%%~fF" "%targetRoot%\%%C\%%C-%%A-xx"
  )
)

pause
exit


:: ------- Move files to folders matching the file's DATE STAMP -----
::for %%F in ("%source%\*") do (
::  for /f "tokens=1,2,3 delims=/ " %%A in ("%%~tF") do (
::    If Not Exist "%targetRoot%\%%C-%%A-%%B" MD "%targetRoot%\%%C-%%A-%%B"
::    Move "%%~fF" "%targetRoot%\%%C-%%A-%%B"
::  )
::)

pause
exit

::MOVE FILES THAT ARE IN THE ERROR FOLDER TO ARCHIVE ACCORDING TO FILES YEAR AND MONTH

setlocal EnableDelayedExpansion
@echo off

set "source=C:\Users\user\Desktop\test"
set "targetRoot=C:\Users\user\Desktop\test\archive"
For /F "tokens=2,3,4 delims=/ " %%A in ('Date /t') do @(
    set mm=%%A
    set dd=%%B
    set yyyy=%%C
)
set currdate=%yyyy%%mm%%dd%
::echo %currdate%
set /a currdate-=7
::echo %currdate%
for %%F in ("%source%\*") do (
    for /f "tokens=1,2,3 delims=/ " %%M in ("%%~tF") do (
    SET fileDT=%%O%%N%%M

    if /I %currdate% GTR !fileDT!  (
        if not exist "%targetRoot%\%%F" mkdir "%targetRoot%\%%F"
        if not exist "%targetRoot%\%%F\%%M" mkdir "%targetRoot%\%%F\%%M"
        move "%%~fF" "%targetRoot%\%%F\%%M"
        )

    )
)
