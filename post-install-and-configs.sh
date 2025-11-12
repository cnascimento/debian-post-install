#! /bin/bash

# Este script instala ferramentas básicas para um engenheiro de software focado em DevOps e desenvolvimento .NET em distribuições Linux baseadas em Debian (como Ubuntu).
# Execute com privilégios de root ou use sudo: sudo ./setup.sh
# Certifique-se de que o sistema está atualizado antes de rodar.

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute este script como root ou com sudo."
  exit 1
fi

# Atualiza os repositórios e o sistema
echo "Atualizando repositórios e sistema..."
apt update -y
apt upgrade -y

# Instala pacotes básicos
echo "Instalando pacotes básicos..."
apt install -y \
  git \
  curl \
  wget \
  nano \
  build-essential \
  unzip \
  zip \
  gnupg \
  apt-transport-https \
  ca-certificates \
  software-properties-common




# Limpa cache do apt
apt autoremove -y
apt clean

echo "Instalação concluída! Reinicie o terminal ou faça logout/login para aplicar mudanças (ex: grupo docker)."
echo "Verifique as versões instaladas: dotnet --version, docker --version, git --version, etc."