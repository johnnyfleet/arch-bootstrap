# Arch-Bootstrap
This project aims to bootstrap arch linux. Basically giving me a chance to learn more about linux. I'm quite impressed with my knowledge so far asI can at least understand what a problem might be and how I might google to overcome them on arch. Arch seems to have a good amount og wiki info and community support and while it won't be my main device I certainly like the idea of it. 

## First steps
My first point of learning was to install arch via a combo of the following articles:

- [itsfoss - Install Arch Linux](https://itsfoss.com/install-arch-linux/): I found this good overall but I liked more of the simplicity of the second article. 
- [maketecheasier - how to install Arch Linux](https://www.maketecheasier.com/how-to-install-arch-linux/): This one combined with above got me booted. Make note that worth installing nano, net-tools (ifconfig) and dhcpcd with pacman. 
- [itsfoss - things to do after installing Arch Linux](https://itsfoss.com/things-to-do-after-installing-arch-linux/): Use this to understand how to install a display manager etc. 

## Plans for this repo
Rather than install over and over, I'd like to create a bootstrap script to install all the key points I'd want. Ideally could then use packer to bake and vagrant to install. 

- Install base OS
- Create user
- Set up networking
- Install key packages
- Install desktop manager. 

## Getting started
Ok, first things first. You'll need to download the arch ISO and then boot on a VM. 
Once booted follow the instructions [on the wiki here](https://wiki.archlinux.org/index.php/Install_from_SSH) to set up remote SSH access. 
In short: 
- Boot ISO
- Check IP `ifconfig`
- set root password with `passwd`
- enable ssh with `systemctl enable sshd.service`

## Bootstrap time!
- Now boot `ssh root@1<IP> "bash -s" < arch-bootstrap.sh`
