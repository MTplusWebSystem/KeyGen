#!/bin/bash


echo "
      █ █▄░█ █▀ ▀█▀ ▄▀█ █░░ █░░
      █ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▄▄"
      

lista="openjdk-17 openssl openssl-tool"


if [ ! -f controle_instalacao ]; then
    apt update -y
    apt upgrade -y
    touch controle_instalacao
    touch limite.txt
fi
cp keygen.sh /data/data/com.termux/files/usr/bin/keygen 
chmod  777 /data/data/com.termux/files/usr/bin/keygen 
rm ~/keygen.sh
echo -n "["
for dependencia in $lista
do
    # Verifique se a dependência já está instalada antes de tentar instalá-la novamente
    if ! dpkg -l | grep -q $dependencia; then
        pkg install $dependencia -y >> /dev/null
    fi
    
    dependencias_instaladas=$((dependencias_instaladas + 1))
    progresso=$((dependencias_instaladas * 100 / total_dependencias))
    barra_de_progresso=$(printf '# %.0s' $(seq 1 $((progresso / 10))))
    echo -ne "$barra_de_progresso] $progresso%\r"
    
done
 
 echo "1" > limite.txt
 
echo -e "\n\nTodas as dependências foram instaladas com sucesso."

clear
#menu inicio
echo -e "\0033[1;33m
=============================================
#    #                  #####
#   #  ###### #   #    #     # ###### #    #
#  #   #       # #     #       #      ##   #
###    #####    #      #  #### #####  # #  #
#  #   #        #      #     # #      #  # #
#   #  #        #      #     # #      #   ##
#    # ######   #       #####  ###### #    #
=============================================
\0033[1;32m
      █▀█ █░░ ▄▀█ █▄█   █▀ ▀█▀ █▀█ █▀█ █▀▀
      █▀▀ █▄▄ █▀█ ░█░   ▄█ ░█░ █▄█ █▀▄ ██▄
"
sleep  5


    openssl genpkey -algorithm RSA -out chave-privada.pem



    openssl req -new -x509 -key chave-privada.pem -out certificado-x509.pem



    openssl pkcs12 -export -out certificado.p12 -inkey chave-privada.pem -in certificado-x509.pem



    keytool -importkeystore -srckeystore certificado.p12 -srcstoretype PKCS12 -destkeystore certificado.jks -deststoretype JKS


#fim menu
