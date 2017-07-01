// BufferGlissant.h
// Interface d'une file de caractères
// 25/6/96 PV

#define BUFFERGLISSANT_LENGTH 20

class CBufferGlissant
{
private:
  char m_szBuffer[BUFFERGLISSANT_LENGTH+1];
  int m_iLength;

public:
  CBufferGlissant();
  void AjouteCaractere(char c);
  int bChaineDeFin(char *szFin);
};

