// testch.cpp
// test de la classe chaine
// PV 10/02.94

#include <iostream.h>
#include <ctype.h>

#include "chaine.h"


void main()
{
	chaine debut,fin,total;
  
	debut = "Il était ";
	fin = "un petit navire";
	total = debut+fin;

	cout << total << '\n';
	
	chaine alphabet;
	for (char lettre='A' ; lettre<='Z' ; lettre++)
	  alphabet = alphabet + lettre;
	cout << alphabet << '\n';
	
	for (int i=alphabet.strlen() ; i-- ; )
	  alphabet[i] = tolower(alphabet[i]);
	cout << alphabet << '\n';
}