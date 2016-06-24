; DATA
segment	.data
; ALIGN
align	4
; LABEL x
x:
; CONST 10
	dd	10
; DATA
segment	.data
; ALIGN
align	4
; LABEL y
y:
; CONST 3
	dd	3
; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL _main, :function
global	_main:function
; LABEL _main
_main:
; ENTER 4
	push	ebp
	mov	ebp, esp
	sub	esp, 4
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; ADDR y
	push	dword $y
; LOAD
	pop	eax
	push	dword [eax]
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LABEL _L3
_L3:
; LOCAL -4
	lea	eax, [ebp+-4]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; POP
	pop	eax
; LEAVE
	leave
; RET
	ret
; EXTERN printi
extern	printi
