// CT.cpp : Defines the entry point for the console application.

#include "stdafx.h"

typedef unsigned long long ulong64;
typedef signed long long long64;

extern "C" {
int ph_dct_imagehash(const char* file,ulong64 &hash);
int ph_hamming_distance(const ulong64 hash1,const ulong64 hash2);
}

int _tmain(int argc, _TCHAR* argv[])
{
	printf("Hello, world %d\n", sizeof(char));

	ulong64 hash1=0, hash2=0;
    const char *image1 = "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Bear tats\\ScreenShot001.png";  // "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tete17.jpg";
    const char *image2 = "C:\\Users\\Kafor_000\\Dropbox\\PicturesDBKB\\Pictures PV\\Tête17b.jpg";
    ph_dct_imagehash(image1, hash1);
    printf("%llX\n", hash1);
    ph_dct_imagehash(image2, hash2);
    printf("%llX\n", hash2);

	int d = ph_hamming_distance(hash1, hash2);
	printf("d = %d\n", d);

	getchar();
	return 0;
}
