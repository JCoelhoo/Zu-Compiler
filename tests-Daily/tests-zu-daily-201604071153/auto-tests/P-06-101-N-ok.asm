; DATA
segment	.data
; ALIGN
align	4
; LABEL f
f:
; DOUBLE 0.00000
	dq	0.00000
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
; INT 0
	push	dword 0
; LOCA -8
	pop	eax
	mov	[ebp-8], eax
; INT 0
	push	dword 0
; LOCA -12
	pop	eax
	mov	[ebp-12], eax
; INT 3
	push	dword 3
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
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; TRASH 4
	add	esp, 4
; INT 3
	push	dword 3
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
; INT 3
	push	dword 3
; DUP
	push	dword [esp]
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
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
; INT 6
	push	dword 6
; DUP
	push	dword [esp]
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 2
	push	dword 2
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
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
; INT 4
	push	dword 4
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; ADD
	pop	eax
	add	dword [esp], eax
; INT 1
	push	dword 1
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
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
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
; SUB
	pop	eax
	sub	dword [esp], eax
; I2D
	fild	dword [esp]
	sub	esp, byte 4
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
; DSTORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
	pop	eax
	mov	[ecx+4], eax
; TRASH 8
	add	esp, 8
; ADDR f
	push	dword $f
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; CALL printd
	call	printd
; TRASH 8
	add	esp, 8
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
; EXTERN printd
extern	printd
