#!/bin/sh
# P05 - Script de adaptacion de Tomcat a Apache

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P05"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -Rf"
COPIAR="cp -Rf"

SERVICE="/sbin/service"

DIR=/etc/httpd/conf.d
MOD_JK=mod_jk.conf
WORKERS=mod_jk_workers.properties

##################################################
# B) INSTALACION
##################################################


echo "Parando servidores Apache y Tomcat..."
service httpd stop  >& /dev/null
service tomcat stop >& /dev/null

echo "Copiando ficheros necesarios. Espere mientras se realiza la copia..."

# Preparando configuracion de Tomcat
${COPIAR} ${DIRRAIZ}/mod_jk.conf.nuevo                /etc/httpd/conf.d/mod_jk.conf 		   >& /dev/null
${COPIAR} ${DIRRAIZ}/mod_jk_workers.properties.nuevo  /etc/httpd/conf.d/mod_jk_workers.properties  >& /dev/null
${COPIAR} ${DIRRAIZ}/ssl-jk.conf                      /etc/httpd/conf.d/ssl.conf 		   >& /dev/null
${COPIAR} ${DIRRAIZ}/users.conf.orig 		      /etc/httpd/conf.d/users.conf		   >& /dev/null
${BORRAR} /etc/httpd/conf.d/userdir.conf							   >& /dev/null




echo "Arrancando servidores Tomcat y Apache:"
${DIRRAIZ}/rearrancar-servidor.sh


echo "Proceso concluido.. Proceda con su analisis en el navegador"
