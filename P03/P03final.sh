#!/bin/sh
# P03 - Script de finalizacion de la practica
# Realiza las operaciones llevadas a cabo en la practica, dejando
# el equipo en el estado en que debe situarse tras finalizarla.


PRACTICA="P03"

# Al terminar la practica P03 el equipo debe estar en el mismo estado que antes de realizarla
ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

$DIRRAIZ/P03inicio.sh

rm -Rf /home/dit/tmp/ >& /dev/nul
