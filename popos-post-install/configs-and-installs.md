# Configurações e Instalações Pop OS 22.04

## Instalações

### Instalação do repositório da Microsoft: Debian-based Linux distributions

``` bash
# Download the repo config package:
curl -sSL -O https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Install the repo config package:
sudo dpkg -i packages-microsoft-prod.deb

# Delete the repo config package after installing:
rm packages-microsoft-prod.deb
```

### Atualizar arquivos de índice de pacotes

``` bash
sudo apt-get update && sudo apt-get upgrade
```

### Instalar ferramentas de build

``` bash
sudo apt-get install -y \
    build-essential \
    procps \
    curl \
    file \
    golang-go \
    ca-certificates \
    apt-transport-https \
    gnupg \
    lsb-release \
    binutils \
    build-essential \
    dkms \
    linux-headers-$(uname -r) \
    make \
    neofetch
```

### Instalar o Docker

``` bash
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Instalar o GIT

``` bash
sudo apt-get install -y git-all
```

### Instalar o dotnet 6.0 & 8.0

``` bash
sudo apt-get install -y dotnet-sdk-6.0
sudo apt-get install -y dotnet-sdk-8.0
```

### Instalar o RClone (backup)

``` bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```