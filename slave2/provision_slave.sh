#!/bin/sh

# Variable de mise en forme
RED='\033[0;31m'	# Red Color
YELLOW='\033[0;33m'	# Yellow Color
GREEN='\033[0;32m'	# Grean Color
NC='\033[0m' 		# No Color

#variable
user= "vagrant"

##Fonction: 
#Execution du script en tant que root
root_connect(){
    ID="$(id -u)"
    if ["$ID" -ne 0]; then 
        1>&2 echo "Vous devez executer le script en tant que root"
        exit 1
    fi
}

#Installation des packages sous forme de fonction avec vérification si le package est installé
install_package() {
    PACKAGE="$1"
    if ! dpkg -l |grep --quiet "^ii.$PACKAGE"; then
        apt install -y "$PACKAGE"
    fi
}

#ajout de la source du package d'installation Docker
source_docker() {
    if ! test -f /etc/apt/sources.list.d/docker.list ; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

}


# On prepare l'installation de Docker
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Installation des prérequis Docker ... ${NC}"
apt-get -y update
install_package "apt-transport-https"
install_package "gnupg"
install_package "ca-certificates"
install_package "curl"
install_package "lsb-release"


#Téléchargement de la source Docker
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Déploiement de la source docker ... ${NC}"
source_docker


#Installation de Docker
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Installation de Docker ... ${NC}"
apt-get -y update
install_package "docker-ce"
install_package "docker-ce-cli"
install_package "containerd.io"

#Ajout du user vagrant dans le groupe docker
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Ajout du user vagrant dans le groupe docker ... ${NC}"
usermod -aG docker $user

