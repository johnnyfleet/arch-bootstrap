#Arch-Bootstrap
This project aims to bootstrap arch linux. Basically giving me a chance to learn more about linux. I'm quite impressed with my knowledge so far asI can at least understand what a problem might be and how I might google to overcome them on arch. Arch seems to have a good amount og wiki info and community support and while it won't be my main device I certainly like the idea of it. 

##First steps
My first point of learning was to install arch via a combo of the following articles:

- <https://itsfoss.com/install-arch-linux/|itsfoss - Install Arch Linux>: I found this good overall but I liked more of the simplicity of the second article. 
- <https://www.maketecheasier.com/how-to-install-arch-linux/|maketecheasier - how to install Arch Linux>: This one combined with above got me booted. Make note that worth installing nano, net-tools (ifconfig) and dhcpcd with pacman. 
- <https://itsfoss.com/things-to-do-after-installing-arch-linux/|itsfoss - things to do after installing Arch Linux>: Use this to understand how to install a display manager etc. 

##Plans for this repo
Rather than install over and over, I'd like to create a bootstrap script to install all the key points I'd want. Ideally could then use packer to bake and vagrant to install. 

- Install base OS
- Create user
- Set up networking
- Install key packages
- Install desktop manager. 

