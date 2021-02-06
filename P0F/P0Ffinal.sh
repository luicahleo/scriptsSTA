#!/bin/sh
# P0F - Script de finalizacion de la practica
# Realiza las operaciones llevadas a cabo en la practica, dejando
# el equipo en el estado en que debe situarse tras finalizarla.

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P0F"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"


##################################################
# B) APLICAR LOS CAMBIOS QUE DEBEN QUEDAR APLICADOS TRAS REALIZAR ESTA PRACTICA
##################################################
$DIRRAIZ/${PRACTICA}inicio.sh
