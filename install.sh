


echo "
      █ █▄░█ █▀ ▀█▀ ▄▀█ █░░ █░░
      █ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▄▄"
      
wget https://github.com/MTplusWebSystem/KeyGen/blob/main/keygen.sh;

chmod 777 keygen.sh;

./keygen.sh


lista="openjdk-17 openssl openssl-tool"


cp keygen.sh /data/data/com.termux/files/usr/bin/keygen 
chmod  777 /data/data/com.termux/files/usr/bin/keygen 
rm ~/keygen.sh


echo -n "["
for dependencia in $lista
do
    if ! pkg -l | grep -q $dependencia; then
        pkg install $dependencia -y >> /dev/null
    fi
    
    dependencias_instaladas=$((dependencias_instaladas + 1))
    progresso=$((dependencias_instaladas * 100 / total_dependencias))
    barra_de_progresso=$(printf '# %.0s' $(seq 1 $((progresso / 10))))
    echo -ne "$barra_de_progresso] $progresso%\r"
    
done
 
echo -e "\n\nTodas as dependências foram instaladas com sucesso."
