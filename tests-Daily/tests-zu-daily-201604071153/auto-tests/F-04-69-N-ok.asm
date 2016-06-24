; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL _main, :function
global	_main:function
; LABEL _main
_main:
; ENTER 12
	push	ebp
	mov	ebp, esp
	sub	esp, 12
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; INT 1
	push	dword 1
; LOCA -8
	pop	eax
	mov	[ebp-8], eax
; INT 1
	push	dword 1
; LOCA -12
	pop	eax
	mov	[ebp-12], eax
; LABEL _L4
_L4:
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 3
	push	dword 3
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; JZ _L7
	pop	eax
	cmp	eax, byte 0
	je	near _L7
; LABEL _L8
_L8:
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 6
	push	dword 6
; LE
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setle	cl
	mov	[esp], ecx
; JZ _L11
	pop	eax
	cmp	eax, byte 0
	je	near _L11
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 2
	push	dword 2
; MOD
	pop	ecx
	pop	eax
	cdq
	idiv	ecx
	push	edx
; INT 0
	push	dword 0
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; JZ _L12
	pop	eax
	cmp	eax, byte 0
	je	near _L12
; JMP _L9
	jmp	dword _L9
; JMP _L13
	jmp	dword _L13
; LABEL _L12
_L12:
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
; LABEL _L13
_L13:
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
; TRASH 4
	add	esp, 4
; JMP _L8
	jmp	dword _L8
; LABEL _L10
_L10:
; JMP _L8
	jmp	dword _L8
; LABEL _L9
_L9:
; LABEL _L11
_L11:
; LOCAL -12
	lea	eax, [ebp+-12]
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
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH 4
	add	esp, 4
; JMP _L4
	jmp	dword _L4
; LABEL _L6
_L6:
; JMP _L4
	jmp	dword _L4
; LABEL _L5
_L5:
; LABEL _L7
_L7:
; INT 99
	push	dword 99
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
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
