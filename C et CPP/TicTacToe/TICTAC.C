/*
 *  TicTac demonstrates Windows 95's new tooltip control.
 */

#include <windows.h>
#include <commctrl.h>
#include <memory.h>

#define ID_CLEAR  100
#define ID_EXIT   101

#define HAS_X    0x58
#define HAS_O    0x4F

LONG WINAPI WndProc (HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK HookProc (int, WPARAM, LPARAM);

void DrawRecessedRect (HDC, RECT *);
void DrawTicTacToeGrid (HDC);
void DrawX (HDC, RECT *);
void DrawO (HDC, RECT *);
int IsWinner (int *);

HHOOK hHook;
HWND hwndTooltip;

/*
 *  Function WinMain.
 */

int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInstance,
                    LPSTR lpszCmdLine, int nCmdShow)
{
    static char szAppName[] = "TicTac";
    WNDCLASS wc;
    HWND hwnd;
    RECT rect;
    MSG msg;

    wc.style = 0;
    wc.lpfnWndProc = (WNDPROC) WndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon (NULL, IDI_APPLICATION);
    wc.hCursor = LoadCursor (NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH) GetStockObject (LTGRAY_BRUSH);
    wc.lpszMenuName = NULL;
    wc.lpszClassName = szAppName;

    RegisterClass (&wc);

    SetRect (&rect, 0, 0, 464, 384);
    AdjustWindowRectEx (&rect, WS_SYSMENU | WS_CAPTION | WS_MINIMIZEBOX,
        FALSE, WS_EX_DLGMODALFRAME);

    hwnd = CreateWindowEx (WS_EX_DLGMODALFRAME, szAppName, szAppName,
        WS_SYSMENU | WS_CAPTION | WS_MINIMIZEBOX, CW_USEDEFAULT, CW_USEDEFAULT,
        rect.right - rect.left, rect.bottom - rect.top, HWND_DESKTOP, NULL,
        hInstance, NULL);

    ShowWindow (hwnd, nCmdShow);
    UpdateWindow (hwnd);

    while (GetMessage (&msg, NULL, 0, 0)) {
        TranslateMessage (&msg);
        DispatchMessage (&msg);
    }
    return msg.wParam;
}

/*
 *  WndProc processes messages to the main window.
 */
 
LONG WINAPI WndProc (HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    static HWND hwndClear, hwndExit;
    static RECT rcGrid[9], rcBig, rcLittle;
    static int nGrid[9];
    static int nSymbol = HAS_X;
    static HFONT hFont;

    static char szMsg[] = "The ?s win!";
    static char szText[] = "Click here to place an ? in this square";

    HINSTANCE hInstance;
    PAINTSTRUCT ps;
    HDC hdc;
    POINT point;
    RECT rect;
    int nResult, i;
    LOGFONT lf;
    LPTOOLTIPTEXT lpttt;
    TOOLINFO ti;
    MSG msg;

    switch (message) {
    
    case WM_CREATE:
        //
        // Initialize.
        //
        for (i=0; i<9; i++)
            nGrid[i] = 0;

        SetRect (&rcGrid[0], 32, 32, 128, 128);
        SetRect (&rcGrid[1], 144, 32, 240, 128);
        SetRect (&rcGrid[2], 256, 32, 352, 128);
        SetRect (&rcGrid[3], 32, 144, 128, 240);
        SetRect (&rcGrid[4], 144, 144, 240, 240);
        SetRect (&rcGrid[5], 256, 144, 352, 240);
        SetRect (&rcGrid[6], 32, 256, 128, 352);
        SetRect (&rcGrid[7], 144, 256, 240, 352);
        SetRect (&rcGrid[8], 256, 256, 352, 352);

        SetRect (&rcBig, 16, 16, 368, 368);
        SetRect (&rcLittle, 384, 96, 448, 368);

        hInstance = ((LPCREATESTRUCT) lParam)->hInstance;

        // Create the push button controls.
        hwndClear = CreateWindow ("button", "Clear",
            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 384, 16, 64, 24,
            hwnd, ID_CLEAR, hInstance, NULL);

        hwndExit = CreateWindow ("button", "Exit",
            WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON, 384, 56, 64, 24,
            hwnd, ID_EXIT, hInstance, NULL);

        // Set the push button controls' font to 8-point MS Sans Serif.
        hdc = GetDC (hwnd);
        memset (&lf, 0, sizeof (LOGFONT));
        lf.lfHeight = -(MulDiv (8, GetDeviceCaps (hdc, LOGPIXELSY), 72));
        lf.lfWeight = 400;
        lstrcpy (lf.lfFaceName, "MS Sans Serif");
        ReleaseDC (hwnd, hdc);

        hFont = CreateFontIndirect (&lf);
        SendMessage (hwndClear, WM_SETFONT, (WPARAM) hFont, FALSE);
        SendMessage (hwndExit, WM_SETFONT, (WPARAM) hFont, FALSE);

        // Create the tooltip control.
        InitCommonControls ();

        hwndTooltip = CreateWindow (TOOLTIPS_CLASS, NULL, 0,
            CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
            hwnd, NULL, hInstance, NULL);

        if (hwndTooltip == NULL)
            MessageBox (hwnd, "Tooltip control could not be created",
                "Error", MB_ICONINFORMATION | MB_OK);

        // Register the empty rectangle.
        ti.cbSize = sizeof (TOOLINFO);
        ti.uFlags = 0;
        ti.hwnd = hwnd;
        ti.uId = 0xFFFF;
        CopyRect (&ti.rect, &rcLittle);
        ti.lpszText = "Rent this space! Call 800-xxx-xxxx today.";
        SendMessage (hwndTooltip, TTM_ADDTOOL, 0, (LPARAM) &ti);

        // Register the nine rectangles in the tic-tac-toe grid.
        for (i=0; i<9; i++) {
            ti.cbSize = sizeof (TOOLINFO);
            ti.uFlags = 0;
            ti.hwnd = hwnd;
            ti.uId = i;
            CopyRect (&ti.rect, &rcGrid[i]);
            ti.lpszText = LPSTR_TEXTCALLBACK;
            SendMessage (hwndTooltip, TTM_ADDTOOL, 0, (LPARAM) &ti);
        }

        // Register with Clear button.
        ti.cbSize = sizeof (TOOLINFO);
        ti.uFlags = TTF_IDISHWND;
        ti.hwnd = hwnd;
        ti.uId = (UINT) hwndClear;
        ti.lpszText = "Clear the grid and start a new game";
        SendMessage (hwndTooltip, TTM_ADDTOOL, 0, (LPARAM) &ti);

        // Register the Exit button.
        ti.cbSize = sizeof (TOOLINFO);
        ti.uFlags = TTF_IDISHWND;
        ti.hwnd = hwnd;
        ti.uId = (UINT) hwndExit;
        ti.lpszText = "Terminate this application";
        SendMessage (hwndTooltip, TTM_ADDTOOL, 0, (LPARAM) &ti);

        // Install a message hook for the push button controls.
        hHook = SetWindowsHookEx (WH_GETMESSAGE, HookProc, NULL,
            GetCurrentThreadId ());
        return 0;
    
    case WM_PAINT:
        //
        // Update the display.
        //
        hdc = BeginPaint (hwnd, &ps);

        DrawRecessedRect (hdc, &rcBig);
        DrawRecessedRect (hdc, &rcLittle);
        DrawTicTacToeGrid (hdc);

        for (i=0; i<9; i++) {
            if (nGrid[i] == HAS_X)
                DrawX (hdc, &rcGrid[i]);
            else if (nGrid[i] == HAS_O)
                DrawO (hdc, &rcGrid[i]);
        }

        EndPaint (hwnd, &ps);
        return 0;

    case WM_COMMAND:
        //
        // Process button messages.
        //
        switch (LOWORD (wParam)) {

        case ID_CLEAR:
            for (i=0; i<9; i++)
                nGrid[i] = 0;
            SetRect (&rect, 24, 24, 360, 360);
            InvalidateRect (hwnd, &rect, TRUE);
            nSymbol = HAS_X;
            return 0;

        case ID_EXIT:
            SendMessage (hwnd, WM_CLOSE, 0, 0);
            return 0;
        }
        break;

    case WM_NOTIFY:
        //
        // Respond to TTN_NEEDTEXT notifications from the tooltip control.
        //
        lpttt = (LPTOOLTIPTEXT) lParam;

        if (((lpttt->hdr).code == TTN_NEEDTEXT) &&
            ((lpttt->hdr).hwndFrom == hwndTooltip) &&
            ((lpttt->hdr).idFrom >= 0) &&
            ((lpttt->hdr).idFrom < 9)) {

            if (nGrid[(lpttt->hdr).idFrom] == 0) {
                szText[23] = (char) nSymbol;
                lpttt->lpszText = szText;
            }
            else
                lpttt->lpszText = NULL;
            return 0;
        }
        break;

    case WM_LBUTTONDOWN:
        //
        // Process clicks of the left mouse button.
        //
        if (hwndTooltip != NULL) {
            msg.hwnd = hwnd;
            msg.message = message;
            msg.wParam = wParam;
            msg.lParam = lParam;
            SendMessage (hwndTooltip, TTM_RELAYEVENT, 0, (LPARAM) &msg);
        }

        point.x = LOWORD (lParam);
        point.y = HIWORD (lParam);

        for (i=0; i<9; i++) {
            if (PtInRect (&rcGrid[i], point)) {
                if (nGrid[i] == 0) {
                    hdc = GetDC (hwnd);
                    nGrid[i] = nSymbol;
                    if (nSymbol == HAS_X) {
                        DrawX (hdc, &rcGrid[i]);
                        nSymbol = HAS_O;
                    }
                    else { // nSymbol == HAS_O
                        DrawO (hdc, &rcGrid[i]);
                        nSymbol = HAS_X;
                    }
                    ReleaseDC (hwnd, hdc);

                    if ((nResult = IsWinner (nGrid)) != 0) {
                        szMsg[4] = nResult;
                        MessageBox (hwnd, szMsg, "Game Over",
                            MB_ICONEXCLAMATION | MB_OK);
                        for (i=0; i<9; i++)
                            nGrid[i] = 0;
                        SetRect (&rect, 24, 24, 360, 360);
                        InvalidateRect (hwnd, &rect, TRUE);
                        nSymbol = HAS_X;
                    }
                }
                break;
            }
        }
        return 0;

    case WM_MOUSEMOVE:
    case WM_LBUTTONUP:
    case WM_RBUTTONDOWN:
    case WM_RBUTTONUP:
        //
        // Relay other mouse messages to the tooltip control.
        //
        if (hwndTooltip != NULL) {
            msg.hwnd = hwnd;
            msg.message = message;
            msg.wParam = wParam;
            msg.lParam = lParam;
            SendMessage (hwndTooltip, TTM_RELAYEVENT, 0, (LPARAM) &msg);
        }
        break;

    case WM_DESTROY:
        //
        // Clean up and terminate.
        //
        DeleteObject (hFont);
        UnhookWindowsHookEx (hHook);
        PostQuitMessage (0);
        return 0;
    }
    return DefWindowProc (hwnd, message, wParam, lParam);
}

/*
 *  HookProc relays receives hooked mouse messages to the tooltip control.
 */

LRESULT CALLBACK HookProc (int nCode, WPARAM wParam, LPARAM lParam)
{
    UINT message;

    message = ((MSG *) lParam)->message;

    if ((nCode >= 0) &&
        ((message == WM_MOUSEMOVE) ||
        (message == WM_LBUTTONDOWN) ||
        (message == WM_LBUTTONUP) ||
        (message == WM_RBUTTONDOWN) ||
        (message == WM_RBUTTONUP)))

        SendMessage (hwndTooltip, TTM_RELAYEVENT, 0, lParam);

    return (CallNextHookEx (hHook, nCode, wParam, lParam));
}

/*
 *  DrawRecessedRect draws a recessed rectangle at the specified location.
 *
 *  Input:
 *    hdc = Device context handle for drawing
 *    pRect = Pointer to RECT structure
 *
 *  Output:
 *    None
 */

void DrawRecessedRect (HDC hdc, RECT *pRect)
{
    HPEN hDefPen, hPen;

    hPen = CreatePen (PS_SOLID, 1, RGB (128, 128, 128));
    hDefPen = SelectObject (hdc, hPen);
    MoveToEx (hdc, pRect->left, pRect->bottom, NULL);
    LineTo (hdc, pRect->left, pRect->top);
    LineTo (hdc, pRect->right, pRect->top);

    DeleteObject (SelectObject (hdc, GetStockObject (WHITE_PEN)));
    MoveToEx (hdc, pRect->right, pRect->top + 1, NULL);
    LineTo (hdc, pRect->right, pRect->bottom);
    LineTo (hdc, pRect->left, pRect->bottom);
    SelectObject (hdc, hDefPen);
}

/*
 *  DrawTicTacToeGrid draws the tic-tac-toe grid.
 *
 *  Input:
 *    hdc = Device context handle for drawing
 *
 *  Output:
 *    None
 */

void DrawTicTacToeGrid (HDC hdc)
{
    HPEN hDefPen, hPen;

    hPen = CreatePen (PS_SOLID, 16, RGB (0, 0, 0));
    hDefPen = SelectObject (hdc, hPen);
    MoveToEx (hdc, 136, 32, NULL);
    LineTo (hdc, 136, 352);
    MoveToEx (hdc, 248, 32, NULL);
    LineTo (hdc, 248, 352);
    MoveToEx (hdc, 32, 136, NULL);
    LineTo (hdc, 352, 136);
    MoveToEx (hdc, 32, 248, NULL);
    LineTo (hdc, 352, 248);
    DeleteObject (SelectObject (hdc, hDefPen));
}

/*
 *  DrawX draws an X in the specified rectangle.
 *
 *  Input:
 *    hdc = Device context handle for drawing
 *    pRect = Pointer to RECT structure
 *
 *  Output:
 *    None
 */

void DrawX (HDC hdc, RECT *pRect)
{
    HPEN hDefPen, hPen;

    hPen = CreatePen (PS_SOLID, 16, RGB (255, 0, 0));
    hDefPen = SelectObject (hdc, hPen);
    MoveToEx (hdc, pRect->left + 16, pRect->top + 16, NULL);
    LineTo (hdc, pRect->right - 16, pRect->bottom - 16);
    MoveToEx (hdc, pRect->left + 16, pRect->bottom - 16, NULL);
    LineTo (hdc,pRect->right - 16, pRect->top + 16);
    DeleteObject (SelectObject (hdc, hDefPen));
}

/*
 *  DrawO draws an O in the specified rectangle.
 *
 *  Input:
 *    hdc = Device context handle for drawing
 *    pRect = Pointer to RECT structure
 *
 *  Output:
 *    None
 */

void DrawO (HDC hdc, RECT *pRect)
{
    HPEN hDefPen, hPen;
    HBRUSH hDefBrush;

    hPen = CreatePen (PS_SOLID, 16, RGB (0, 0, 255));
    hDefPen = SelectObject (hdc, hPen);
    hDefBrush = SelectObject (hdc, GetStockObject (NULL_BRUSH));
    Ellipse (hdc, pRect->left + 16, pRect->top + 16, pRect->right - 16,
        pRect->bottom - 16);
    SelectObject (hdc, hDefBrush);
    DeleteObject (SelectObject (hdc, hDefPen));
}

/*
 *  IsWinner determines whether the game has been won.
 *
 *  Input:
 *    nGrid = Pointer to array of grid values
 *
 *  Output:
 *    0 = No winner; HAS_X = Xs won; HAS_O = Os won
 */

int IsWinner (int *nGrid)
{
    if (((nGrid[0] == HAS_X) && (nGrid[1] == HAS_X) && (nGrid[2] == HAS_X)) ||
        ((nGrid[3] == HAS_X) && (nGrid[4] == HAS_X) && (nGrid[5] == HAS_X)) ||
        ((nGrid[6] == HAS_X) && (nGrid[7] == HAS_X) && (nGrid[8] == HAS_X)) ||
        ((nGrid[0] == HAS_X) && (nGrid[3] == HAS_X) && (nGrid[6] == HAS_X)) ||
        ((nGrid[1] == HAS_X) && (nGrid[4] == HAS_X) && (nGrid[7] == HAS_X)) ||
        ((nGrid[2] == HAS_X) && (nGrid[5] == HAS_X) && (nGrid[8] == HAS_X)) ||
        ((nGrid[0] == HAS_X) && (nGrid[4] == HAS_X) && (nGrid[8] == HAS_X)) ||
        ((nGrid[2] == HAS_X) && (nGrid[4] == HAS_X) && (nGrid[6] == HAS_X)))
        return HAS_X;

    if (((nGrid[0] == HAS_O) && (nGrid[1] == HAS_O) && (nGrid[2] == HAS_O)) ||
        ((nGrid[3] == HAS_O) && (nGrid[4] == HAS_O) && (nGrid[5] == HAS_O)) ||
        ((nGrid[6] == HAS_O) && (nGrid[7] == HAS_O) && (nGrid[8] == HAS_O)) ||
        ((nGrid[0] == HAS_O) && (nGrid[3] == HAS_O) && (nGrid[6] == HAS_O)) ||
        ((nGrid[1] == HAS_O) && (nGrid[4] == HAS_O) && (nGrid[7] == HAS_O)) ||
        ((nGrid[2] == HAS_O) && (nGrid[5] == HAS_O) && (nGrid[8] == HAS_O)) ||
        ((nGrid[0] == HAS_O) && (nGrid[4] == HAS_O) && (nGrid[8] == HAS_O)) ||
        ((nGrid[2] == HAS_O) && (nGrid[4] == HAS_O) && (nGrid[6] == HAS_O)))
        return HAS_O;

    return 0;
}
