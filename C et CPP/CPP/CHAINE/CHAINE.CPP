// chaine.cpp
// implémentation de la classe chaine
// PV 10/02.94
                      
#include <iostream.h>                      
#include <string.h>
#include "chaine.h"

chaine::chaine(char *szT0, int iSize)
{   
  if (szT0==NULL)
    iLB = 0;
  else
    iLB = ::strlen(szT0)+1;
  if (iSize>iLB) iLB = iSize;
  
  if (iLB)
  {
    szBuffer = new char[iLB];
    if (szT0!=NULL)
      strcpy(szBuffer, szT0);
    else
      szBuffer[0] = 0;
  }
  else
  { szBuffer = NULL;
    iLB = 0;
  }  
    
#ifdef TRACE
	cout << "Constructeur de base " << *this << '\n';
#endif
}                       
              
              
chaine::chaine(const chaine &c0)
{
	iLB = c0.iLB;
	if (iLB)
	{ 
    szBuffer = new char[iLB];
	  strcpy(szBuffer, c0.szBuffer);
	}
	else
	  szBuffer = NULL;
	
#ifdef TRACE
	cout << "Constructeur copie " << *this << '\n';
#endif
}                       


chaine::~chaine()
{
#ifdef TRACE
	cout << "Destructeur " << *this << '\n';
#endif                           
  if (iLB)
    delete szBuffer;
}


chaine& chaine::operator=(const chaine &c)
{
#ifdef TRACE
	cout << "Opérateur = " << c << " -> " << *this << '\n';
#endif
  if (this != &c)
  {
    if (iLB)
     delete szBuffer;
     
	  if (iLB = c.iLB)
	  { 
      szBuffer = new char[iLB];
	    strcpy(szBuffer, c.szBuffer);
	  }
	  else szBuffer =NULL;
	}
	  
	return *this;
}           


chaine chaine::operator+(const chaine &c)
{              
	chaine c2(NULL, this->strlen()+c.strlen()+1);
	
	strcpy(c2.szBuffer, this->sz());
	strcat(c2.szBuffer, c.sz());
#ifdef TRACE
	cout << "Opérateur + \"" << this->szTexte << "\" + \"" << c.szTexte << "\" -> \"" << c2.szTexte << "\"\n";
#endif
	return c2;
}           


chaine chaine::operator+(char c)
{                                 
  int l = this->strlen();
	chaine c2(NULL, l+2);
	
	strcpy(c2.szBuffer, this->sz());
	c2.szBuffer[l] = c;
	c2.szBuffer[l+1] = 0;
#ifdef TRACE
	cout << "Opérateur + \"" << this->szTexte << "\" + '" << c << "' -> \"" << c2.szTexte << "\"\n";
#endif
	return c2;
}           


const char *chaine::sz() const
{
	if (szBuffer)
	  return szBuffer;
	else
	  return "";
}              


int chaine::strlen() const
{
  if (iLB==0)
    return 0;
  else
    return ::strlen(szBuffer);
}  


char& chaine::operator[](int i)
{                
  if (i>=0 && i<iLB)
	  return szBuffer[i];
	else
	  return szBuffer[0];
}                               


ostream& operator<<(ostream& os, chaine& ch)
{
	return os << '"' << ch.sz() << '"';
}
