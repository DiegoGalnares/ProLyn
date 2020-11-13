#!/bin/bash

read -p "Usuario: " usuario
read -p "Contraseña: " contrasena

#Buscando usuario y contraseña en /etc/shadow
hpass=`sudo -S grep -r $usuario /etc/shadow`

    if [ ${hpass} > 1 ]; then 

        IFS='$' read -r -a array <<< "$hpass"  
        prefix="\$${array[1]}\$${array[2]}"
        hash=`python -c 'import crypt; import sys; print crypt.crypt( sys.argv[1] , sys.argv[2])' $contrasena $prefix`

        match=`echo "$hpass" | grep -c "$hash"`
        exec 2> myerror
    fi

    if [ "$match" -eq 1 ]; then
        clear
        echo -e "USUARIO Y CONTRASEÑA CORRECTOS"
        salir=0
    else
        echo -e "USUARIO Y CONTRASEÑA INCORRECTOS" 
        exit
    fi

#Si el usuario y contraseña fueron válidos, entramos a bash
#Aqui va una portada
#echo "escribe "ayuda" para desplegar menu: "

while [ $salir -eq 0 ];
do
    printf "\n$PWD@$usuario@proLyn$~\t" 
    read command

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