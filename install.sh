#!/bin/bash

echo "Baixando o arquivo keygen.sh..."
wget https://github.com/MTplusWebSystem/KeyGen

cd KeyGen
chmod +x keygen.sh

dependencias="openjdk-17 openssl openssl-tool"

total_dependencias=$(echo $dependencias | wc -w)
dependencias_instaladas=0

for dependencia in $dependencias
do
    if pkg -l | grep -q $dependencia; then
        echo "A dependência $dependencia já está instalada."
    else
        echo "Instalando a dependência $dependencia..."
        pkg install $dependencia -y >> /dev/null
        echo "A dependência $dependencia foi instalada com sucesso."
    fi

    dependencias_instaladas=$((dependencias_instaladas + 1))
    progresso=$((dependencias_instaladas * 100 / total_dependencias))
    barra_de_progresso=$(printf '# %.0s' $(seq 1 $((progresso / 10))))
    echo -ne "Progresso: [$barra_de_progresso] $progresso%\r"
done

echo -e "\n\nTodas as dependências foram instaladas com sucesso."

echo "Copiando keygen.sh para /data/data/com.termux/files/usr/bin/keygen..."
cp keygen.sh /data/data/com.termux/files/usr/bin/keygen
chmod +x /data/data/com.termux/files/usr/bin/keygen


rm -rf KeyGen 

echo "instalação finalizada"
