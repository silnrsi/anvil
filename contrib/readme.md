# Automatically scheduling `backup-wsl-repositories` script

The `backup-wsl-repositories.bat` file in the root folder is not designed to be run automatically on a schecule, e.g., daily, using Windows Task Scheduler. The primary problems are:
- It creates a time-stamped log file for each run; over the course of a month there will be 30 essentially useless log files instead of just the most recent; and it accumulates more as time goes on.
- After completing its work, the script pauses, waiting for the user to press a key to allow the script to complete.

This `contrib` folder contains a modified version of the script that mitigates these two issues and shows how to schedule it to run daily. 

## Required customization

Note that, like the root version, this script must be customized, particularly to set the `WSL-UBUNTU-USER` variable to the name of the user you picked when you first created the Ubuntu VM. You may wish to make such modifications in a copy of the script in case of up-stream edits.

Since this script will not typically be run from the command-line (though it could be), it isn't necessary to store your customized version on the PATH.

## Configuring Windows Task Scheduler to run the script daily

You will eventually need to run the Task Scheduler application (to tweak the settings), but it is easier to create a scheduled task by running something similar to the following at a command prompt:

```
schtasks /create /sc daily /tn "Back up wstechfonts" /tr C:\DosUtils\backup-wsl-repositories.bat /st 18:35 
```
The `/tn` parameter is just the task name and can be arbitrary. Be sure to adjust:
- the path to your customized script in the `/tr` option (enclose the parameter in quotes if the path contains spaces)
- the desired start time in the `/st` option.

Once you have run the above command, start the Task Scheduler application (by searching for _Task Scheduler_ in the Start Menu or by using the Run dialog (Win+R) and typing `taskschd.msc`), locate the newly-created "Back up wstechfonts" task (created by the above command), and make the following tweaks (which, afaict, cannot be done from the command line):
- Conditions tab: 
  * disable _Stop if the computer switches to battery power_
- Settings tab: 
  * enable _Run task as soon as possible after a scheduled start is missed_, 
  * adjust  the _Stop the task if it runs longer than:_ option to _1 hour_.

## Running the scheduled task

If configured as above, the task will automatically run at the designated time (e.g., 18:35 local time) if you are logged in. If you are not logged in or the computer is asleep, etc., the task will run as soon as it can after you log in or the computer wakes up. 

When it runs you'll see a Command Prompt window appear and the program start, but nothing else will appear. The Window disappears when the command completes. Look in the logfile `%USERPROFILE%\WSL-repositories-backup.log` to see what it did.

If you want to manually run the task at some other time, use this command:

```
schtasks /run /tn "Back up wstechfonts"
```
