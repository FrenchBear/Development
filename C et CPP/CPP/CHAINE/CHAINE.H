// chaine.h
// Interface de la classe chaine
// PV 10/02.94

class chaine
{                
    int	 iLB;					// Longueur du buffer
		char *szBuffer;		// Buffer de stockage
    
  public:
		chaine(char *szT0 = NULL, int iSize=0);
		chaine(const chaine &c0);      
		~chaine();
		chaine& operator=(const chaine &c);
		chaine operator+(const chaine &c);
		chaine operator+(char c);
		const char *sz() const;                
		int strlen() const;
		char& operator[](int i);
    
		friend ostream& operator<<(ostream& os,chaine &ch);
};
