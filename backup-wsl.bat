@ECHO OFF 
:: simple batch file for a full backup of the Ubuntu-20.04 WSL distribution 

TITLE WSL Backup 

set BACKUPDIR="C:\backups\WSL-backups"

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a

set Yr=%DateTime:~0,4%
set Mon=%DateTime:~4,2%
set Day=%DateTime:~6,2%
set Hr=%DateTime:~8,2%
set Min=%DateTime:~10,2%
set Sec=%DateTime:~12,2%

set BackupName=Ubuntu-20.04-WSL-backup-%Mon%-%Day%-%Yr%-%Hr%"h"-%Min%"m"

echo Creating a full backup of Ubuntu-20.04 WSL to %BACKUPDIR%

wsl.exe --export Ubuntu-20.04 %BACKUPDIR%\%BackupName%.tar

echo Done