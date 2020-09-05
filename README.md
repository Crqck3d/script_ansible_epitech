# Ansible Playbook - local environment deployment [Ubuntu 20.04]


This Playbook Ansible deploys a custom development environment (almost) compliant with Epitech, enjoy :wink:

### Version Note [v0.1]

> This script is `being improved` and is __not fully configured__ for a development environment of __Epitech's student__!

#### Next features :

- [ ] Full OS support
- [ ] SSH-Key file management
- [ ] Full Epitech Support
- [ ] More explicit variables
- [ ] Management of temporary files

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
sudo apt install ansible
```

Before running the playbook, if you have looked at it, you need to know which network interface you will use the most.
To find out (it's a basic bro), just run `IP addr`.
```
$> ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    [...]
    inet 192.168.1.42/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp2s0
       valid_lft 1098sec preferred_lft 1098sec
    [...]
```
I currently use wifi, which is the `wlp2s0` interface on my computer, I know this because ip addr returns me a private ip on this interface. 

To run the playbook, execute :
```
$> ansible-playbook --ask-become-pass main.yml
BECOME password: 
What is your mail?:
Are you an Epitech student? (true/false) [false]:
Active network interface ? (ip addr) [wlp2s0]:
```

If you want all the results of every command executed, add the "-v" option.
##### Warning: If you are an Epitech student, you must download your ssh key on the Epitech server using blih.

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