// A minimal Windows 95 skeleton + WM_KEY processing
// 3/09/95 PV

#include <windows.h>

LRESULT CALLBACK WindowFunc(HWND, UINT, WPARAM, LPARAM);

char szWinName[] = "MyWin";		// Nom de la classe
char str[80];

int WINAPI WinMain(HINSTANCE hThisInst, HINSTANCE hPrevInst, LPSTR lpszArgz, int nWinMode)
{
  HWND	hwnd;
  MSG	msg;
  WNDCLASS	wcl;

  // On définit la classe
  wcl.hInstance = hThisInst;		// Handle sur cette instance
  wcl.lpszClassName = szWinName;	// Nom de la classe de fenêtre
  wcl.lpfnWndProc = WindowFunc;		// Window Function
  wcl.style = 0;					// Default style

  wcl.hIcon = LoadIcon(NULL, IDI_APPLICATION);
  wcl.hCursor = LoadCursor(NULL, IDC_ARROW);
  wcl.lpszMenuName = NULL;			// Pas de menu

  wcl.cbClsExtra = 0;				// Pas d'extra
  wcl.cbWndExtra = 0;				// Pas d'extra

  wcl.hbrBackground = (HBRUSH)GetStockObject(LTGRAY_BRUSH);

  // On enregistre la classe
  if (!RegisterClass(&wcl)) return 0;

  // Création de la fenêtre
  hwnd = CreateWindow(
    szWinName,						// Nom de la classe
	"Windows 95 skeleton",			// Titre
	WS_OVERLAPPEDWINDOW,			// Style normal
	CW_USEDEFAULT, CW_USEDEFAULT, 	// Défaut pour X et Y
	CW_USEDEFAULT, CW_USEDEFAULT, 	// Défaut pour width et height
	HWND_DESKTOP,					// Pas de fenêtre parente
	NULL,							// Pas de menu
	hThisInst,						// Handle de cette instance de programme
	NULL							// Pas de paramètres complémentaires
  );

  ShowWindow(hwnd, nWinMode);
  UpdateWindow(hwnd);

  // Message Loop
  while (GetMessage(&msg, NULL, 0, 0))
  {
    TranslateMessage(&msg);			// Utilisation du clavier
	DispatchMessage(&msg);			// Retourne le contrôle à Windows
  }
  return msg.wParam;
}

// Fonction de fenêtre
LRESULT CALLBACK WindowFunc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
  HDC hdc;

  switch(message)
  {
	case WM_CHAR:
	  hdc = GetDC(hwnd);
	  TextOut(hdc, 1, 1, "  ", 2);
	  sprintf(str, "%c", (char)wParam);
	  TextOut(hdc, 1, 1, str, strlen(str));
	  ReleaseDC(hwnd, hdc);
	  break;

    case WM_DESTROY:
	  PostQuitMessage(0);
	  break;
	
	default:
	  return DefWindowProc(hwnd, message, wParam, lParam);
  }

  return 0;
}
