#!/bin/bash

echo "Content-type: text/html"
echo
echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"
echo "<html>"
echo "<head><title>Informacion sobre este servidor</title></head>"
echo "<body><h1>Sobre este servidor:</h1>"
echo "<hr/><pre>"
echo "Nombre Servidor:      $SERVER_NAME<br>"
echo "Puerto:               $SERVER_PORT<br>"
echo "Software:             $SERVER_SOFTWARE<br>"
echo "Software:             $HTTP_USER_AGENT<br>"
echo "Protocolo:            $SERVER_PROTOCOL<br>"
echo "Revision CGI:         $GATEWAY_INTERFACE<br>"
echo "Directorio raiz:      $DOCUMENT_ROOT<br>"
echo "Info.pasada a GET:    $QUERY_STRING<br>"
echo "<hr/></pre>"
echo "<p>Instancia de proceso creada por Apache al invocar este script"
echo "<pre>$(ps axo pid,tty,euser,command | grep ejemplo1)</pre></p>"
echo "</body></html>"
exit 0

