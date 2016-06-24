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
; ENTER 4
	push	ebp
	mov	ebp, esp
	sub	esp, 4
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; INT 2
	push	dword 2
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L3
_L3:
; DOUBLE 6200.00
	dq	6200.00
; TEXT
segment	.text
; ADDR _L3
	push	dword $_L3
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
; DSTORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
	pop	eax
	mov	[ecx+4], eax
; TRASH 8
	add	esp, 8
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L4
_L4:
; DOUBLE 3100.00
	dq	3100.00
; TEXT
segment	.text
; ADDR _L4
	push	dword $_L4
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
; INT 1
	push	dword 1
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
; ADDR f
	push	dword $f
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
; ADDR f
	push	dword $f
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
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
