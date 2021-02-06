#!/bin/sh
# P05 - Script de instalacion de Tomcat

PRACTICA="P05"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

COPIAR="cp -f"


${COPIAR}  ${DIRRAIZ}/server-no-8080.xml   /etc/tomcat/server.xml

[ $? = 0 ] && echo "Escucha de Tomcat en el puerto 8080 desactivada..."
