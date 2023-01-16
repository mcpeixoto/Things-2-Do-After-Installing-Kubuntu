# Update system
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y 


# Install packages
apt-get install wget yakuake python3-pip libclang-dev libudev-dev snap git rustc cargo make libusb-1.0-0-dev libdbus-1-dev llvm libclang-dev gnome-keyring gnome-disk-utility python-is-python3 htop python3-tk python3-pil python3-pil.imagetk nvtop cmake protobuf-compiler curl kate dolphin aptitude -y

snap install --edge fluxgui
snap install code --classic
snap install telegram-desktop skype

python -m pip install --upgrade pip
# pip3 install torch pytorch-lightning numpy pandas tables keras tensorflow jupyter sklearn torchvision matplotlib ipython-autotime

# Discord
sudo apt install gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb  -y

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

## Make grub remember last choice
# Make sure these lines are ignored
sed -i 's/GRUB_DEFAULT/#GRUB_DEFAULT/' /etc/default/grub
sed -i 's/GRUB_SAVEDEFAULT/#GRUB_SAVEDEFAULT/' /etc/default/grub

# Add new lines on top of the file
sed -i '1s/^/GRUB_DEFAULT=saved\nGRUB_SAVEDEFAULT=true\n /' /etc/default/grub

update-grub

# Autoinstall drivers
ubuntu-drivers autoinstall

# Install asusctl
# URL: https://gitlab.com/asus-linux/asusctl
sudo apt install libgtk-3-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libglib2.0-dev cmake libclang-dev libudev-dev libayatana-appindicator3-1 -y
sudo apt remove rustc -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://gitlab.com/asus-linux/asusctl
cd asusctl
source "$HOME/.cargo/env"
make
sudo make install
systemctl daemon-reload && systemctl restart asusd


# Install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# Install timeshift
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt-get update
sudo apt-get install timeshift


# Noisetorch
wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz
tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

# write to ~/.profile
"""
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
"""
echo "if [ -d "$HOME/.local/bin" ] ; then" >> ~/.profile
echo "    PATH="$HOME/.local/bin:$PATH"" >> ~/.profile
echo "fi" >> ~/.profile




# Autoremove / Cleanup
sudo apt autoremove -y



### WRITTING TO BASHRC
# Alias
echo "alias ll='ls -l'" >> ~/.bashrc
echo "alias cenv='python -m venv .env'" >> ~/.bashrc
