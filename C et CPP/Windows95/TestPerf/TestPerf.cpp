// testperf.cpp

#include <afx.h>		  // CString + Windows.h
#include <stdio.h>
#include <sys/timeb.h>
#include <assert.h>
#include <fstream.h>
#include <errno.h>

LRESULT CALLBACK WindowFunc(HWND, UINT, WPARAM, LPARAM);

char	szWinName[] = "TestPerformances";
char	szFont[] = "Lucida Console";
int		cx, cy;
HDC		hMemDC;
HBITMAP	hBit;
HBRUSH	hBrush;

const int NBLIG=25;

int WINAPI WinMain(HINSTANCE hThisInst, HINSTANCE hPrevInst, LPSTR lppszArgs, int nWinMode)
{
  HWND hWnd;
  MSG msg;
  WNDCLASS wcl;

  wcl.hInstance = hThisInst;
  wcl.lpszClassName = szWinName;
  wcl.lpfnWndProc = WindowFunc;
  wcl.style = 0;

  wcl.hIcon = LoadIcon(NULL, IDI_APPLICATION);
  wcl.hCursor = LoadCursor(NULL, IDC_ARROW);
  wcl.lpszMenuName = NULL;

  wcl.cbClsExtra = 0;
  wcl.cbWndExtra = 0;

  wcl.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);

  if (!RegisterClass(&wcl)) return 0;

  hWnd = CreateWindow(szWinName, 
	"Test des performances de TextOut",
	WS_OVERLAPPEDWINDOW,
	CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, 
	HWND_DESKTOP,
	NULL,
	hThisInst,
	NULL);

  ShowWindow(hWnd, nWinMode);
  UpdateWindow(hWnd);

  while (GetMessage(&msg, NULL, 0, 0))
  {
	TranslateMessage(&msg);
	DispatchMessage(&msg);
  }
  return msg.wParam;
}


void AfficheLigne(HDC hDC, int l, char c)
{
  int i;
  char sLigne[80];

  assert(l>=0 && l<NBLIG);

  for (i=0 ; i<80 ; i++)
	sLigne[i] = c;
  TextOut(hDC, 0, cy*l, sLigne, 80);
}

void AfficheLigneStr(HDC hDC, int l, char *szLigne, int len)
{
  char szVide[] = "                                                                                ";
  char szL[81];
  int i;

  assert(l>=0 && l<NBLIG);
  if (szLigne==NULL) szLigne = szVide;
  strcpy(szL, szLigne);
  for(i=strlen(szL) ; i<len ; i++)
	szL[i] = ' ';
  szL[i] = 0;
  TextOut(hDC, 0, cy*l, szL, len);
}


LRESULT CALLBACK WindowFunc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
  HDC hDC;
  PAINTSTRUCT ps;
  int i,l,k;
  struct _timeb td, tf;
  static int winx, winy;
  char szMsg[80];
  int t;
  HFONT hFont, hOldFont;
  TEXTMETRIC tm;
  static int maxX, maxY;
  ifstream fsTest;
  char *tszLigne[NBLIG];
  int tiLen[NBLIG];
  int tiDuree[81];
  char szLigne[81];
  ofstream fsOut;

  switch(message)
  {
	case WM_DESTROY:
	  DeleteDC(hMemDC);
	  PostQuitMessage(0);
	  break;

	case WM_CREATE:
	  maxX = GetSystemMetrics(SM_CXSCREEN);
	  maxY = GetSystemMetrics(SM_CYSCREEN);
	  hDC = GetDC(hWnd);
	  hMemDC = CreateCompatibleDC(hDC);
	  hBit = CreateCompatibleBitmap(hDC, maxX, maxY);
	  SelectObject(hMemDC, hBit);
	  hBrush = (HBRUSH)GetStockObject(WHITE_BRUSH);
	  SelectObject(hMemDC, hBrush);
	  PatBlt(hMemDC, 0, 0, maxX, maxY, PATCOPY);
	  ReleaseDC(hWnd, hDC);
	  break;

	case WM_SIZE:
	  winx = LOWORD(lParam);  // width of client area 
	  winy = HIWORD(lParam); // height of client area 
	  break;

#if 1
 	case WM_LBUTTONDOWN:
	  hDC = GetDC(hWnd);
	  hFont = CreateFont(13/*winy/NBLIG*/, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, szFont);
	  hOldFont = (HFONT)SelectObject(hDC, hFont);
	  GetTextMetrics(hDC, &tm);
	  cx = tm.tmAveCharWidth;
	  cy = tm.tmHeight;

	  for (l=1 ; l<=80 ; l++)
	  {
	    _ftime(&td);
		for (k=0 ; k<1000 ; k++)
		{
		  for (i=0 ; i<l ; i++)
			szLigne[i] = rand()%(255-32)+32;
		  TextOut(hDC, 0, rand()%maxY-cy, szLigne, l);		  
		}
		_ftime(&tf);
		tiDuree[l] = tf.time*1000+tf.millitm - (td.time*1000+td.millitm);
	  }
	  SelectObject(hDC, hOldFont);
	  DeleteObject(hFont);
	  ReleaseDC(hWnd, hDC);

	  fsOut.open("Test performances TextOut.txt", ios::out);
	  for (l=1 ; l<=80 ; l++)
		fsOut << l << ";" << tiDuree[l] << "\n";
	  fsOut.close();
	  break;
#endif

// Test du scroll
#if 0
	case WM_LBUTTONDOWN:
	//case WM_PAINT:
	  hDC = GetDC(hWnd);
	  //hDC = BeginPaint(hWnd, &ps);
	  hFont = CreateFont(13/*winy/NBLIG*/, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, szFont);
	  hOldFont = (HFONT)SelectObject(hDC, hFont);
	  GetTextMetrics(hDC, &tm);
	  cx = tm.tmAveCharWidth;
	  cy = tm.tmHeight;

	  fsTest.open("Test ANSI.txt", ios::in|ios::nocreate);
	  if (fsTest.fail())
	  {
		char szMessage[200];

		sprintf(szMessage, "Echec à l'ouverture du fichier test\n%d: %s",
		  errno, sys_errlist[errno]);
		MessageBox(hWnd, szMessage, "Test", MB_OK);
		break;
	  }

	  _ftime(&td);

	  for (l=0 ; l<NBLIG ; l++)
	  { tiLen[l] = 0;
		tszLigne[l] = NULL;
	  }
	  while (!fsTest.eof())
	  {
		char szLigne[80];

		fsTest.getline(szLigne, 80);
		szLigne[strlen(szLigne)-1] = 0;	  // \r

		if (tszLigne[0] != NULL)
		  free(tszLigne[0]);
		for (l=0 ; l<NBLIG-1 ; l++)
		  tszLigne[l] = tszLigne[l+1];
		tszLigne[NBLIG-1] = strdup(szLigne);

		for (l=0 ; l<NBLIG ; l++)
		  AfficheLigneStr(hDC, l, tszLigne[l], tiLen[l]);
		for (l=0 ; l<NBLIG-1 ; l++)
		  tiLen[l] = tiLen[l+1];
		tiLen[NBLIG-1] = strlen(tszLigne[NBLIG-1]);
	  }
	  for (l=0 ; l<NBLIG ; l++)
		if (tszLigne[l] != NULL)
		  free(tszLigne[l]);

	  _ftime(&tf);

	  fsTest.close();

	  SelectObject(hDC, hOldFont);
	  DeleteObject(hFont);
	  ReleaseDC(hWnd, hDC);
	  //EndPaint(hWnd, &ps);
	  t = tf.time*1000+tf.millitm - (td.time*1000+td.millitm);

	  sprintf(szMsg, "Scroll par TextOut: %6.2fs", t/1000.0);
	  MessageBox(hWnd, szMsg, "Test", MB_OK);
	  //PostQuitMessage(0);
	  break;
#endif


	case WM_RBUTTONDOWN:
	  hDC = GetDC(hWnd);
	  for (l=0 ; l<NBLIG ; l++)
		AfficheLigne(hMemDC, l, 32);
	  hFont = CreateFont(winy/NBLIG, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, szFont);
	  hOldFont = (HFONT)SelectObject(hMemDC, hFont);
	  GetTextMetrics(hMemDC, &tm);
	  cx = tm.tmAveCharWidth;
	  cy = tm.tmHeight;
	  SetTextColor(hMemDC, RGB(0,0,0));
	  SetBkMode(hMemDC, OPAQUE);

	  _ftime(&td);
	  for (i=32 ; i<255 ; i++)
	  {
		// Scroll vertical
		BitBlt(hMemDC, 0, 0, 80*cx, (NBLIG-1)*cy, hMemDC, 0, cy, SRCCOPY);
		// La nouvelle ligne
		AfficheLigne(hMemDC, NBLIG-1, i);
		// Transfert du bitmap virtuel sur l'affichage
		BitBlt(hDC, 0, 0, 80*cx, NBLIG*cy, hMemDC, 0, 0, SRCCOPY);
	  }
	  _ftime(&tf);
	  SelectObject(hDC, hOldFont);
	  DeleteObject(hFont);
	  ReleaseDC(hWnd, hDC);

	  t = tf.time*1000+tf.millitm - (td.time*1000+td.millitm);
	  sprintf(szMsg, "Scroll par BitBlt: %6.2gs", t/1000.0);
	  MessageBox(hWnd, szMsg, "Test", MB_OK);
	  break;

#ifdef TEST_AFFICHAGE
	case WM_LBUTTONDOWN:
	  hDC = GetDC(hWnd);
	  hFont = CreateFont(winy/NBLIG, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, szFont);
	  hOldFont = SelectObject(hDC, hFont);
	  GetTextMetrics(hDC, &tm);
	  cx = tm.tmAveCharWidth;
	  cy = tm.tmHeight;

	  _ftime(&td);
	  for (i=0 ; i<100 ; i++)
	  {
		sLigne[0] = i+32;
		for (l=0 ; l<NBLIG ; l++)
		  for (c=0 ; c<80 ; c++)
		    TextOut(hDC, cx*c, cy*l, sLigne, 1);
	  }
	  _ftime(&tf);
	  SelectObject(hDC, hOldFont);
	  DeleteObject(hFont);
	  ReleaseDC(hWnd, hDC);

	  t = tf.time*1000+tf.millitm - (td.time*1000+td.millitm);
	  sprintf(szMsg, "Durée 100 écrans par 1: %6.2gs", t/1000.0);
	  MessageBox(hWnd, szMsg, "Test", MB_OK);
	  break;

	case WM_RBUTTONDOWN:
	  hDC = GetDC(hWnd);
	  hFont = CreateFont(winy/NBLIG, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, szFont);
	  hOldFont = SelectObject(hDC, hFont);
	  GetTextMetrics(hDC, &tm);
	  cx = tm.tmAveCharWidth;
	  cy = tm.tmHeight;

	  _ftime(&td);
	  for (i=0 ; i<100 ; i++)
	  {
		for (c=0 ; c<80 ; c++)
		  sLigne[c] = i+32;
		for (l=0 ; l<NBLIG ; l++)
		  TextOut(hDC, 0, cy*l, sLigne, 80);
	  }
	  _ftime(&tf);
	  SelectObject(hDC, hOldFont);
	  DeleteObject(hFont);
	  ReleaseDC(hWnd, hDC);

	  t = tf.time*1000+tf.millitm - (td.time*1000+td.millitm);
	  sprintf(szMsg, "Durée 100 écrans par 80: %6.2gs", t/1000.0);
	  MessageBox(hWnd, szMsg, "Test", MB_OK);
	  break;
#endif


	default:
	  return DefWindowProc(hWnd, message, wParam, lParam);
  }
  return 0;
}

