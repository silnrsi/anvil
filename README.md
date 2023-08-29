## Anvil

A simple shell script to help run [smith](https://github.com/silnrsi/smith) in a dockerized environment (and to ease the transition from Vagrant).

Copy it to **~/bin** (creating it beforehand, if it already exists it will not be overwritten) to add it to your PATH:
```
mkdir -p ~/bin
cp anvil ~/bin/anvil
```

Make it executable:

```
chmod +x ~/bin/anvil
```
Adjust the *docker-compose.yml* file to your liking. 

Run it from anywhere with docker compose reading that configuration file from a standard directory like **~/repos/anvil**:

See a description of all the commands:

```
anvil --help
```

There is also a bash completion script:
```
sudo cp bash_completion_anvil /etc/bash_completion.d/anvil
```

There are also example config files for [WSL](https://learn.microsoft.com/en-us/windows/wsl/) users. 


Enjoy!
