#!/bin/bash

# -----------------------------------------------------------------------------
# Text editor
pacman -S vim

# -----------------------------------------------------------------------------
# For formatting fat and ntfs filesystems
pacman -S dosfstools ntfsprogs

# For example
# makefs -t vfat /dev/sdb1

# -----------------------------------------------------------------------------
# For generating ssh keys
pacman -S  openssh
#systemctl status sshd
systemctl start sshd
systemctl enable sshd

# Generating ssh key for personal github access
ssh-keygen -t rsa -b 4096 - C "asghtr@freemail.com"

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
# Configuring Z-shell
pacman -S zsh

# whereis zsh
usermod -s /usr/bin/zsh $(whoami)

# Powerlines
pacman -S powerline
pacman -S zsh-syntax-highlighting

# -----------------------------------------------------------------------------
# Midnight Commander
pacman -S mc

# -----------------------------------------------------------------------------
# Compilers

# Markdown to pdf, doc or html
pacman -S pandoc

# -----------------------------------------------------------------------------
# Links web browser
pacman -S links

# -----------------------------------------------------------------------------
# Command line tools
pacman -S htop

# -----------------------------------------------------------------------------
reboot
