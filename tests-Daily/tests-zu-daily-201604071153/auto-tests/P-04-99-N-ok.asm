; DATA
segment	.data
; ALIGN
align	4
; LABEL f
f:
; CONST 0
	dd	0
; DATA
segment	.data
; ALIGN
align	4
; LABEL d
d:
; DOUBLE 4.00000
	dq	4.00000
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
; INT 7
	push	dword 7
; INT 8
	push	dword 8
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
; ADDR f
	push	dword $f
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH 4
	add	esp, 4
; INT 0
	push	dword 0
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
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 6
	push	dword 6
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
; ADDR d
	push	dword $d
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; DDUP
; SP
	push	esp
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; ADDR f
	push	dword $f
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 8
	push	dword 8
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; DSTORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
	pop	eax
	mov	[ecx+4], eax
; TRASH 8
	add	esp, 8
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
; JMP _L5
	jmp	dword _L5
; LABEL _L7
_L7:
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
; JMP _L5
	jmp	dword _L5
; LABEL _L6
_L6:
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
; LABEL _L8
_L8:
; ADDR d
	push	dword $d
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; ADDR d
	push	dword $d
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; DMUL
	fld	qword [esp]
	add	esp, byte 8
	fld	qword [esp]
	fmulp	st1
	fstp	qword [esp]
; DDUP
; SP
	push	esp
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; ADDR f
	push	dword $f
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 8
	push	dword 8
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; DSTORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
	pop	eax
	mov	[ecx+4], eax
; TRASH 8
	add	esp, 8
; INT 0
	push	dword 0
; LOCA -12
	pop	eax
	mov	[ebp-12], eax
; LABEL _L9
_L9:
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 7
	push	dword 7
; LT
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	setl	cl
	mov	[esp], ecx
; JZ _L12
	pop	eax
	cmp	eax, byte 0
	je	near _L12
; ADDR f
	push	dword $f
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
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
; JMP _L9
	jmp	dword _L9
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
; JMP _L9
	jmp	dword _L9
; LABEL _L10
_L10:
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
; LABEL _L12
_L12:
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
; EXTERN printd
extern	printd
