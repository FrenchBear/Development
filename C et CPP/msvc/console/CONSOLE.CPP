#include <windows.h>
#include <stddef.h>
#include <stdlib.h>
#include <conio.h>
#pragma hdrstop

#include <iostream.h>

HANDLE hStdOut;						/* Handle for console window */
CONSOLE_SCREEN_BUFFER_INFO csbi;	/* Console information structure */

// Helper functions
ostream &operator <<(ostream &os, COORD &c)
{
  os << '(' << c.Y << ';' << c.X << ')';
  return os;
}

ostream &operator <<(ostream &os, SMALL_RECT &sr)
{
  os << '(' << sr.Top << ';' << sr.Left << ")-(" << sr.Bottom << ';' << sr.Right << ')';
  return os;
}


int main()
{
  hStdOut = GetStdHandle( STD_OUTPUT_HANDLE );

  /* Get display screen's text row and column information. */
  GetConsoleScreenBufferInfo(hStdOut, &csbi);

  cout << "hStdOut: " << (int)hStdOut << endl;
  cout << "Screen size: " << csbi.dwSize << endl;
  cout << "Cursor position: " << csbi.dwCursorPosition << endl;
  cout << "Attributes: " << csbi.wAttributes << endl;
  cout << "Display window: " << csbi.srWindow << endl;
  cout << "Max Window Size: " << csbi.dwMaximumWindowSize << endl;

  // Some stuff on console...
  unsigned long nb;
  WriteConsole(hStdOut, "Hello", 5, &nb, NULL);

  int i,j;
  for (i=0 ; i<16 ; i++)
    for (j=0 ; j<16 ; j++)
	{
	  unsigned char c = 16*i+j;

	  CHAR_INFO chiSrcBuffer;
	  chiSrcBuffer.Char.AsciiChar = c;
	  chiSrcBuffer.Attributes = c;

	  COORD coordSrcBufferSize;
	  coordSrcBufferSize.X = 1;
	  coordSrcBufferSize.Y = 1;

	  COORD coordSrcBufferCoord;
	  coordSrcBufferCoord.X = 0;
	  coordSrcBufferCoord.Y = 0;

	  SMALL_RECT srctDestRect;
	  srctDestRect.Left = 10+j;
	  srctDestRect.Top = 10+i;
	  srctDestRect.Right = 10+j;
	  srctDestRect.Bottom = 10+i;

	  WriteConsoleOutput(hStdOut, &chiSrcBuffer, coordSrcBufferSize, coordSrcBufferCoord, &srctDestRect);
	}


  // Then scroll !
  SMALL_RECT srctSourceRect;	// screen buffer rect. to move 
  SMALL_RECT srctClipRect;		// affected screen buffer rect. 
  COORD		 coordDestOrigin;	// new location of screen buffer rect. 
  CHAR_INFO	 chiFill;			// fill character and color

  chiFill.Char.AsciiChar = '+';	// We can see inserted lines
  chiFill.Attributes = 7;		// White/black

  // Scroll area, from line 12 to 14
  srctSourceRect.Top = 12;		
  srctSourceRect.Bottom = 14;
  srctSourceRect.Left = 0;
  srctSourceRect.Right = csbi.dwSize.X-1;

  // Clip on the scrolled area
  srctClipRect = srctSourceRect;
/*
  srctClipRect.Top = 0;
  srctClipRect.Bottom = 14; //csbi.dwSize.Y-1;
  srctClipRect.Left = 0;
  srctClipRect.Right = csbi.dwSize.X-1;
*/

  // 2 lines down  
  coordDestOrigin.X = 0;
  coordDestOrigin.Y = 14;

  if (!ScrollConsoleScreenBuffer(hStdOut, &srctSourceRect, &srctClipRect, coordDestOrigin, &chiFill))
    cout << "ScrollConsoleScreenBuffer failed: " << GetLastError() << endl;

  // If everything is Ok, lines 12 & 13 should be filled with '+',
  // line 14 should be the line 10 before scroll ( !"#...).
  //
  // On a Win95 system, filling is wrong:
  // 12: ++++++++++++++++++++++++++++++++++++...
  // 13:         0123456789:;<=>?
  // 14:          !"#$%&'()*+,-./
  // 15:         PQRSTUVWXYZ[\]^_
  // 16:         `abcdefghijklmno
  //
  // On a NT system:
  // 12: ++++++++++++++++++++++++++++++++++++...
  // 13: ++++++++++++++++++++++++++++++++++++...
  // 14:          !"#$%&'()*+,-./
  // 15:         PQRSTUVWXYZ[\]^_
  // 16:         `abcdefghijklmno

  return 0;
}
