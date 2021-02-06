#!/bin/sh
###############
# Cambia los permisos de la carpeta indicada y de sus ficheros recursivamente.
# Sintaxis:
#
# cambiar_permisos.sh   ddd   fff    /ruta
#
#
# siendo:
# + "ddd": permisos en decimal para los directorios
# + "fff": permisos en decimal para los ficheros regulares
#
# Ejemplo:
#
# cambiar_permisos.sh   664   771    /tmp/www
#
################

PERM_D=$1
PERM_F=$2
DIR="$3"

###### SOLUCION COMPACTA  ####

# find "${DIR}" -type f -exec chmod ${PERM_F} {} \;
# find "${DIR}" -type d -exec chmod ${PERM_D} {} \;

##############################

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"


if [ -d "$DIR" ]; then

    # Carpeta indicada
    chmod ${PERM_D} "$DIR"

    # Contenido carpeta
    for fichero in "$DIR/"*; do
        # echo "$fichero - Pulsa ..."; read XXX

        # Directorios (Recursivo)
        [ -d "$fichero" ] && ${DIRRAIZ}/cambiar_permisos.sh   ${PERM_D} ${PERM_F} "$fichero"

        # Ficheros regulares
        [ -f "$fichero" ] && chmod ${PERM_F} "$fichero"
    done
elif [ -f "$DIR" ]; then
    # Fichero indicado
    chmod ${PERM_F} "$DIR"
fi
