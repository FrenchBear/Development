//==================================
// TASKWIND.C - Matt Pietrek 1993
//==================================
#include <windows.h>
#include <string.h>
#include <stdlib.h>
#include "taskwind.h"

#define WM_END_TASKWIND (WM_USER+0x500)

//
// Prototypes for the 4 functions we need to call
//
void FAR PASCAL CascadeChildWindows(HWND, WORD);
void FAR PASCAL TileChildWindows(HWND, WORD);
void FAR PASCAL SwitchToThisWindow(HWND, BOOL);
BOOL FAR PASCAL IsWinOldApTask(HTASK);

char DosBoxMsg[] =
"Terminer une application MS-DOS peut laisser des ressourses non libérées dans le système.\r\n"
"Voulez-vous terminer le programme malgré tout ?";
//"Terminating a DOS BOX program may cause system resources to be left "
//"unfreed.\r\nDo you wish to terminate the program anyway?";

char AuthorInfo[] = "1993 Matt Pietrek";

HINSTANCE OurHInst;

// Given an HTASK, extract the module name at offset 0xF2 in the TDB
//
void GetModNameFromHTask(HTASK TDB, char * buffer)
{
    if ( !IsTask(TDB) )     // Verify HTASK
    {
        buffer[0]=0;
        return;
    }

    buffer[8] = 0;
    _fstrncpy(buffer, MAKELP(TDB, 0xF2), 8);
}

// Given an HTASK, get the base filename (e.g., "FOO.EXE").
//
void GetExeNameFromHTask(HTASK TDB, char * buffer)
{
    HMODULE hMod;
    char far *exename;
    char module_exepath[146];

    if ( !IsTask(TDB) )     // Verify HTASK
    {
        buffer[0]=0;
        return;
    }

    // Get the HMODULE from the TDB.  Use GetModuleFileName() to
    // get the full pathname of the .EXE.  Search backwards from the
    // end to extract the base filename portion.
    //
    hMod = *(HMODULE far *)MAKELP(TDB, 0x1E);
    GetModuleFileName(hMod, module_exepath, sizeof(module_exepath));
    exename = _fstrrchr(module_exepath, '\\');
    if ( exename )
        _fstrcpy(buffer, exename+1);
    else
        buffer[0] = 0;
}

// Walks the lists of tasks in the system, adding each one to the
// task listbox.  Besides storing the task name, the listbox also
// remembers the TDB for the task.
//
void FillInTaskList(HWND hWndDlg)
{
    WORD TDB;
    char buffer[128];
    char exename[14];
    WORD index = 0;

    // GetCurrentTask() returns the TDB of the first
    // task in DX.
    //
    GetCurrentTask();
    _asm    mov     [TDB], DX

    if ( !TDB )
        return;

    while ( TDB )
    {
        GetExeNameFromHTask(TDB, exename);
        wsprintf(buffer, "%s", (LPSTR)exename);
        SendDlgItemMessage(hWndDlg, IDL_TASKS, LB_ADDSTRING, 0,
            (LPARAM)(LPSTR)buffer);
        SendDlgItemMessage(hWndDlg, IDL_TASKS, LB_SETITEMDATA,
            index++, TDB);
        TDB = *(WORD FAR *)MAKELP(TDB,0);   // Get next TDB in chain
    }
}

// Walks the lists of top level windows, adding each one to the
// window listbox.  Besides storing the window title and module name,
// the listbox also remembers the HWND.
//
void FillInWindowList(HWND hWndDlg)
{
    char buffer[256];
    char modname[10];
    char title[224];
    HWND hWnd;
    WORD index = 0;

    // Get the desktop window.  Then, get its first child window.
    // This is the start of the list of top level windows.
    //
    hWnd = GetDesktopWindow();
    if ( !hWnd )
        return;
    hWnd = GetWindow(hWnd, GW_CHILD);

    while ( hWnd )
    {
        // In order to be put in the list, the window can't be owned,
        // and must be visible.
        //
        if ( (GetWindow(hWnd, GW_OWNER)==0) && IsWindowVisible(hWnd) )
        {
            GetModNameFromHTask(GetWindowTask(hWnd), modname);
            GetWindowText(hWnd, title, sizeof(title));
            wsprintf(buffer, "%-8s\t %s", (LPSTR)modname, (LPSTR)title);
            SendDlgItemMessage(hWndDlg, IDL_WINDOWS, LB_ADDSTRING, 0,
                (LPARAM)(LPSTR)buffer);
            SendDlgItemMessage(hWndDlg, IDL_WINDOWS, LB_SETITEMDATA,
                index++, hWnd);
        }

        hWnd = GetWindow(hWnd, GW_HWNDNEXT);    // Go on to next window
    }
}

// Given an HTASK, fill in the information dialog box with useful info.
//
void FillInTaskDlg(HWND hWndDlg, HTASK hTask)
{
    char buffer[256];
    char buffer2[144];
    HTASK parent;
    HMODULE hModule;
    LPSTR cmdline;
    WORD cmdline_len;
    WORD PSP;
    LPSTR directory;
    BYTE drive;

    if ( !IsTask(hTask) )   // Verify HTASK
        return;

    // Get the .EXE's module name
    GetModNameFromHTask(hTask, buffer2);
    wsprintf(buffer, "%04X %s", hTask, (LPSTR)buffer2);
    SetDlgItemText(hWndDlg, IDT_TASKINFO_HTASK, buffer);

    // Get the task's HINSTANCE
    wsprintf(buffer, "%04X", *(HINSTANCE far *)MAKELP(hTask, 0x1C));
    SetDlgItemText(hWndDlg, IDT_TASKINFO_HINSTANCE, buffer);

    // Get the parent HTASK, and its name
    parent = *(HTASK far *)MAKELP(hTask, 0x22);
    GetModNameFromHTask(parent, buffer2);
    wsprintf(buffer, "%04X %s", parent, (LPSTR)buffer2);
    SetDlgItemText(hWndDlg, IDT_TASKINFO_PARENT, buffer);

    // Get the task's HMODULE, and the full pathname
    hModule = *(HMODULE far *)MAKELP(hTask, 0x1E);
    GetModuleFileName(hModule, buffer2, sizeof(buffer2));
    wsprintf(buffer, "%04X %s", hModule, (LPSTR)buffer2);
    SetDlgItemText(hWndDlg, IDT_TASKINFO_HMODULE, buffer);

    // Get the task's current directory from its TDB
    directory = MAKELP(hTask, 0x66);
    drive = (*directory - 0x80) + 'A';
    directory++;
    wsprintf(buffer, "%c:%s", drive, (LPSTR)directory);
    SetDlgItemText(hWndDlg, IDT_TASKINFO_DIRECTORY, buffer);

    // Get the command line for the task from its PSP/PDB.
    // NOTE: the command line for DOS apps is somewhat strange.
    PSP = *(WORD FAR *)MAKELP(hTask, 0x60);
    cmdline = MAKELP(PSP, 0x80);
    cmdline_len = *(BYTE far *)cmdline;
    cmdline++;
    if ( cmdline_len != 0 )
    {
        if ( IsWinOldApTask(hTask) )
        {
            cmdline++;
            cmdline_len--;
        }
        _fstrncpy(buffer, cmdline, cmdline_len);
        buffer[cmdline_len] = 0;
    }
    else
        strcpy(buffer, "<none>");
    SetDlgItemText(hWndDlg, IDT_TASKINFO_CMDLINE, buffer);
}

// Dialog proc for the task information dialog
//
BOOL CALLBACK _export TaskInfoDlgProc(HWND hWndDlg, UINT msg,
                                      WPARAM wParam, LPARAM lParam)
{
    switch ( msg )
    {
        case WM_COMMAND:
            if ( (wParam == IDOK) || (wParam == IDCANCEL) )
                EndDialog(hWndDlg, FALSE);
            break;

        case WM_INITDIALOG:
            FillInTaskDlg(hWndDlg, (HTASK)lParam);
            return TRUE;
    }

    return FALSE;
}

// Given a top level HWND, switch activation to it, or its most
// recent popup window (dialog)
//
void SwitchToWindow(HWND hWnd)
{
    HWND hWnd_2;

    if ( !IsWindow(hWnd) )
        return;

    hWnd_2 = GetLastActivePopup(hWnd);
    if ( !hWnd_2 )
        hWnd_2 = hWnd;

    SwitchToThisWindow(hWnd_2, TRUE);
}

// Terminates a specified HTASK with TOOLHELP's TerminateApp() API.
// First, though, it checks if the app is a DOS app, and warns the
// user before continuing.
//
void KillTask(HTASK hTask)
{
    void (WINAPI FAR * lpTerminateApp)(HTASK, WORD);
    HINSTANCE th_hInst;

    if ( !IsTask(hTask) )
        return;

    if ( IsWinOldApTask(hTask) )    // Is it a DOS app?
    {
        if ( MessageBox(0, DosBoxMsg, "Continuer ?",
            MB_OKCANCEL | MB_ICONQUESTION) == IDCANCEL )
            return;
    }

    // Load TOOLHELP dynamically, and link to it with GetProcAddress()
    //
    th_hInst = LoadLibrary("TOOLHELP.DLL");
    if ( th_hInst <= 32 )
        return;
    lpTerminateApp = (void(WINAPI FAR*)(HTASK,WORD))
        GetProcAddress( th_hInst, "TERMINATEAPP");
    if ( !lpTerminateApp )
    {
        FreeLibrary(th_hInst);
        return;
    }

    lpTerminateApp( hTask, 1 ); // Termination! 1 == NO_UAE_BOX
    FreeLibrary(th_hInst);
}

// Returns the HWND stored in the ITEMDATA for the selected
// line in the "Windows:" listbox.
//
HWND GetSelectedWindow(HWND hWndDlg)
{
    WORD index;

    index = (WORD)SendDlgItemMessage(hWndDlg, IDL_WINDOWS,
                    LB_GETCURSEL, 0, 0);
    return (HWND)SendDlgItemMessage(hWndDlg, IDL_WINDOWS,
                    LB_GETITEMDATA, index, 0);
}

// Returns the HTASK stored in the ITEMDATA for the selected
// line in the "Tasks:" listbox.
//
HTASK GetSelectedTask(HWND hWndDlg)
{
    WORD index;

    index = (WORD)SendDlgItemMessage(hWndDlg, IDL_TASKS,
                    LB_GETCURSEL, 0, 0);
    return (HTASK)SendDlgItemMessage(hWndDlg, IDL_TASKS,
                    LB_GETITEMDATA, index, 0);
}

void PositionMainDialog(HWND hWndDlg, LPARAM lParam)
{
    WORD screen_x, screen_y, desired_x, desired_y;
   RECT dlgRect;
   WORD dlgWidth, dlgHeight;
   int x, y;

   desired_x = HIWORD(lParam); desired_y = LOWORD(lParam);
    screen_x = GetSystemMetrics(SM_CXSCREEN);
    screen_y = GetSystemMetrics(SM_CYSCREEN);

   GetWindowRect(hWndDlg, &dlgRect);
   dlgWidth = dlgRect.right - dlgRect.left;
   dlgHeight = dlgRect.bottom - dlgRect.top;

   // Do we want default positioning in the screen center?
   if ( (desired_x == 0) && (desired_y == 0) )
   {
      x = (screen_x - dlgWidth)/2;
      y = (screen_y - dlgHeight)/2;
   }
   else  // Nope.  Position dialog where specified (or close to it!)
   {
      HWND hWndLb;
      RECT lbRect;

      hWndLb = GetDlgItem(hWndDlg, IDL_WINDOWS);
      GetWindowRect(hWndLb, &lbRect);

      // Make initial X,Y such that the cursor will be positioned
      // near the top-left of the "windows" listbox
      x = (int)desired_x;
      y = (int)desired_y - (lbRect.top - dlgRect.top);

      // However, if initial X,Y would cause the window to be off
      // the top or left side of the screen, adjust accordingly.
      x = (x < 0) ? 0 : x;
      y = (y < 0) ? 0 : y;

      // Finally, make sure the dlg won't go past the right or bottom
      if ( (x + dlgWidth) > screen_x )
         x = screen_x - dlgWidth;
      if ( (y + dlgHeight) > screen_y )
         y = screen_y - dlgHeight;
   }

    SetWindowPos(hWndDlg, HWND_TOP, x, y, 0, 0, SWP_NOSIZE);
}

// Initialize TASKWIND's main dialog.  Center the dialog in the
// screen, fill in the task and windows lists, and set the
// initial focus.
//
void Handle_WM_INITDIALOG(HWND hWndDlg, LPARAM lParam)
{
    WORD TabStopList[] = {44};
    HWND hWnd_windows;

   PositionMainDialog(hWndDlg, lParam);

    hWnd_windows = GetDlgItem(hWndDlg, IDL_WINDOWS);

    SendMessage(hWnd_windows, LB_SETTABSTOPS, 1,(DWORD)(LPSTR)TabStopList);

    SendDlgItemMessage(hWndDlg, IDL_TASKS, WM_SETREDRAW, FALSE, 0);
    FillInTaskList(hWndDlg);
    SendDlgItemMessage(hWndDlg, IDL_TASKS, WM_SETREDRAW, TRUE, 0);

    SendMessage(hWnd_windows, WM_SETREDRAW, FALSE, 0);
    FillInWindowList(hWndDlg);
    SendMessage(hWnd_windows, WM_SETREDRAW, TRUE, 0);

    SendMessage(hWnd_windows, LB_SETCURSEL, 0, 0);
    SetFocus(hWnd_windows);
}

// Handle WM_COMMAND's for the main TASKWIND dialog.
//
void Handle_WM_COMMAND(HWND hWndDlg, WPARAM wParam, LPARAM lParam)
{
    // If user hit <enter> see which listbox has the focus, and
    // change wParam and lParam to look as if the user performed
    // the equivalent dbl-click action.
    //
    if ( wParam == IDOK )
    {
        HWND hWndFocus = GetFocus();
        if ( hWndFocus == GetDlgItem(hWndDlg, IDL_WINDOWS) )
        {
            wParam = IDL_WINDOWS; lParam = MAKELONG(0,LBN_DBLCLK);
        }
        else if (hWndFocus == GetDlgItem(hWndDlg, IDL_TASKS) )
        {
            wParam = IDL_TASKS; lParam = MAKELONG(0,LBN_DBLCLK);
        }
    }

    switch ( wParam )
    {
        case IDB_CANCEL:
        case IDCANCEL: EndDialog(hWndDlg, FALSE); break;

        case IDB_CASCADE:
            EndDialog(hWndDlg, FALSE);
            // This call is different in Windows 3.0.  The 2nd parameter
            // isn't passed.
            if ( LOWORD(GetVersion()) != 0x0003 )
                CascadeChildWindows(GetDesktopWindow(), 0);
            break;

        case IDB_TILE:
            EndDialog(hWndDlg, FALSE);
            TileChildWindows(GetDesktopWindow(), 0); break;

        case IDB_WM_CLOSE:
            EndDialog(hWndDlg, FALSE);
            PostMessage(GetSelectedWindow(hWndDlg), WM_CLOSE, 0, 0); break;

        case IDL_WINDOWS:
            if ( HIWORD(lParam)!=LBN_DBLCLK )
                break;      // Let the DBLCLK case fall through

        case IDB_SWITCHTO:
            EndDialog(hWndDlg, FALSE);
            SwitchToWindow(GetSelectedWindow(hWndDlg)); break;

        case IDB_ARRANGEICONS:
            EndDialog(hWndDlg, FALSE);
            ArrangeIconicWindows( GetDesktopWindow() ); break;

        case IDL_TASKS:
            if ( HIWORD(lParam)!=LBN_DBLCLK )
                break;      // Let the DBLCLK case fall through

        case IDB_TASKINFO:
            {
                HTASK hTask = GetSelectedTask(hWndDlg);
                if ( !IsTask(hTask) )
                    MessageBox(0, "Aucune tache n'est sélectionnée", 0, MB_OK);
                else
                    DialogBoxParam(OurHInst, "TASKINFO", hWndDlg,
                        TaskInfoDlgProc, hTask);
            }
            break;

        case IDB_TASK_TERMINATE:
        {
            HTASK hTask = GetSelectedTask(hWndDlg);
            if ( !IsTask(hTask) )
                MessageBox(0, "Aucune tache n'est sélectionnée", 0, MB_OK);
            else
            {
                EndDialog(hWndDlg, FALSE);
                KillTask( GetSelectedTask(hWndDlg) ); break;
            }
        }
    }
}

// Dialog proc for the main dialog
//
BOOL CALLBACK _export TaskWindDlgProc(HWND hWndDlg, UINT msg,
                                           WPARAM wParam, LPARAM lParam)
{
    switch ( msg )
    {
        case WM_COMMAND:
            Handle_WM_COMMAND(hWndDlg, wParam, lParam); return TRUE;
        case WM_INITDIALOG:
            Handle_WM_INITDIALOG(hWndDlg, lParam); return TRUE;
        case WM_ACTIVATEAPP:
            if ( wParam == FALSE )
                PostMessage(hWndDlg, WM_END_TASKWIND, 0, 0);
            break;
        case WM_END_TASKWIND:
            EndDialog(hWndDlg, FALSE); break;
    }

    return FALSE;
}

void ParseCommandLine(LPSTR lpszCmdLine, WORD *x, WORD *y)
{
   char * yPtr;
   char local_copy[128]; // A local copy so we can use atoi();

   lstrcpy(local_copy, lpszCmdLine);

   yPtr = local_copy;

   if ( *local_copy == 0 ) // Give default 0,0 value if no cmd line
   {
      *x = *y = 0;
      return;
   }

   // Scan to the first space to find where the 'y' value starts
   while ( *yPtr && (*yPtr != ' ') )
      yPtr++;

   // If we didn't find a ' ', something looks wrong.  Use defaults
   if ( *yPtr != ' ')
   {
      *x = *y = 0;
      return;
   }

   *x = atoi(local_copy);
   *y = atoi(yPtr);
}

int PASCAL WinMain( HANDLE hInstance, HANDLE hPrevInstance,
                    LPSTR lpszCmdLine, int nCmdShow )
{
   WORD x, y;
   DWORD lParam;

   if ( hPrevInstance )
     return 0;

   OurHInst = hInstance;

   ParseCommandLine(lpszCmdLine, &x, &y);
   lParam = MAKELONG(y,x);

   DialogBoxParam(OurHInst, "TASKWIND", 0, TaskWindDlgProc, lParam);
   return 0;
}
