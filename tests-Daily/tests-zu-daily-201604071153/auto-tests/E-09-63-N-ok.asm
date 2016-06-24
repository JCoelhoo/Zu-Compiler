; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL _main, :function
global	_main:function
; LABEL _main
_main:
; ENTER 8
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; INT 0
	push	dword 0
; LOCA -8
	pop	eax
	mov	[ebp-8], eax
; LABEL _L2
_L2:
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 30
	push	dword 30
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; JZ _L5
	pop	eax
	cmp	eax, byte 0
	je	near _L5
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; CALL println
	call	println
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; DUP
	push	dword [esp]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L2
	jmp	dword _L2
; LABEL _L4
_L4:
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; DUP
	push	dword [esp]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L2
	jmp	dword _L2
; LABEL _L3
_L3:
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; DUP
	push	dword [esp]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; LABEL _L5
_L5:
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
; EXTERN printi
extern	printi
; EXTERN println
extern	println
