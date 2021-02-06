PRACTICA="P05"
ACTUAL=`pwd` && cd `dirname $0` && ORIGEN=`pwd` && cd ${ACTUAL}
DIRRAIZ=${ORIGEN}"/"


JDK=java-1.7.0-openjdk-devel

echo "Instalando paquete Java..."
#yum install ${JDK}

echo "Verificando que la instalacion del paquete Java ha sido correcta..."
/usr/bin/java -version

