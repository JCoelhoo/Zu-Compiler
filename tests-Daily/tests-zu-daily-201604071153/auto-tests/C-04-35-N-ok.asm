; DATA
segment	.data
; ALIGN
align	4
; LABEL x
x:
; CONST 0
	dd	0
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
; INT 4
	push	dword 4
; DUP
	push	dword [esp]
; ADDR x
	push	dword $x
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH 4
	add	esp, 4
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LABEL _L2
_L2:
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
