#include <windows.h>
#include "resource.h"

int main()
{
	// get handles for this window and application instance
	HWND hWnd = GetForegroundWindow();
	HINSTANCE hInstance = (HINSTANCE)GetModuleHandle(NULL);

	// get a device context for the client area of the window
	HDC hdc = GetDC(hWnd);

	// load our bitmap from a resource
	HBITMAP hBmp = (HBITMAP)LoadImage(hInstance, 
		                              MAKEINTRESOURCE(IDB_BITMAP1), 
									  IMAGE_BITMAP, 
									  0, 0, 
									  LR_DEFAULTCOLOR);

	// create a memory DC for the bitmap
	HDC hMemDC = CreateCompatibleDC(hdc);
	SelectObject(hMemDC, hBmp);

	// get the image size and display the whole thing
	BITMAP bmp;
	GetObject(hBmp, sizeof(BITMAP), &bmp);
	BitBlt(hdc, 0, 0, bmp.bmWidth, bmp.bmHeight, hMemDC, 0, 0, SRCCOPY);

	// release objects
	DeleteDC(hMemDC);
	DeleteObject(hBmp);
	ReleaseDC(hWnd, hdc);
	return 0;
}