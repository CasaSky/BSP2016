/*
* Erstellt eine neue Datei mit dem vom Benutzer gegebenen Namen
*
* Talal # 18.09.2016
*
*/

#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

int main () {
	int datei; // Creat Funktion Rueckgabewert	
	char name[30]; // Name der Datei
	do {	
	printf("Name der neuen Datei: ");
	scanf("%s", name);
	} while(strlen(name)>30);	
	//fgets (name, 30, stdin);
	printf("\n");
	// Erzeugt eine neue Datei. Falls die Datei bereits existiert, wird ih Inhalt geloescht.
	datei = creat(name, 0700);
	close(datei);
	// Hinweis ob die Datei erfolgreich erstellt wurde
	if (datei == -1) {
		printf("Die Datei %s konnte nicht angelegt werden!\n", name);
	} else {
		printf("Die Datei %s wurde erfolgreich angelegt!\n", name);
	}	
	return 0;
}
