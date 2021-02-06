#!/bin/sh
# P01 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P01"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -fR "
COPIAR="cp -f"
SERVICE="/sbin/service"



##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################

echo "Restaurando configuracion inicial de "${PRACTICA}"\""; read -p "Teclee Intro para continuar... "

# Recargar configuracion P00 
printf "\n" | ${DIRRAIZ}/../P00/P00final.sh
cd ${DIRRAIZ}

######################################################
# C) DESHACER CAMBIOS REALIZADOS EN LA PRACTICA ACTUAL
######################################################

#Copiar etc/exports original
${COPIAR} ${DIRRAIZ}exports  /etc

# Si securetty permisos w para otros =>
# Bloquea acceso root en todas las consolas
${COPIAR} ${DIRRAIZ}securetty  /etc

# TCP Wrappers
${COPIAR} ${DIRRAIZ}hosts.allow  /etc
${COPIAR} ${DIRRAIZ}hosts.deny  /etc




# Recargar xinetd
${BORRAR} /etc/xinetd.conf
${BORRAR} /etc/xinetd.d
${BORRAR} /etc/xinetd*.conf
${BORRAR} /etc/rc.d/init.d/xinetd
${BORRAR} /etc/sysconfig/xinetd
tar xpzf  ${DIRRAIZ}confxinetd.tar.gz -C /etc  >& /dev/nul


# Eliminar servicio "servicioLsc"
chkconfig --del servicioLsc  >& /dev/nul
${BORRAR} /etc/rc.d/init.d/servicioLt
${BORRAR} /etc/rc.d/init.d/servicioLsc
${BORRAR} /etc/rc.d/init.d/plantilla_script_servicio

