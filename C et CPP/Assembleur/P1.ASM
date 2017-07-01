DOSSEG
.MODEL SMALL
.STACK 50
.DATA
LIGNE DB "Hello$"
.CODE
	org 100h
debut:
	mov ax, @data
	mov ds, ax
	mov ah, 09h
	mov dx, offset ligne
	int 21h
	mov ax,4c00h
	int 21h
end debut

