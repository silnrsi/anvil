## Anvil

A simple script to help run [smith](https://github.com/silnrsi/smith) in a dockerized environment (and to ease the transition from Vagrant).

Copy it to **~/bin** to add it to your PATH:
```
mkdir -p ~/bin
cp anvil ~/bin/anvil
chmod +x ~/bin/anvil
```
Adjust the *docker-compose.yml* file to your liking. 

Run it from anywhere with docker compose reading that configuration file from a standard directory like **~/repos/anvil**

There is also a bash completion script:
```
cat bash_completion_anvil >> ~/.bash_completion
```

Enjoy!