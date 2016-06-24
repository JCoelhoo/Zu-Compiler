; DATA
segment	.data
; ALIGN
align	4
; LABEL x
x:
; CONST 1
	dd	1
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
; LABEL _L3
_L3:
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; INT 5
	push	dword 5
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; JZ _L6
	pop	eax
	cmp	eax, byte 0
	je	near _L6
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; INT 2
	push	dword 2
; ADD
	pop	eax
	add	dword [esp], eax
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
; JMP _L3
	jmp	dword _L3
; LABEL _L5
_L5:
; JMP _L3
	jmp	dword _L3
; LABEL _L4
_L4:
; LABEL _L6
_L6:
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
