#!/bin/sh
# P0F - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P0F"
PRACTICA_TOMCAT="P05"
PRACTICA_APACHE="P04"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

PAPACHE="${DIRRAIZ}/../${PRACTICA_APACHE}"
PTOMCAT="${DIRRAIZ}/../${PRACTICA_TOMCAT}"
PJSPPRUEBA="${DIRRAIZ}ejemplo1-servlet"

BORRAR="rm -fR "
COPIAR="cp -Rf "
SERVICE="/sbin/service"

DIRAPACHE="/etc/httpd/"
USER="dit"
DIRUSER="/home/${USER}"
WEBUSER="${DIRUSER}/public_html"




##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES Y PREPARAR EQUIPO PARA LA PRACTICA (DESHACIENDO CAMBIOS SESIONES ANTERIORES)
##################################################

echo "Restaurando configuracion inicial de "${PRACTICA}"\""; read -p "Teclee Intro para continuar... "

clear 

# 1) Detener servidores
${SERVICE} httpd stop        >& /dev/nul
${SERVICE} tomcat stop	      >& /dev/nul

# 2) Apache
# 2.1) Limpiado de instalaciones previas
#${PAPACHE}/${PRACTICA_APACHE}final.sh

# 2.2) Instalar servidor Apache (se usa el del sistema)
# instalar-apache.sh


# 3) Tomcat
# 3.1) Limpiado de instalaciones previas e Instalacion de Tomcat & SDK
${PTOMCAT}/${PRACTICA_TOMCAT}final.sh

# La instalacion de Tomcat vuelve a restaurar la configuracion inicial de Apache!!!
# 3.2) Reconfigurar Apache: Eliminar la linea "UserDir disable" de Apache
${COPIAR} ${PAPACHE}/httpd.conf       ${DIRAPACHE}/conf/httpd.conf

# 3.3) Configurar Tomcat - Manager y contexto usuario
${COPIAR} ${PTOMCAT}/tomcat-users.xml ${DIRTOMCAT}/conf/tomcat-users.xml
${COPIAR} ${PTOMCAT}/server2.xml      ${DIRTOMCAT}/conf/server.xml
${COPIAR} ${PTOMCAT}/users.conf.dit  ${DIRAPACHE}/conf.d/users.conf


# 4) Configurar cuenta de usuario, con ejemplo de prueba
chmod 711 ${DIRUSER}
${BORRAR} ${WEBUSER}
mkdir ${WEBUSER}
${COPIAR} ${PJSPPRUEBA}/* ${WEBUSER}
${COPIAR} ${PAPACHE}/index.html ${WEBUSER}
${COPIAR} ${DIRRAIZ}/index.jsp  ${WEBUSER}
chmod 755 ${WEBUSER}
chown -R ${USER}:${USER} ${DIRUSER}

# 5) Limpiar servlets de Tomcat
${DIRRAIZ}/limpiar_servlets_dit.sh

# 6) Rearrancar servidores
${PTOMCAT}/rearrancar-servidor.sh
