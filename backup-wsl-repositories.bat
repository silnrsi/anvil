@ECHO OFF 
:: batch file to do a backup of all repositories from inside a WSL distribution (mapped to W:).
:: uses robocopy and allows for incremental

TITLE WSL repositories backup 

set BACKUPDIR="%USERPROFILE%\WSL-repositories-backup"
set WSL-UBUNTU-USER=username

echo Creating a backup of repositories in WSL to %BACKUPDIR%  (repos\wstechfonts)
echo Assuming your Ubuntu VM in WSL is mapped as a network drive to W:


robocopy W:\home\%WSL-UBUNTU-USER%\repos\wstechfonts  %BACKUPDIR%  /MIR /FFT /NFL /Z /ETA 

echo Done

PAUSE 
