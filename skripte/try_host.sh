#!/bin/bash
description="Der in der Befehlszeile angegeben Rechner (Hostname oder IP-Adresse) soll auf Erreichbarkeit hint überwacht werden. Dazu sendet das Skript in regelmäßigen Zeitabständen ein 'pint' an den angegebenen Rechner (nur ein ping Paket) und wertet den return value aus. War der ping Befehl erfolgreich, wird der Rechnername mit einem Ok-Vermerk ausgegeben, andernfalls wird er mit einem FAILED-Vermerk ausgegeben."
# Talal
# 18.09.2016

usage() {
echo "
$0 [OPTIONS] [-h|-s <sec>] <hostname>|<IP-Adress>
$description
OPTIONS: 
   -h: Ausgabe der Usage Message
   -s <sec>: Ping wird zyklisch alle <sec> Sekunden ausgeführt
   Fehlt die -s Option, wird der ping alle 10 Sekunden ausgeführt.
"
}

ping_custom() {
#result="$(ping -c 1 -i $zeit $host)"

#while : 
#do
  ping -q -i $zeit $host ;
    if [ $?=0 ]
     then
       echo $host OK
    else
       echo $host FAILED
    fi
#done
}

#-------- Main -------
# check parameters
if [ $# -gt 3 ]; then
	usage
	exit 1
fi

case $1 in
	"-h")
	     usage
	     exit 0
	     ;;
	"-s")
 	   case $2 in
                   "")
		      usage
                      exit 1
		      ;;
                    *)
                    case $3 in 
                            "")
				usage
				exit 1
				;;
			    *)
                                zeit=$2
				host=$3
		    esac
		    ;;
	   esac
	   ;;
	*)
	   usage
	   exit 1
esac

ping_custom
