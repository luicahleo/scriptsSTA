#!/bin/sh
# P03 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P03"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -fR "
COPIAR="cp -f"
SERVICE="/sbin/service"




##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################

echo "Restaurando configuracion inicial de "${PRACTICA}"\""; read -p "Teclee Intro para continuar... "

# Recargar configuracion P02 (deja telnet en estado inactivo) y reubicar en el directorio de trabajo
printf "\n" | ${DIRRAIZ}/../P02/P02final.sh
cd ${DIRRAIZ}

######################################################
# C) DESHACER CAMBIOS REALIZADOS EN LA PRACTICA ACTUAL
######################################################

#Copiar /etc/exports original
${COPIAR} ${DIRRAIZ}exports  /etc


# Recargar
${COPIAR} ${DIRRAIZ}iptables         /etc/sysconfig/
${COPIAR} ${DIRRAIZ}iptables-config  /etc/sysconfig/


# Carpeta de copia
rm -Rf /home/dit/tmp/ >& /dev/nul
#mkdir -p /home/dit/tmp/${PRACTICA}
mkdir /home/dit/tmp/ >& /dev/nul



# Recargar configuracion de iptables
${SERVICE} iptables restart
