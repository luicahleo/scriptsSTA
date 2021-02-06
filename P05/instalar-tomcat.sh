#!/bin/sh
# P05 - Script de instalacion de Tomcat

PRACTICA="P05"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

echo "Instalando el servidor Tomcat..."
echo
#yum install tomcat

echo "Arrancando servidores Tomcat y Apache:"
${DIRRAIZ}/rearrancar-servidor.sh
