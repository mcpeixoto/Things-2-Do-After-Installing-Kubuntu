# Update system
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y 


# Install packages
apt-get install wget yakuake python3-pip libclang-dev libudev-dev snap git rustc cargo make libusb-1.0-0-dev libdbus-1-dev llvm libclang-dev gnome-keyring gnome-disk-utility python-is-python3 htop python3-tk python3-pil python3-pil.imagetk nvtop cmake protobuf-compiler curl kate dolphin aptitude -y

snap install fluxgui telegram-desktop skype

pip3 install torch pytorch-lightning numpy pandas tables keras tensorflow jupyter sklearn torchvision matplotlib ipython-autotime

# Discord
cd /tmp
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
dpkg -i discord.deb


# INSTALL CHROME
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get update && apt-get install spotify-client

# Stop skype from mutting apps
sed -i 's/load-module module-role-cork/#load-module module-role-cork/' /etc/pulse/default.pa

## install flux
add-apt-repository ppa:nathan-renniewaldock/flux

# We need to replace stupid stuff
sed -i 's/focal/bionic/' /etc/apt/sources.list.d/nathan-renniewaldock-ubuntu-flux-focal.list
apt-get update
apt-get install fluxgui



## Make grub remember last choice
# Make sure these lines are ignored
sed -i 's/GRUB_DEFAULT/#GRUB_DEFAULT/' /etc/default/grub
sed -i 's/GRUB_SAVEDEFAULT/#GRUB_SAVEDEFAULT/' /etc/default/grub

# Add new lines on top of the file
sed -i '1s/^/GRUB_DEFAULT=saved\nGRUB_SAVEDEFAULT=true\n /' /etc/default/grub

update-grub

# Autoinstall drivers
ubuntu-drivers autoinstall
