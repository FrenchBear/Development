// 32bint10.c
// Appel à l'int 10 depuis un programme 32 bits

#include <stdio.h>

int main()
{
  puts("Avant");
  
  _asm
  {
    mov eax, 0;
	mov ebx, 0;

    mov ah, 0x06;			// Scroll up
    mov al, 0;				// 0 lignes à scroller -> effacement
    mov ecx, 0;				// coin haut gauche: (0,0)
    mov edx, (42<<8)+79;		// coin bas droite: (43,80)
    mov bh, 0x17;			// attributs de remplacement: blanc/bleu
    int 0x10;
  }
  
  puts("Après");
  return 0;
}
