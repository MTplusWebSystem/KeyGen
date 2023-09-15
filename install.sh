wget https://github.com/MTplusWebSystem/KeyGen/blob/main/keygen.sh;

chmod 777 keygen.sh;

./keygen.sh



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
