#!/bin/sh
# P00 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################

PRACTICA="P00"
PRACTICA="P00"


ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -fR "
COPIAR="cp -f "
SERVICE="/sbin/service"
CHKCONFIG="/sbin/chkconfig"
BORRAR_USUARIO="userdel -f -r "

ETC_DIR="/etc/"
ETC_FILES="etc_files.tar.gz"

##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################

echo "Restaurando configuracion inicial de "${PRACTICA}"\""; read -p "Teclee Intro para continuar... "

# Activar SSH
systemctl enable sshd.service >& /dev/nul

cp -f ${DIRRAIZ}/telnet /etc/xinetd.d/telnet

######################################################
# C) DESHACER CAMBIOS REALIZADOS EN LA PRACTICA ACTUAL
######################################################

# Telnet desactivado en P00

# Restablecer posibles modificaciones en directorio /etc
cp        ${DIRRAIZ}${ETC_FILES}  ${ETC_DIR}
cd        ${ETC_DIR}
${BORRAR} ${ETC_DIR}sysconfig/network-scripts/ifcfg-* >& /dev/nul
${BORRAR} ${ETC_DIR}ssh/ >& /dev/nul
tar xfvz  ${ETC_DIR}${ETC_FILES} >& /dev/nul
${BORRAR} ${ETC_DIR}${ETC_FILES}


# Eliminar posible fichero de configuracion de la interfaz eth1
${BORRAR} ${ETC_DIR}sysconfig/network-scripts/ifcfg-eth1 >& /dev/nul

# Recargar la red
${SERVICE} sshd restart >& /dev/nul
ifdown eth0 >& /dev/nul; ifdown eth1 >& /dev/nul; ${SERVICE} network restart >& /dev/nul
${SERVICE} iptables stop

# Reactivar las respuestas al ping
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all

# Eliminar fichero ethers
${BORRAR} /etc/ethers


# Eliminar otros usuarios
${BORRAR_USUARIO} usuario1 >& /dev/nul
${BORRAR_USUARIO} usuario2 >& /dev/nul
${BORRAR_USUARIO} usuario3 >& /dev/nul
${BORRAR_USUARIO} usuario4 >& /dev/nul


# Desactivar cortafuegos
${COPIAR} ${DIRRAIZ}iptables         /etc/sysconfig/  >& /dev/nul
service iptables stop >& /dev/nul

# Provisional
#echo Y | yum install putty  >& /dev/nul
${COPIAR} ${DIRRAIZ}sudoers         /etc/  >& /dev/nul



# Apache se usa en varias Practicas => Restaurarlo desde la P00
# Recargar configuracion practica anterior
${DIRRAIZ}/../${PRACTICA}/${PRACTICA}-Apache.sh

