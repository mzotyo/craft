# -----------------------------------------------------------------------------
# Text editor
pacman -S vim

# -----------------------------------------------------------------------------
# For generating ssh keys
pacman -S  openssh

# systemctl status sshd
# systemctl start sshd
systemctl enable sshd

# port forward from Vritualox
# guest: 22 -> host: 10.0.2.15:22

# Add hosts public ssh key to the authorized keys
mount -t vboxsf Host /mnt
cp /mnt/id_rsa.pub ~/.ssh/authorized_keys

# Generating ssh key for personal github access
ssh-keygen -t rsa -b 4096 - C "asghtr@freemail.com"

# -----------------------------------------------------------------------------
# For formatting fat and ntfs filesystems
pacman -S dosfstools ntfsprogs

# For example
# makefs -t vfat /dev/sdb1

# -----------------------------------------------------------------------------
# Version manager
pacman -S git

# Git configuration
git config --global user.name "John Doe"
git config --global user.email "asghtr@freemail.com"
git config --global core.editor vim

# -----------------------------------------------------------------------------
# Tmux
pacman -S tmux

# -----------------------------------------------------------------------------
# Midnight Commander
pacman -S mc

# -----------------------------------------------------------------------------
# Image viewer
pacman -S feh
# feh
# feh -F

# -----------------------------------------------------------------------------
#  Web browsers
pacman -S lynx
pacman -S netsurf

# -----------------------------------------------------------------------------
# Command line tools
pacman -S htop

# -----------------------------------------------------------------------------
# Development environment

# JavaScrip, TypeScript
pacman -S nodejs
pacman -S npm

# Java
pacman -S jdk17-openjdk
pacman -S maven

# Markdown to pdf, doc or html
pacman -S pandoc

# -----------------------------------------------------------------------------
# Prerequisits to build stuff
pacman -S base-devel cmake make unzip ninja tree-sitter curl
mkdir ~/Tools

# -----------------------------------------------------------------------------
# Wget downloader
pacamn -S wget

# -----------------------------------------------------------------------------
# Dwm window manager
pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot

# Rendering background
pacman -S nitrogen

# Window compositor: transparency, transition animations, shadows ...
pacman -S picom

# I don't know what is it for but it's needed to start dwm. At least in virtual-box
pacman -S webkit2gtk

# Install driver on my fujitsu-siemens laptop
# pacman -S mesa
# pacman -S xf86-video-ati

# Config graphical ui
cp /etc/X11/xinit/xinitrc .xinitrc

    # vim .xinitrc
    ```shell
    # Keyboard Layout
    setxkbmap hu -model "pc101" -variant "101_qwerty_comma_dead"  &

    # Display Resolution
    xrandr --output Virtual-1 --mode 1920x1080 &

    # Compositor
    picom -f &

    # Set wallpaper
    nitrogen --restore &

    # Execute DWM
    exec dwm
    ```
# Install dwm from suckless
git clone https://git.suckless.org/dwm
cd dwn
make clean install
# make unsinstall

# Install siple terminal from suckless
git clone https://git.suckless.org/st
cd st
make clean install
# make uninstall
# Increase font size to 13

# Install dmenu from suckless
git clone https://git.suckless.org/dmenu
cd dmenu
make clean install

# make uninstall
# Starting the graphival user interface
startx


# -----------------------------------------------------------------------------
reboot
