class temporaire { public: int temp; };
class employe { public: int emp; };
class secretaire : public employe { public: int sec; };

class secretaire_temporaire : public secretaire, public temporaire { public: int st; };

void main()
{
  secretaire_temporaire st;

  st.temp = 1;
  st.emp = 2;
  st.sec = 3;
  st.st = 4;
}

