#!/bin/bash

######### Dibujo del ahorcado ###########

err1="_!===[]"
err2="_!___[]"
err3="_o___[]"
err4="/|\__[]"
err5="/ \__[]"
errdef="_____[]"

cat<<_GAMETITLE_
___________.____           __                                  .___     .__   
\_   _____/|    |         |__|__ __   ____   ____   ____     __| _/____ |  |  
 |    __)_ |    |         |  |  |  \_/ __ \ / ___\ /  _ \   / __ |/ __ \|  |  
 |        \|    |___      |  |  |  /\  ___// /_/  >  <_> ) / /_/ \  ___/|  |__
/_______  /|_______ \ /\__|  |____/  \___  >___  / \____/  \____ |\___  >____/
        \/         \/ \______|           \/_____/               \/    \/      
       .__                                     .___      
_____  |  |__   ___________   ____ _____     __| _/____  
\__  \ |  |  \ /  _ \_  __ \_/ ___\\__  \   / __ |/  _ \ 
 / __ \|   Y  (  <_> )  | \/\  \___ / __ \_/ /_/ (  <_> )
(____  /___|  /\____/|__|    \___  >____  /\____ |\____/ 
     \/     \/                   \/     \/      \/       

_GAMETITLE_
#LEER PALABRA PARA EL JUEGO
echo -e "\e[1;34mIngresa la palabra para que el segundo jugador la descubra"
read PALABRA

#OBTENER PALABRA PARA EL JUEGO
i=0
TAM=${#PALABRA}
while [ $i -lt $TAM ]; do
	POCULTA=$POCULTA"_|"
	i=` expr $i + 1 `
done
echo "$POCULTA"

#CICLOS PARA EL JUEGO
clear
c=1;
OPCION=0
MUERTE=0
posi=0
letra=""
while [ $OPCION -ne 1 ]; do
	if [ $MUERTE -gt 0 ];
	then
		echo $err1
	else
		echo " "
	fi
	if [ $MUERTE -gt 1 ];
	then
		echo $err2
	else
		echo " "
	fi
	if [ $MUERTE -gt 2 ];
	then
		echo $err3
	else
		echo " "
	fi
	if [ $MUERTE -gt 3 ];
	then
		echo $err4
	else
		echo " "
	fi
	if [ $MUERTE -gt 4 ];
	then
		echo $err5
		echo $errdef
	else 
		echo " "
	fi
	if [ $MUERTE -gt 5 ]
	then
		echo "|--------------------|"
		echo "|--------------------|"
		echo "|------PERDISTE------|"
		echo "|--------------------|"
		echo "|--------------------|"
		exit
	fi
	#COMPROBAR SI GANO
	va1=0
	c3=0
	gano=1
	while [ $va1 -lt $TAM ];
	do
		va1=` expr $va1 + 1 `
		c3=$(echo $POCULTA | cut -d"|" -f$va1)
		if [ $c3 = "_" ]; 
		then
			gano=0
		fi
	done
	if [ gano == 1 ]; 
	then
                echo "|--------------------|"
                echo "|--------------------|"
                echo "|------GANASTE-------|"
                echo "|--------------------|"
                echo "|--------------------|"
		break
	fi
	echo "Ingresa una letra: "
	read letra
	clear
	posi=0
	cont=0
	b1=$PALABRA
	aux=`expr index "$b1" "$letra"`
	if [ $aux -eq 0 ];
	then
		echo $aux
		MUERTE=` expr $MUERTE + 1 `
	fi
	k=0
	gano=1
	while [ $aux -ne 0 ];
	do
		k=` expr $k + 1 `
		b1=$(echo $PALABRA | cut -d$letra -f$k)
		aux=${#b1}
		if [ $cont -lt $TAM ];
		then
			aux=` expr $aux + 1 `
			cont=` expr $cont + $aux `
			k2=0
			letra2="|"
			b2=""
			respaldo=""
			while [ $k2 -lt $TAM ];
			do
				k2=`expr $k2 + 1 `
				c2=$(echo $p | cut -d$letra2 -f$k2)
				if [ $k2 -eq $cont ];
				then
					respaldo=$respaldo$letra"|"
				else
					respaldo=$respaldo$b2"|"
				fi
			done
			p=$respaldo
		fi
	done
	echo "---->$respaldo<-----"
done
