#! /bin/bash

#####################################
##### NO MODIFIQUE ESTE FICHERO #####
#####################################


# CARGA LAS VARIABLES CORRESPONDIENTES A LAS IPs PARTICULARES DEL EQUIPO CLIENTE
# Variables: IP_router_subred_I, IP_cliente_en_subred_AB, IP_cliente_en_subred_I
ORIGEN=`dirname $0`
DIRRAIZ=${ORIGEN}"/"

IP_router_subred_I="xxx.xxx.xxx.xxx"
IP_cliente_en_subred_AB="xxx.xxx.xxx.xxx"
IP_cliente_en_subred_I="xxx.xxx.xxx.xxx"

. ${DIRRAIZ}ping_pruebas.conf

# OTRAS DIRECCIONES (NO CAMBIAR)
IP_ait08A="172.16.17.126"
IP_ait08B="172.16.17.254"
IP_ait08="ait08.us.es"
IP_ESI="www.google.es"

ping0="ping -c 3 -I eth0 "
ping1="ping -c 3 -I eth1 "

clear
rellenar=0
ejecutar=0	# Entrar en menu
while [ ${ejecutar} -eq 0 ]
do
    echo
    echo
    echo "Banco de pruebas ping (ejecutar en Cliente DHCP)"
    echo
    if [ "xxx.xxx.xxx.xxx" = ${IP_router_subred_I} ]; then
	rellenar=1
    fi
    if [ "xxx.xxx.xxx.xxx" = ${IP_cliente_en_subred_AB} ]; then
	rellenar=1
    fi
    if [ "xxx.xxx.xxx.xxx" = ${IP_cliente_en_subred_I} ]; then
	rellenar=1
    fi
    if [ $[rellenar] -eq 1 ]; then
	echo
        echo "Antes de comenzar, debe editar el fichero \"ping_script.conf\" (NO edite este script)"
	echo "y adecuar las direcciones IP a las del equipo cliente que esta usando."
	echo
	echo
	ejecutar=1
    else
        echo
        echo "Seleccione el comando ping que desea realizar (se enviaran 3 mensajes ICMP por comando):"
        echo
        echo "1) ${ping0} ${IP_router_subred_I}  	|    8) ${ping1} ${IP_router_subred_I}"
        echo "2) ${ping0} ${IP_cliente_en_subred_AB}  	|    9) ${ping1} ${IP_cliente_en_subred_AB}"
        echo "3) ${ping0} ${IP_cliente_en_subred_I}    	|   10) ${ping1} ${IP_cliente_en_subred_I}"
        echo "4) ${ping0} ${IP_ait08A} 	|   11) ${ping1} ${IP_ait08A}"
        echo "5) ${ping0} ${IP_ait08B}	|   12) ${ping1} ${IP_ait08B}"
        echo "6) ${ping0} ${IP_ait08}	|   13) ${ping1} ${IP_ait08}"
        echo "7) ${ping0} ${IP_ESI}	|   14) ${ping1} ${IP_ESI}"
        echo "q) Salir."
        echo 
        read -p "Opcion seleccionada: " opcion
        case ${opcion} in
            1 )
    		${ping0} ${IP_router_subred_I}
    	        ;;
            2 )
    		${ping0} ${IP_cliente_en_subred_AB}
    	        ;;
	    3 )
    	        ${ping0} ${IP_cliente_en_subred_I}
    	        ;;
	    4 )
    	        ${ping0} ${IP_ait08A}
    	        ;;
    	    5 )
	        ${ping0} ${IP_ait08B}
	        ;;
	    6 )
		${ping0} ${IP_ait08}
		;;
	    7 )
		${ping0} ${IP_ESI}
		;;
    	    8 )
		${ping1} ${IP_router_subred_I}
    		;;
    	    9 )
    		${ping1} ${IP_cliente_en_subred_AB}
    		;;
    	    10 )
    		${ping1} ${IP_cliente_en_subred_I}
    		;;
    	    11 )
    		${ping1} ${IP_ait08A}
    		;;
	    12 )
		${ping1} ${IP_ait08B}
		;;
	    13 )
		${ping1} ${IP_ait08}
		;;
	    14 )
		${ping1} ${IP_ESI}
		;;
	    q )
		ejecutar=1
		;;
    	    * )
		ejecutar=0
		clear
		echo
		echo
    		echo "Opcion no valida..."
		echo
		echo
    		;;
	esac
    fi
done
