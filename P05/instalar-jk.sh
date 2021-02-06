#!/bin/sh
# P05 - Script de instalacion del conector JK

######################
# A) CARGAR VARIABLES
######################
PRACTICA="P05"

ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"

COPIAR="cp -f"
BORRAR="rm -fR "
SERVICE="/sbin/service"

DIR=/home/dit/tmp
DIR_JAVA=/usr/share/java/
JK_DIR=tomcat-connectors-1.2.41-src
JK_TAR=tomcat-connectors-1.2.41-src.tar.gz

MODULO="mod_jk.so"

##################################################
# B) INSTALACION
##################################################

echo "Instalador del conector JK"; read -p "Teclee Intro para continuar... "
echo "Copiando ficheros necesarios. Espere mientras se realiza la copia..."
if [ -f ${DIRRAIZ}${MODULO} ]; then
    # Si el modulo esta compilado, se copia directamente
    cp ${DIRRAIZ}${MODULO}  /etc/httpd/modules/mod_jk.so
    echo "Modulo \"mod_jk\" ubicado en /etc/httpd/modules/mod_jk.so"
else
    echo "Instalando paquetes necesarios para la compilacion..."
    echo Y | yum install httpd-devel
    echo Y | yum install libtool

    echo "Compilando el conector"; read -p "Teclee Intro para continuar... "

    tar xvzf ${JK_TAR} -C /tmp/
    cd /tmp/${JK_DIR}/native/
    ./buildconf.sh
    ./configure --with-apxs=/usr/bin/apxs
    make; make install
    ${BORRAR} /tmp/${JK_DIR}/
fi

chmod  755  /etc/httpd/modules/mod_jk.so

echo
echo "Modulo \"mod_jk\" ubicado en /etc/httpd/modules/mod_jk.so"
echo

source /etc/profile

#export JAVA_HOME=/usr/java/j2sdk
#export JAVA_BIN=/usr/share/java/j2sdk/bin
#export PATH=$PATH:$JAVA_HOME:$JAVA_BIN
#export CATALINA_HOME=/usr/share/tomcat
#export CONNECTOR_HOME=/usr/share/java/jk
