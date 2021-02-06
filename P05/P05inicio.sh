#!/bin/sh
# P05 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P05"
PRACTICA_PREVIA="P04"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

BORRAR="rm -Rf"
COPIAR="cp -Rf"
SERVICE="/sbin/service"



##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################

echo Restaurando configuracion inicial de "${PRACTICA}"; read -p "Teclee Intro para continuar... "

# ESTA PRACTICA PERTENECE A UN BLOQUE INDEPENDIENTE DE LAS PRACTICAS ANTERIORES
# Recargar configuracion practica anterior
printf "\n" | ${DIRRAIZ}/../${PRACTICA_PREVIA}/${PRACTICA_PREVIA}final.sh
# cd ${DIRRAIZ}

######################################################
# C) DESHACER CAMBIOS REALIZADOS EN LA PRACTICA ACTUAL
######################################################

service tomcat stop							>& /dev/null
service httpd stop							>& /dev/null

${BORRAR} /usr/share/tomcat/      					>& /dev/null
tar xvzpf ${DIRRAIZ}tomcat_usr_share.tar.gz -C /usr/share/		>& /dev/null

${BORRAR} /etc/tomcat/      						>& /dev/null
tar xvzpf ${DIRRAIZ}tomcat_etc.tar.gz -C /etc/				>& /dev/null

${BORRAR} /usr/share/java/tomcat/      					>& /dev/null
tar xvzpf ${DIRRAIZ}tomcat_usr_share_java.tar.gz -C /usr/share/java/	>& /dev/null

${BORRAR} /var/lib/tomcat/     						>& /dev/null
tar xvzpf ${DIRRAIZ}tomcat_var_lib.tar.gz -C /var/lib/			>& /dev/null

${BORRAR} /var/cache/tomcat/     					>& /dev/null
tar xvzpf ${DIRRAIZ}tomcat_var_cache.tar.gz -C /var/cache/		>& /dev/null

${BORRAR} /usr/libexec/tomcat/     					>& /dev/null
tar xvzpf ${DIRRAIZ}tomcat_usr_libexec.tar.gz -C /usr/libexec/		>& /dev/null

VAR="/var/log/tomcat"
${BORRAR} $VAR >& /dev/null; mkdir -p $VAR >& /dev/null; chown tomcat:root $VAR; chmod 660 $VAR

VAR="/usr/sbin/tomcat"
${BORRAR} $VAR >& /dev/null; ${COPIAR} ${DIRRAIZ}/tomcat.sbin ${VAR} >& /dev/null; chown root:root $VAR; chmod 755 $VAR

VAR="/sbin/tomcat"
${BORRAR} $VAR >& /dev/null; ${COPIAR} ${DIRRAIZ}/tomcat.sbin ${VAR} >& /dev/null; chown root:root $VAR; chmod 755 $VAR



# Añadir "NAME="tomcat" (lo usa el script de servicio) a /etc/tomcat/tomcat.conf
${COPIAR} ${DIRRAIZ}/tomcat.sysconfig /etc/sysconfig/tomcat

cp -Rf ${DIRRAIZ}/tomcat.service  /lib/systemd/system/		>& /dev/nul
systemctl daemon-reload				>& /dev/nul
systemctl reset-failed				>& /dev/nul


# Tomcat: configuracion de partida
${COPIAR} ${DIRRAIZ}/server.xml.orig  /etc/tomcat/server.xml
#${COPIAR} ${DIRRAIZ}/tomcat.conf.orig /etc/tomcat/tomcat.conf


# Borrar carpetas pruebas
${BORRAR}  /tmp/webapps                       >& /dev/null




##################################################
# Si se mantiene Systemd, desactivar la restriccion "PrivateTmp" sobre el directorio /tmp


#===

# Preparar script de servicio SysVInit
# No funcionan bien cosas como el "$TOMCAT_USER" (siempre arranca como root),
# Si existe /etc/init.d/tomcat => "service tomcat start" usa ese script (y no a Systemd)
#ln -s /usr/sbin/tomcat /etc/init.d//tomcat


#===

export CATALINA_HOME=/usr/share/tomcat
export CATALINA_BASE=${CATALINA_HOME}
# ${COPIAR} ${DIRRAIZ}/profile  /etc/

# echo y | yum install java-1.7.0-openjdk-devel

