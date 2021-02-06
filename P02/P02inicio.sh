#!/bin/sh
# P02 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P02"
PRACTICA_PREVIA="P01"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -fR "
SERVICE="/sbin/service"
CHKCONFIG="/sbin/chkconfig"


ETC_DIR="/etc"
ETC_FILES="etc_files.tar.gz"

##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################

echo "Restaurando configuracion inicial de "${PRACTICA}"\""; read -p "Teclee Intro para continuar... "

# Eliminar posible configuracion del servidor DHCP
${BORRAR} ${ETC_DIR}/dhcp/ >& /dev/nul
${BORRAR} /var/lib/dhcpd/* >& /dev/nul

# Restablecer posibles modificaciones en directorio /etc (anadiendo configuracion interfaces)
# incluyendo /etc/dhcp/
# Se hace en P00inicio.sh

# Recargar configuracion practica anterior
printf "\n" | ${DIRRAIZ}/../${PRACTICA_PREVIA}/${PRACTICA_PREVIA}final.sh
cd ${DIRRAIZ}

######################################################
# C) DESHACER CAMBIOS REALIZADOS EN LA PRACTICA ACTUAL
######################################################

# Eliminar ficheros de configuracion de las interfaces
/sbin/ifdown eth1 >& /dev/nul
${BORRAR} ${ETC_DIR}sysconfig/network-scripts/ifcfg-* >& /dev/nul
${BORRAR} ${ETC_DIR}sysconfig/network-scripts/.ifcfg-* >& /dev/nul


# Carpeta de copia
rm -Rf /home/dit/tmp/ >& /dev/nul
mkdir /home/dit/tmp/ >& /dev/nul



# Eliminar posible configuracion del servidor DHCP
${SERVICE} dhcpd stop
touch /var/lib/dhcpd/dhcpd.leases
${CHKCONFIG} dhcpd off

# Restablecer posibles modificaciones en directorio /etc (anadiendo configuracion interfaces)
# Se hace en P00inicio.sh

# Recargar la red (hecho en P00)
#ifdown eth0 >& /dev/nul; ifdown eth1 >& /dev/nul; ${SERVICE} network restart >& /dev/nul

# Reactivar las respuestas al ping y desactivar el forwarding
#echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all
#echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
#echo 0 > /proc/sys/net/ipv4/ip_forward
sysctl -p
