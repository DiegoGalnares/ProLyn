#!bin/bash

read -r -p "Nombre Archivo: " myFile
read -r -p "Directorio: " pathFile

toFind="$(locate $myFile | grep "$pathFile[/$myFile]")"

if [ "$?" -eq 0 ]; then
   
    echo "la ruta del archivo que buscas es: $toFind"
 else
    
    echo "No se encontro el archivo"
fi
