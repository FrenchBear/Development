; Sample x64 assembly
; From doc "Intel Introduction to x64 assembly"
; 2021-08-19    PV

.data
realVal REAL8 +1.5		; Real number on 8 bytes

.code
PUBLIC CombineA
CombineA PROC
	add		ecx, dword ptr [rsp+28h]	; Add overflow parameter to first arg
	add		edx, r9d
	add		ecx, r8d
	add		ecx, edx
	movd	xmm0, ecx					; Move double word ecx into xmm0
	cvtdq2pd xmm0, xmm0					; convert double word to floating point
	movsd	xmm1, realVal				; load 1.5
	addsd	xmm1, mmword ptr [rsp+30h]	; add double parameter f
	divsd	xmm0, xmm1					; do the division, result in xmm0
	ret
CombineA ENDP

End
