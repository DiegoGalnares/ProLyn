#!/bin/bash
cat<<_INTRO_
         _               _               _                 _                 _               _               _              _           _        _            _               _      
        /\ \            /\ \            /\ \              / /\              /\ \            /\ \            _\ \           / /\        /\ \     /\_\         /\ \            /\ \    
       /  \ \          /  \ \          /  \ \            / /  \            /  \ \          /  \ \          /\__ \         / /  \       \ \ \   / / /        /  \ \          /  \ \   
      / /\ \ \        / /\ \ \        / /\ \ \          / / /\ \          / /\ \ \        / /\ \ \        / /_ \_\       / / /\ \       \ \ \_/ / /        / /\ \ \        / /\ \ \  
     / / /\ \_\      / / /\ \_\      / / /\ \_\        / / /\ \ \        / / /\ \_\      / / /\ \_\      / / /\/_/      / / /\ \ \       \ \___/ /        / / /\ \_\      / / /\ \_\ 
    / / /_/ / /     / / /_/ / /     / /_/_ \/_/       / / /\ \_\ \      / /_/_ \/_/     / / /_/ / /     / / /          / / /  \ \ \       \ \ \_/        / /_/_ \/_/     / / /_/ / / 
   / / /__\/ /     / / /__\/ /     / /____/\         / / /\ \ \___\    / /____/\       / / /__\/ /     / / /          / / /___/ /\ \       \ \ \        / /____/\       / / /__\/ /  
  / / /_____/     / / /_____/     / /\____\/        / / /  \ \ \__/   / /\____\/      / / /_____/     / / / ____     / / /_____/ /\ \       \ \ \      / /\____\/      / / /_____/   
 / / /           / / /\ \ \      / / /______       / / /____\_\ \    / / /______     / / /           / /_/_/ ___/\  / /_________/\ \ \       \ \ \    / / /______     / / /\ \ \     
/ / /           / / /  \ \ \    / / /_______\     / / /__________\  / / /_______\   / / /           /_______/\__\/ / / /_       __\ \_\       \ \_\  / / /_______\   / / /  \ \ \    
\/_/            \/_/    \_\/    \/__________/     \/_____________/  \/__________/   \/_/            \_______\/     \_\___\     /____/_/        \/_/  \/__________/   \/_/    \_\/    
                                                                                                                                                                                     
_INTRO_

#FUNCIONES
menu () {
	echo "Comandos"
#	echo "s              ->              Siguiente cancion"
	echo "loop           ->              Poner en loop la cancion"
	echo "Aleatorio      ->              Cancion en aleatorio "
	echo "Salir          ->              Salir"
	echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
}



#Comprobar que este instalado mpg123
aux=0
c=""
b=""
existe=exec mpg123 --version
if [ $? -ne 0 ]
then
	echo "NO ESTA INSTALADO MPG123"
	echo "¿Deseas instalarlo?(S/N)"
	while [ $aux -eq 0 ]; do
		read opc
		if [ $opc == "S" ]; 
		then
			sudo apt install mpg123
			echo "Listo"
			aux=1
		elif [ $opc == "s" ]
		then
			sudo apt install mpg123
                        echo "Listo"
                        aux=1  
		elif [ $opc == "N" ];
		then
			stop
		elif [ $opc == "n" ]
		then
			stop
		else
			echo "La opcion indicada no existe"
		fi
	done
else
	echo $c
	echo " "
fi 

clear

read -p "Ingresa la direccion de tu carpeta de musica comenzando desde el directorio raíz " directorio

#mpg123 $directorio*.mp3

if [ $? = 0 ]
then
	echo "     ;;;;;;;;;;;;;;;;;;;"
	echo "     ;;;;;;;;;;;;;;;;;;;"
	echo "     ;    M U S I C    ;"
	echo "     ;                 ;"
	echo "     ;                 ;"                
	echo "     ; 1.loop- song    ;"
	echo "     ; 2.random- list  ;"		
	echo "     ; 3.exit          ;"
	echo "     ;                 ;"
	echo ",;;;;;            ,;;;;;"
	echo ";;;;;;            ;;;;;;"
	echo "';;;;'            ';;;;'"
	echo "*SE ESTA REPRODUCIENDO*"
	#mpg123 -q $directorio* 2> file.txt
else
	echo "No se pudo abrir"
	stop
fi

salir=0

while [ $salir -eq 0 ];
do
    mpg123 -q $directorio* 2> file.txt &
    printf "\n$PWD@$usuario@proLyn$~ " 
    read op

    case $op in

	'loop')
		read -p "Ingresa el nombre de la cancion: " cancion
	 	read -p "¿Cuantas veces quieres repetirlo?" lp
		killall mpg123 2> file.txt
		mpg123 -q -l $lp $cancion.mp3 &
    ;;
	'random')

	 	killall mpg123 2> file.txt
	 	mpg123 -q -Z --list $directorio* &
	;;
	'exit')
		
		killall mpg123 2> file.txt
		exit
	;;
	*)
	op $op
	;;
	esac
done
#mpg123 -@ $directorio
killall mpg123 2> file.txt

#Indicaciones
aux2=0

while [ $aux2 -eq 0 ]; do
	
	read -p ""
	
done
