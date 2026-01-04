@ECHO OFF 
:: batch file to do a backup of all repositories from inside a WSL distribution (mapped to W:).
:: uses robocopy and allows for incremental

REM This contributed version still needs to be customized for your username

REM The primary difference between this version and the one in the root directory is that
REM this one is designed to be run regularly (e.g. daily) from Windows Task Scheduler. 
REM The relevant modifications:
REM    Does not create separate log files for every run
REM    Doesn't wait for a key-press to end the script, so no interaction is needed.

REM See readme.md for information about scheduling the task with Windows Task Scheduler

TITLE WSL repositories backup 

set BACKUPDIR="%USERPROFILE%\WSL-repositories-backup"
set WSL-UBUNTU-USER=username
set LOGFILE="%USERPROFILE%\WSL-repositories-backup.log"

echo Creating a backup of repositories in WSL to %BACKUPDIR%  (repos\wstechfonts)
echo Assuming your Ubuntu VM in WSL is mapped as the W: network drive and your WSL-UBUNTU-USER is properly set

robocopy W:\home\%WSL-UBUNTU-USER%\repos\wstechfonts  %BACKUPDIR%  /MIR /FFT /Z /ETA /XJ /LOG:%LOGFILE%

echo Done.
