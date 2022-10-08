## Anvil

A simple shell script to help run [smith](https://github.com/silnrsi/smith) in a dockerized environment (and to ease the transition from Vagrant).

### macOS and Ubuntu users
Copy it to **~/bin** to add it to your PATH:
```
mkdir -p ~/bin
cp anvil ~/bin/anvil
    (alternatively, if you want to keep the script current from the repository, you can make a symbolic link: ln -s ~/repos/anvil/anvil ~/bin/anvil)
chmod +x ~/bin/anvil
```
Adjust the *docker-compose.yml* file to your liking. 

Run it from anywhere with docker compose reading that configuration file from a standard directory like **~/repos/anvil**:

```
anvil
```

There is also a bash completion script:
```
cat bash_completion_anvil >> ~/.bash_completion
```

### Windows users
There is an equivalent batch file for Windows users (although bash is now installable, bash scripts have to be prefixed with sh to run from a particular folder).

to add the batchfile to your PATH type:
```
setx PATH "%PATH%;C:\Users\username\repos\anvil"
```

Adjust the *docker-compose.yml* file to your liking.

Run it from anywhere with docker compose reading that configuration file from a standard directory like **~/repos/anvil**:

```
anvil
```

Enjoy!
