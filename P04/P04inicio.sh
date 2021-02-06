#!/bin/sh
# P04 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P04"
PRACTICA_PREVIA="P03"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -fR "
COPIAR="cp -Rf"
SERVICE="/sbin/service"
BORRAR_USUARIO="userdel -f -r "

APACHE_CONF="/etc/httpd/"
ETC_OPENSSL_PKI_DIR="/etc/pki/"
ETC_OPENSSL_PKI="etc_openssl.tar.gz"





##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################

echo "Restaurando configuracion inicial de "${PRACTICA}"\""; read -p "Teclee Intro para continuar... "

# Recargar configuracion practica anterior
printf "\n" | ${DIRRAIZ}/../${PRACTICA_PREVIA}/${PRACTICA_PREVIA}final.sh

# La restauracion de Apache se hace desde la P00 (se usa en varias Practicas)
# /P00/P00-Apache.sh

# Eliminar carpetas web creadas en la practica
${BORRAR} /tmp/www                			>& /dev/nul
${BORRAR} /tmp/www1               			>& /dev/nul
${BORRAR} /tmp/www2               			>& /dev/nul
${BORRAR} /tmp/www3               			>& /dev/nul
${BORRAR} /tmp/www4               			>& /dev/nul
${BORRAR} /tmp/test-mpm		  			>& /dev/nul
${BORRAR} /tmp/raiz               			>& /dev/nul
${BORRAR} /tmp/test               			>& /dev/nul
${BORRAR} /tmp/IPport80               			>& /dev/nul
${BORRAR} /tmp/IPport8080             			>& /dev/nul
${BORRAR} /tmp/NamePort80              			>& /dev/nul
${BORRAR} /tmp/NamePort8080            			>& /dev/nul
${BORRAR} /tmp/http               			>& /dev/nul
${BORRAR} /tmp/https               			>& /dev/nul
${BORRAR} /home/dit/public_html  			>& /dev/nul
${BORRAR} /home/dit/www          			>& /dev/nul
${BORRAR} /home/dit/tmp/				>& /dev/nul
mkdir     /home/dit/tmp/				>& /dev/nul

# Borrar usuarios
${BORRAR_USUARIO} test >& /dev/nul

# Desactivar SELinux
setenforce 0<--><------><------>>& /dev/nul
