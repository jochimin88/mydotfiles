#!/bin/bash

sudo pacman -Syu --nocomfirm
sudo pacman -S net-tools unrar speedtest-cli python-pip git base-devel bat lsd wget kitty neovim go --noconfirm

# Install Yay

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm
yay
cd ..

# blackarch repo
curl -s -O https://blackarch.org/strap.sh && chmod +x strap.sh

sudo ./strap.sh

sudo pacman -Syu --nocomfirm

# To Install SearchSploit way and some hacking tools
sudo pacman -S exploitdb whatweb gobuster dirbuster wfuzz wpscan metasploit nmap responder evil-winrm --noconfirm

# Install node versioner
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts



################################## Install Fonts #####################################

#create folder fonts
mkdir fonts
cd fonts/
# download fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
wget https://fontlot.com/downfile/5baeb08d06494fc84dbe36210f6f0ad5.105610
paru -S nerd-fonts-jetbrains-mono ttf-font-awesome ttf-material-design-icons

######################################################################################


# Install packages and dependecies to run AwesomeWM  

paru -S awesome-git picom-git alacritty rofi todo-bin acpi acpid \
wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
brightnessctl alsa-utils alsa-tools pulseaudio lm_sensors \
mpd mpc mpdris2 ncmpcpp playerctl --needed


# Run services lauch mpd on login
systemctl --user enable mpd.service
systemctl --user start mpd.service

# For charger plug/unplug events (if you have a battery)
sudo systemctl enable acpid.service
sudo systemctl start acpid.service

# zsh
paru -S zsh-autosuggestions zsh-syntax-highlighting 
https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh 
su
cd /usr/share && mkdir zsh-sudo
chown jochimin zsh-sudo
exit
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh 

# locate
sudo pacman -S locate
sudo updatedb
