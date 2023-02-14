@ECHO OFF 
:: batch file to do a backup of all repositories from inside a WSL distribution (mapped to W:).
:: uses robocopy and allows for incremental

TITLE WSL repositories backup 

set BACKUPDIR="%USERPROFILE%\WSL-repositories-backup"

echo Creating a backup of repositories in WSL to %BACKUPDIR%  (repos\wstechfonts)
echo Assuming your Ubuntu VM in WSL is mapped as a network drive to W:

set /p UBUNTUUSER=Enter the name of your Ubuntu user: (no spaces)  

robocopy W:\home\%UBUNTUUSER%\repos\wstechfonts  %BACKUPDIR%  /MIR /FFT /R:3 /W:10 /NS /NC /NFL  /E /V /R:1 /W:5 /ETA

echo Done

PAUSE 
