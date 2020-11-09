#!/bin/bash

# Comando “infosis”: Muestra información sobre el sistema dondese está ejecutando la terminal. Debe mostrar la información de
# qué usuarios se encuentran logeados, la memoria ram, la
# arquitectura, y la versión del sistema operativo.

echo -e "\n\e[33mUsuarios en sesión actual:\n"
who
echo -e "\n\e[33mInformación memoria RAM:\n"
free
echo -n -e "\n\e[33mArquitectura del sistema tipo: "
uname -m
echo -n -e "\n\e[33mSistema operativo:"
hostnamectl | tail -n3 | head -n1 | cut -d ':' -f 2
echo -n -e "\n\e[33mKernel:"
hostnamectl | tail -n2 | head -n1 | cut -d ':' -f 2
echo ""