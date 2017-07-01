
#include <iostream.h>

void main()
{
  char firstInitial;
  char lastName[4];
  int  age;

  do
  { if (cin.fail())
    { cin.clear();              // effacement de la condition d'erreur
      cin.ignore(100, '\n');    // ignore la fin de ligne
    }

    cout << "Entrez votre nom, l'initiale de votre pr‚nom et votre age" << endl;
    
    cin >> lastName;
    if (cin.fail())
    { cout << "Le nom doit ˆtre une chaŒne !" << endl;
      continue;
    }

    cin >> firstInitial;
    if (cin.fail())
    { cout << "L'initiale du pr‚nom doit ˆtre un simple caractŠre !" << endl;
      continue;
    }

    cin >> age;
    if (cin.fail())
    { cout << "L'ƒge doit ˆtre un nombre !" << endl;
      continue;
    }

    cin.ignore(100, '\n');    // ignore la fin de ligne

  } while (cin.fail() && !cin.bad());

  if (!cin.bad())
  { cout << "Nom: " << firstInitial << ". " << lastName << endl;
    cout << "Age: " << age << endl;
  }

}
