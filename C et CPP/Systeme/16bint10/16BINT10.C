// 16bint10.c
// Appel � l'int 10 depuis un programme 16 bits

#include <stdio.h>

int main()
{
  puts("Avant");
  
  _asm
  {
    mov ah, 0x06;			// Scroll up
    mov al, 0;				// 0 lignes � scroller -> effacement
    mov cx, 0;				// coin haut gauche: (0,0)
    mov dx, (42<<8)+79;		// coin bas droite: (43,80)
    mov bh, 0x17;			// attributs de remplacement: blanc/bleu
    int 0x10;
  }
  
  puts("Apr�s");
  return 0;
}