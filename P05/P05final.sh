#!/bin/sh
# P05 - Script de finalizacion de la practica
# Realiza las operaciones llevadas a cabo en la practica, dejando
# el equipo en el estado en que debe situarse tras finalizarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P05"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"


##################################################
# B) APLICAR LOS CAMBIOS QUE DEBEN QUEDAR APLICADOS TRAS REALIZAR ESTA PRACTICA
##################################################
$DIRRAIZ/${PRACTICA}inicio.sh
# $DIRRAIZ/instala-java.sh
$DIRRAIZ/instalar-tomcat.sh
$DIRRAIZ/instalar-jk.sh
$DIRRAIZ/adaptar-tomcat-apache.sh
$DIRRAIZ/tomcat-no-8080.sh
cp $DIRRAIZ/tomcat-users.xml $CATALINA_HOME/conf
rm -Rf /home/dit/tmp/ >& /dev/nul
mkdir /home/dit/tmp/ >& /dev/nul
