# Script de pós instalação, utilizado para o Pop OS 22.04
# Instalação dos meus aplicativos e ferramentas de uso cotidiano

# Instalação do repositório da Microsoft: Debian-based Linux distributions

# Download the repo config package:
curl -sSL -O https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Install the repo config package:
sudo dpkg -i packages-microsoft-prod.deb

# Delete the repo config package after installing:
rm packages-microsoft-prod.deb

# Update package index files:
sudo apt-get update

# Install GIT
sudo apt-get install -y git-all

# Install dotnet 6.0 & 8.0
sudo apt-get install -y dotnet-sdk-6.0
sudo apt-get install -y dotnet-sdk-8.0

# Install kubectl
# Download the latest release with the command:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install azure vpn client
sudo apt-get install -y microsoft-azurevpnclient

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install k9s
brew install derailed/k9s/k9s

# Flatpaks

# Flameshot
flatpak install flathub org.flameshot.Flameshot

# Visual Code
flatpak install flathub com.visualstudio.code

# Thunderbird
flatpak install flathub org.mozilla.Thunderbird

# Chrome
flatpak install flathub com.google.Chrome

# Edge
flatpak install flathub com.microsoft.Edge

# Proton VPN
flatpak install flathub com.protonvpn.www

# Proton Pass
flatpak install flathub me.proton.Pass

# Spotify
flatpak run com.spotify.Client

# Steam
flatpak install flathub com.valvesoftware.Steam