#!/bin/bash



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
