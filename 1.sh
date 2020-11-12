#!/bin/bash

read -p "Usuario: " usuario
read -p "Contraseña: " contrasena

#Buscando usuario y contraseña en /etc/shadow
export contrasena
pswd=`sudo grep "$usuario:" /etc/shadow | cut -d ':' -f2`
export salt=`echo $pswd | cut -d ':' -f2`
export hpsw=`echo $pswd | cut -d ':' -f3`
check=$(perl -le 'print crypt ("ENV{contrasena}","\$$ENV{$salt}$$ENV{hpsw}\$")')
salir=1

#Validando existencia de usuario y contraseña
if [[ "$hpw" == "$check" ]]
then 
    printf "\nUSUARIO Y CONTRASEÑA CORRECTOS\n"
    salir=0
else
    printf "\nDATOS INCORRECTOS\n"
    echo "VUELVE A INTENTARLO"
    exit    
fi


#Si el usuario y contraseña fueron válidos, entramos a bash
#Aqui va una portada
#echo "escribe "ayuda" para desplegar menu: "

while [ $salir -eq 0 ];
do
    read -p "prolyn@$usuario~$" command

    case $command in

    'arbol')
        bash arbol2.sh
        ;;
        'fecha')
        bash fecha.sh
    ;;
        'ayuda')
        bash ayuda.sh
        ;;
        'infosis')
        bash infosis.sh
        ;;
        'salir')
        exit
        ;;
        *)
        command $command
        ;;
        esac
done

