SERVICIO=service
CATALINA_HOME=/usr/java/tomcat
echo "Parando servidores..."
${SERVICIO} httpd stop  >& /dev/null
${SERVICIO} tomcat stop >& /dev/null
echo "Arrancando servidores..."
${SERVICIO} tomcat start
${SERVICIO} httpd start

echo "Servicio Web recargado"

