#! /bin/bash

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
sudo apt-get update && sudo apt-get upgrade

# Build tools
sudo apt-get install -y build-essential procps curl file golang-go ca-certificates \
    binutils build-essential dkms linux-headers-$(uname -r) make

# Install Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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

# Install Virtual Box 7
sudo apt install -y virtualbox virtualbox-ext-pack
sudo usermod -a -G vboxusers $USER

## Flatpaks

# Flameshot
flatpak install -y flathub org.flameshot.Flameshot

# Visual Code
flatpak install -y flathub com.visualstudio.code

# Thunderbird
flatpak install -y flathub org.mozilla.Thunderbird

# Chrome
flatpak install -y flathub com.google.Chrome

# Edge
flatpak install -y flathub com.microsoft.Edge

# Proton VPN
flatpak install -y flathub com.protonvpn.www

# Proton Pass
flatpak install -y flathub me.proton.Pass

# Spotify
flatpak install -y flathub com.spotify.Client

# Steam
flatpak install -y flathub com.valvesoftware.Steam

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

# Install k9s
brew install derailed/k9s/k9s

# Install oh-my-posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
oh-my-posh font install meslo
mkdir ~/.themes/omp-themes
wget -o ~/.themes/omp-themes/craver.omp.json https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/craver.omp.json
echo "eval \"\$(oh-my-posh init bash --config ~/.themes/omp-themes/craver.omp.json)\"" >> ~/.bashrc ## Após trocar a fonte no perfil do terminal para Meslo e reinicie o terminal

# Install logo-ls-modernized
curl https://raw.githubusercontent.com/UTFeight/logo-ls-modernized/master/INSTALL | bash
