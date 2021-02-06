#!/bin/sh
# P04 - Script de finalizacion de la practica
# Realiza las operaciones llevadas a cabo en la practica, dejando
# el equipo en el estado en que debe situarse tras finalizarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P04"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

COPIAR="cp -f"


##################################################
# B) APLICAR LOS CAMBIOS QUE DEBEN QUEDAR APLICADOS TRAS REALIZAR ESTA PRACTICA
##################################################
$DIRRAIZ/${PRACTICA}inicio.sh

${COPIAR}  ${DIRRAIZ}/apache.crt  /etc/pki/tls/certs/
${COPIAR}  ${DIRRAIZ}/apache.key  /etc/pki/tls/private/
${COPIAR}  ${DIRRAIZ}/ssl.conf    /etc/httpd/conf.d/

