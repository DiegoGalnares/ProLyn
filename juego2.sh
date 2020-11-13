#!bin/bash

jugadas=('Piedra' 'Papel' 'Tijeras');

echo "-------- TUS POSIBLES JUGADAS----------"
echo "1. PIEDRA"
echo "2. PAPEL"
echo "3. TIJERAS"
echo "4. SALIR DEL JUEGO"

while :
do
	read -p "¿Con que quieres jugar?: " jugada
	clear
	NMR=`expr $RANDOM % 3`

  case $jugada in
	'piedra')
		echo  "ELEGISTE PIEDRA"
		echo "TU OPONENTE ELIGE ${jugadas[$NMR]}"

		if [ "$NMR" -eq "0" ] 
		then
		   echo -e "\e[1;36mE M P A T E\e[1;36m"
		elif [ "$NMR" -eq "1" ] 
		then
		   echo -e "\e[1;32mP E R D I S T E\e[1;32m"
		elif [ "$NMR" -eq "2" ]
		then
		   echo -e "\e[1;35m¡ G A N A S T E !\e[1;35m"
		fi
		;;
	'papel')
		echo "ELEGISTE PAPEL"
		echo "TU OPONENTE ELIGE ${jugadas[$NMR]}"

		if [ "$NMR" -eq "0" ] 
		then
		   echo -e "\e[1;35m¡ G A N A S T E !\e[1;35m"
		elif [ "$NMR" -eq "1" ] 
		then
		   echo -e "\e[1;36mE M P A T E\e[1;36m"
		elif [ "$NMR" -eq "2" ]
		then
		   echo -e "\e[1;32mP E R D I S T E\e[1;32m"
		fi
		;;
	'tijeras')
		echo "ELEGISTE TIJERAS"
		echo "TU OPONENTE ELIGE ${jugadas[$NMR]}"

		if [ "$NMR" -eq "0" ] 
		then
		   echo -e "\e[1;32mP E R D I S T E\e[1;32m"
		elif [ "$NMR" -eq "1" ] 
		then
		   echo -e "\e[1;35m¡ G A N A S T E !\e[1;35m"
		elif [ "$NMR" -eq "2" ]
		then
		   echo -e "\e[1;36mE M P A T E\e[1;36m"
		fi
		;;
	'salir')
		echo -e "\e[1;35m¡NOS ENTRISTECE QUE TE VAYAS!:(\e[1;35m"
		break
		;;
  esac
done

