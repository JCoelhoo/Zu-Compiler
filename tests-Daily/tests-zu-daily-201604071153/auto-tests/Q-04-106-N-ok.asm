; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL _main, :function
global	_main:function
; LABEL _main
_main:
; ENTER 16
	push	ebp
	mov	ebp, esp
	sub	esp, 16
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L3
_L3:
; DOUBLE 61.0000
	dq	61.0000
; TEXT
segment	.text
; ADDR _L3
	push	dword $_L3
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; DSTORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
	pop	eax
	mov	[ecx+4], eax
; INT 0
	push	dword 0
; LOCA -16
	pop	eax
	mov	[ebp-16], eax
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; DUP
	push	dword [esp]
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH 4
	add	esp, 4
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 0
	push	dword 0
; INT 8
	push	dword 8
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; CALL printd
	call	printd
; TRASH 8
	add	esp, 8
; LABEL _L1
_L1:
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
; EXTERN printd
extern	printd
