#!/bin/sh
# P04 - Script de reseteo
# Elimina todas las operaciones realizadas en la practica, devolviendo
# el equipo a su configuracion de partida antes de comenzarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA_APACHE="P04"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ="${ORIGEN}/../${PRACTICA_APACHE}/"

BORRAR="rm -fR "
COPIAR="cp -Rf"
SERVICE="/sbin/service"

APACHE_CONF="/etc/httpd/"
ETC_OPENSSL_PKI_DIR="/etc/pki/"
ETC_OPENSSL_PKI="etc_openssl.tar.gz"





##################################################
# B) ASEGURAR CAMBIOS DE LAS PRACTICAS ANTERIORES
##################################################


cd ${DIRRAIZ}

#ifdown eth1; ifdown eth0; ifup eth0
#pkill -9 nfs; pkill -9 mount
#service autofs restart


######################################################
# C) DESHACER CAMBIOS REALIZADOS EN LA PRACTICA ACTUAL
######################################################

# Regenerar carpetas de Apache
${SERVICE}   httpd stop  >& /dev/nul

${BORRAR} /etc/httpd/      					>& /dev/null
tar xvzpf ${DIRRAIZ}apache_etc.tar.gz -C /etc/			>& /dev/null

${BORRAR} /usr/share/httpd/      					>& /dev/null
tar xvzpf ${DIRRAIZ}apache_usr_share.tar.gz -C /usr/share/	>& /dev/null

${BORRAR} /var/www/      					>& /dev/null
tar xvzpf ${DIRRAIZ}apache_var_www.tar.gz -C /var/		>& /dev/null

VAR="/var/log/httpd"
${BORRAR} $VAR; mkdir -p $VAR; chown root:root $VAR; chmod 600 $VAR

${BORRAR} /etc/pki/tls/      					>& /dev/null
tar xvzpf ${DIRRAIZ}apache_etc_pki.tar.gz  -C /etc/pki/		>& /dev/null

${COPIAR} ${DIRRAIZ}hosts   	/etc/				>& /dev/nul
${COPIAR} ${DIRRAIZ}mime.types  /etc/				>& /dev/nul
${COPIAR} ${DIRRAIZ}httpd  	/etc/sysconfig/httpd		>& /dev/nul


# Restaurar suexec
pkill -9 suexec							>& /dev/nul
${BORRAR} /usr/sbin/suexec					>& /dev/nul
${COPIAR} ${DIRRAIZ}suexec  /usr/sbin/				>& /dev/nul
chmod 5100 /usr/sbin/suexec					>& /dev/nul
chown root:apache /usr/sbin/suexec				>& /dev/nul



# Carpeta usuario dit
chown     -R  dit:dit /home/dit/        		>& /dev/nul
chmod     755         /home/dit/			>& /dev/nul
