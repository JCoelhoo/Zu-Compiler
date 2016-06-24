; DATA
segment	.data
; ALIGN
align	4
; LABEL f
f:
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
; ENTER 28
	push	ebp
	mov	ebp, esp
	sub	esp, 28
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; INT 4
	push	dword 4
; LOCA -8
	pop	eax
	mov	[ebp-8], eax
; INT 0
	push	dword 0
; LOCA -12
	pop	eax
	mov	[ebp-12], eax
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ALLOC
	pop	eax
	sub	esp, eax
; SP
	push	esp
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
; INT 0
	push	dword 0
; LOCA -16
	pop	eax
	mov	[ebp-16], eax
; LABEL _L5
_L5:
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; JZ _L8
	pop	eax
	cmp	eax, byte 0
	je	near _L8
; INT 2
	push	dword 2
; DUP
	push	dword [esp]
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
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
; INT 1
	push	dword 1
; ADD
	pop	eax
	add	dword [esp], eax
; DUP
	push	dword [esp]
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L5
	jmp	dword _L5
; LABEL _L7
_L7:
; LOCAL -16
	lea	eax, [ebp+-16]
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
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L5
	jmp	dword _L5
; LABEL _L6
_L6:
; LOCAL -16
	lea	eax, [ebp+-16]
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
; LOCAL -16
	lea	eax, [ebp+-16]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; LABEL _L8
_L8:
; INT 0
	push	dword 0
; LOCA -20
	pop	eax
	mov	[ebp-20], eax
; LABEL _L10
_L10:
; LOCAL -20
	lea	eax, [ebp+-20]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; JZ _L13
	pop	eax
	cmp	eax, byte 0
	je	near _L13
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -20
	lea	eax, [ebp+-20]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LOCAL -20
	lea	eax, [ebp+-20]
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
; LOCAL -20
	lea	eax, [ebp+-20]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L10
	jmp	dword _L10
; LABEL _L12
_L12:
; LOCAL -20
	lea	eax, [ebp+-20]
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
; LOCAL -20
	lea	eax, [ebp+-20]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L10
	jmp	dword _L10
; LABEL _L11
_L11:
; LOCAL -20
	lea	eax, [ebp+-20]
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
; LOCAL -20
	lea	eax, [ebp+-20]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; LABEL _L13
_L13:
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L15
_L15:
; STR (value omitted -- see below)
	db	10, 0
; TEXT
segment	.text
; ADDR _L15
	push	dword $_L15
; CALL prints
	call	prints
; TRASH 4
	add	esp, 4
; INT 0
	push	dword 0
; LOCA -24
	pop	eax
	mov	[ebp-24], eax
; LABEL _L16
_L16:
; LOCAL -24
	lea	eax, [ebp+-24]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; JZ _L19
	pop	eax
	cmp	eax, byte 0
	je	near _L19
; INT 6
	push	dword 6
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -24
	lea	eax, [ebp+-24]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; LOAD
	pop	eax
	push	dword [eax]
; DIV
	pop	ecx
	pop	eax
	cdq
	idiv	ecx
	push	eax
; DUP
	push	dword [esp]
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -24
	lea	eax, [ebp+-24]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH 4
	add	esp, 4
; LOCAL -24
	lea	eax, [ebp+-24]
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
; LOCAL -24
	lea	eax, [ebp+-24]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L16
	jmp	dword _L16
; LABEL _L18
_L18:
; LOCAL -24
	lea	eax, [ebp+-24]
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
; LOCAL -24
	lea	eax, [ebp+-24]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L16
	jmp	dword _L16
; LABEL _L17
_L17:
; LOCAL -24
	lea	eax, [ebp+-24]
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
; LOCAL -24
	lea	eax, [ebp+-24]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; LABEL _L19
_L19:
; INT 0
	push	dword 0
; LOCA -28
	pop	eax
	mov	[ebp-28], eax
; LABEL _L21
_L21:
; LOCAL -28
	lea	eax, [ebp+-28]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; JZ _L24
	pop	eax
	cmp	eax, byte 0
	je	near _L24
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -28
	lea	eax, [ebp+-28]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LOCAL -28
	lea	eax, [ebp+-28]
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
; LOCAL -28
	lea	eax, [ebp+-28]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L21
	jmp	dword _L21
; LABEL _L23
_L23:
; LOCAL -28
	lea	eax, [ebp+-28]
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
; LOCAL -28
	lea	eax, [ebp+-28]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; JMP _L21
	jmp	dword _L21
; LABEL _L22
_L22:
; LOCAL -28
	lea	eax, [ebp+-28]
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
; LOCAL -28
	lea	eax, [ebp+-28]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; LABEL _L24
_L24:
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
; EXTERN prints
extern	prints
