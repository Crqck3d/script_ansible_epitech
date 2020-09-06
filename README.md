# Ansible Playbook - local environment deployment [Ubuntu 20.04]


This Playbook Ansible deploys a custom development environment (almost) compliant with Epitech, enjoy :wink:

### Version Note [v1.0] [Stable]

> This script is `being improved` and is __not fully configured__ for a development environment of __Epitech's student__!

#### Next features :

- [X] SSH-Key file management
- [X] Temporary files management
- [ ] Full OS support
- [ ] More explicit variables
- [ ] Epitech Code Norm

# Description

To execute this project, you need Ansible and the sudoer right.

This playbook will install a custom dev env, so it's mine!

__You can edit the "variables.yml" file to remove or include software.__

### `Variables.yml` :
```
---

  dependencies: ['gcc', 'build-essential', 'valgrind', 'libncurses5', 'curl', 'zsh', 'terminator', 'tree', 'git']
  package: ['openssh-server', 'glances', 'firefox', 'conky-all', 'gnome-tweak-tool', 'net-tools', 'filezilla']
  tools: ['lollypop', 'easytag', 'soundconverter', 'vlc', 'qbittorrent', 'gimp']
  snap: ['discord', 'spotify', 'intellij-idea-ultimate']
```

### `zshrc` :
```
export ZSH="/home/username/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias blih='blih -u usermail'           # Blih for Epitech
alias ns_auth='ns_auth -u usermail'     # Blih for Epitech

alias ll='ls -lah'
alias off='xset dpms force off' #screen off

alias htop='glances'
```
As you can see there is some alias, and yes, I use the software `glances` as `htop`.

# Usage

```
$> sudo apt install ansible
``` 

To run the playbook, execute :
```
$> ansible-playbook --ask-become-pass main.yml
BECOME password:
```
The asked become pass correspond to your password.

> If you are an Epitech student, you will need to pass your blih password as a parameter if you want to upload your ssh-key to the Epitech server.
```
$> ansible-playbook --ask-become-pass main.yml --extra-var blihPass=UrPass
BECOME password:
```
If you want all the results of every command executed, add the "-v" option.

## Software List

   * Tools
       -
       - Terminator
       - ZSH
       - Conky
       - Gnome-Tweak-Tool
       - Net-tools

   * Software
       -
       - IDE
            * [IntelliJ IDEA](https://www.jetbrains.com/fr-fr/idea/)
       - User
            * Firefox
            * Filezilla
            * qBittorrent
            * Gimp
   * Multimedia
       - 
       - Music Software (wav / flac support)
            * [SoundConverter](https://doc.ubuntu-fr.org/soundconverter)
            * [EasyTag](https://doc.ubuntu-fr.org/easytag)
            * [Lollypop](https://doc.ubuntu-fr.org/lollypop)
       - Other
            * Discord
            * Spotify
            * VLC

## Built With

* [Ansible](https://docs.ansible.com/ansible/latest/index.html)

## Author

* **Thibaut Choppy** - *Initial work* - [Linkedin](https://www.linkedin.com/in/thibaut-choppy/)