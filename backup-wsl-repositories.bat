@ECHO OFF 
:: batch file to do a backup of all repositories from inside a WSL distribution (mapped to W:).
:: uses robocopy and allows for incremental

TITLE WSL repositories backup 

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a

set Yr=%DateTime:~0,4%
set Mon=%DateTime:~4,2%
set Day=%DateTime:~6,2%
set Hr=%DateTime:~8,2%
set Min=%DateTime:~10,2%
set Sec=%DateTime:~12,2%

set BACKUPDIR="%USERPROFILE%\WSL-repositories-backup"
set WSL-UBUNTU-USER=username
set LOGFILE=%USERPROFILE%\WSL-repositories-backup-log-%Mon%-%Day%-%Yr%-%Hr%-%Min%.txt

echo Creating a backup of repositories in WSL to %BACKUPDIR%  (repos\wstechfonts)
echo Assuming your Ubuntu VM in WSL is mapped as the W: network drive and your WSL-UBUNTU-USER is properly set

robocopy W:\home\%WSL-UBUNTU-USER%\repos\wstechfonts  %BACKUPDIR%  /MIR /FFT /Z /ETA /LOG:%LOGFILE%

echo:
echo:

echo Done, press any key to close

echo:
echo:

timeout /t 20
