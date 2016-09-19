#!/bin/bash
description="hängt für alle Dateien im aktuellen Verzeichnis die Zeichenkette 'string' an den aktuellen Dateinamen an."
# Talal
# 18.09.2016

usage() { 
echo "
$0 [OPTIONS] [<string>]
$description
OPTIONS: 
   -h: Display this help
"
}

# Liest die Eingabe des Benutzers
read_input() {
	echo "Bitte ein Suffix einfügen:"
	read suffix
}

# Hauptfunktion
rename_all_files() {
for file in *
do
 filename=$(basename "$file")
 extension="${filename##*.}"
 filename="${filename%.*}"
 echo $extension
 mv -v "$file" "$filename$suffix.$extension"
done
}

#-------- Main -------
# check parameters
if [ $# -gt 1 ]; then
	usage
	exit 1
fi

case $1 in
	"-h")
	     usage
	     exit 0
	     ;;
	"")
 	   read_input
	   ;;
	*)
	   suffix=$1
esac

# rename all files
rename_all_files
