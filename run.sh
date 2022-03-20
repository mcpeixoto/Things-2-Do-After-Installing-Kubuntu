
# Install packages
apt-get install yakuake python3-pip libclang-dev libudev-dev snap git rustc cargo make libusb-1.0-0-dev libdbus-1-dev llvm libclang-dev gnome-keyring gnome-disk-utility python-is-python3 htop python3-tk python3-pil python3-pil.imagetk nvtop cmake protobuf-compiler curl -y

snap install snap-store skype fluxgui telegram-desktop discord skype

pip3 install torch pytorch-lightning numpy pandas tables keras tensorflow jupyter sklearn torchvision matplotlib ipython-autotime

# INSTALL CHROME
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get install spotify-client

# Stop skype from mutting apps
sed -i 's/load-module module-role-cork/#load-module module-role-cork/' /etc/pulse/default.pa



## Make grub remember last choice
# Make sure these lines are ignored
sed -i 's/GRUB_DEFAULT/#GRUB_DEFAULT/' /etc/pulse/default.pa
sed -i 's/GRUB_SAVEDEFAULT/#GRUB_SAVEDEFAULT/' /etc/pulse/default.pa

# Add new lines on top of the file
sed -i '1s/^/GRUB_DEFAULT=saved\nGRUB_SAVEDEFAULT=true\n /' file
