// cx.c
// Compteur d'exécutions
// 
// usage: cx commande
// Insère une ligne pour le démarrage dans le fichier $System/cx.csv, exécute la commande,
// et insère une ligne de fin avec la duréée d'exécution dans le même fichier
//
// Compilation Visual C++ 4.0, Plateforme Win32
//
// 7/4/96 PV  C++, puis C pour diviser la taille du .EXE par 2 !

#include <Windows.h>
#include <stdio.h>
#include <process.h>
#include <string.h>
#include <time.h>

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)
{
  FILE *f;
  time_t td, tf;
  char	*szDate;
  STARTUPINFO startupinfo;
  PROCESS_INFORMATION processinfo;
  char	szPath[256];
  MSG	msg;

  GetWindowsDirectory(szPath, sizeof(szPath));
  strcat(szPath, "/cx.csv");

  // Message initial
  f = fopen(szPath, "a");
  td = time(0L);
  szDate = ctime(&td);
  szDate[strlen(szDate)-1] = 0;
  fprintf(f, "%s;début;;%s;\n", szDate, lpCmdLine);
  fclose(f);

  // Autres tentatives, avec plus ou moins de succes...
  // WinExec(lpCmdLine, nShowCmd);
  // _spawnlp(_P_WAIT, "notepad", "notepad", NULL);
  // ShellExecute(NULL, "open", "notepad", "", "", nShowCmd);

  memset(&startupinfo, 0, sizeof(startupinfo));
  startupinfo.cb = sizeof(startupinfo);
  startupinfo.dwFlags = STARTF_USESHOWWINDOW;
  startupinfo.wShowWindow = nShowCmd;
  CreateProcess(NULL, lpCmdLine, NULL, NULL, FALSE, 0, NULL, NULL, &startupinfo, &processinfo);

  // On lit la file de messages de l'application toutes les secondes
  // C'est complètement bidon, mais sans l'appel à PeekMessage le shell de Windows 95
  // attend pendant 15 secondes avec le pointeur "Travaillant en arrière plan"...
  // Le pire, c'est que PeekMessage ne retourne aucun message, sauf le WM_QUIT généré
  // par le PostQuitMessage!!!
  for(;;)
  {
	// Lecture non bloquante de la file de messages de l'application
	int p = PeekMessage(&msg, NULL, 0, 0, PM_REMOVE);
	if (p==TRUE)
	{
	  if (msg.message==WM_QUIT)
	    break;
	  // Faute de mieux savoir quoi en faire on sous-traite le message à Windows
	  DefWindowProc(msg.hwnd, msg.message, msg.wParam, msg.lParam);
	  continue;
	}

	// On attend au plus une seconde la fin du process, après quoi on regarde à nouveau
	// s'il y a des messages
    if (WaitForSingleObject(processinfo.hProcess, 1000)==WAIT_OBJECT_0)
	  PostQuitMessage(0);
  }

  // Trace finale
  f = fopen(szPath, "a");
  tf = time(0L);
  szDate = ctime(&tf);
  szDate[strlen(szDate)-1] = 0;
  fprintf(f, "%s;fin;%d;%s;\n", szDate, tf-td, lpCmdLine);
  fclose(f);

  // Et comme tout bon programme Windows...
  return msg.wParam;
}
