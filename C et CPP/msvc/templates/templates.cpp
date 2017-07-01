#include <iostream.h>
#include <string.h>
#include <malloc.h>

template <class T> void Swap(T& a, T& b)
{
  T c = a;
  a = b;
  b = c;
}

class CString
{
private:
  char *s;

public:
  CString() { s=NULL; }
  CString(char *s0) { s=strdup(s0); }
  CString(CString &s0) { s = strdup(s0.s); }

  CString &operator =(CString &s0)
  { if (s) free(s);
    s = strdup(s0.s);
	return *this;
  }
  operator const char *() {return s; }

  ~CString() { if (s) free(s); }
};


int main()
{
  int	i = 1, j = 2;
  char	k = 'K', l = 'L';
  double d1=1.0, d2=2.0;
  CString s1="Pierre", s2="VIOLENT";

  Swap(i, j );
  Swap(k, l );
  Swap(d1, d2);
  Swap(s1, s2);

  cout << "i=" << i << "; j=" << j << endl;
  cout << "k='" << k << "'; l='" << l << "'" << endl;
  cout << "d1=" << d1 << "'; d2=" << d2 << endl;
  cout << "s1=\"" << s2 << "\"; s2=\"" << s2 << "\"" << endl;

  return 0;
}
