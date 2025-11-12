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

### Instalar a azure vpn client

``` bash
sudo apt-get install -y microsoft-azurevpnclient
```

Observações: Instalando o cliente de VPN da Azure, ocorre um conflito de roteamento entre interface WiFi e VPN. Identificado que a VPN estava com prioridade incorreta para tráfego de internet geral. É preciso adicionar rota padrão pelo WiFi com métrica menor (100)

    # Para ver as rotas atuais
    ip route show
  
    # Adicionar rota padrão com WiFi com métrica menor
    sudo ip route add default via 192.168.1.1 dev wlp0s20f3 proto dhcp metric 100

e remover rota duplicada com métrica 600 do WiFi. Deixar apenas uma rota default para WiFi com métrica 100.


    # Remover rota padrão do WiFi com métrica maior
    sudo ip route del default via 192.168.1.1 dev wlp0s20f3 metric 600

Para testes, basta pingar o DNS público do google, se não houver perdas de pacotes a correção funcionou.

    ping 8.8.8.8

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

### Instalar o Azure CLI

``` bash
sudo mkdir -p /etc/apt/keyrings

curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
  gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

sudo apt-get update

sudo apt-get install azure-cli
```

### Instalar Kubectl e Kubelogin

Usar o azure cli para instalar o Kubectl e o Kubectl login. A documentação sobre isso está aqui: https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-install-cli()

``` bash
# install (May require using the command ‘sudo’)
az aks install-cli
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

### Instalar o Helm

Por script

``` bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

rm get_helm.sh
```

### Instalar o Visual Studio Code

Acessar o link https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions e realizar o download do .deb package (64-bit)

``` bash
sudo apt install ./<file>.deb

# If you're on an older Linux distribution, you will need to run this instead:
# sudo dpkg -i <file>.deb
# sudo apt-get install -f # Install dependencies
```

### Instalar o Bat

Verificar possível nova versão: https://github.com/sharkdp/bat/releases

``` bash
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb
sudo dpkg -i bat_0.24.0_amd64.deb
```

Configurar o theme tokyonight_night

``` bash
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
# Replace _night in the lines below with _day, _moon, or _storm if needed.
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
bat cache --build
bat --list-themes | grep tokyo # should output "tokyonight_night"

export BAT_THEME=tokyonight_night # Esta variável coloquei no .bash_custom
```

### Instalar o RClone (backup)

``` bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```

### Instalar o TLP

Referência: https://www.baeldung.com/linux/limit-battery-charge-level

``` bash
sudo apt-get install tlp
```
