; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL $main, :function
global	$main:function
; LABEL $main
$main:
; ENTER 4
	push	ebp
	mov	ebp, esp
	sub	esp, 4
; INT 1
	push	dword 1
; INT 8
	push	dword 8
; MUL
	pop	eax
	imul	dword eax, [esp]
	mov	[esp], eax
; LOCAL 8
	lea	eax, [ebp+8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; ADD
	pop	eax
	add	dword [esp], eax
; DUP
	push	dword [esp]
; LOCAL -4
	lea	eax, [ebp+-4]
	push	eax
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
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
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
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
; LABEL _L5
_L5:
; DOUBLE 3.10000
	dq	3.10000
; TEXT
segment	.text
; ADDR _L5
	push	dword $_L5
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
; LOCAL -8
	lea	eax, [ebp+-8]
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
; LABEL _L6
_L6:
; DOUBLE 2.10000
	dq	2.10000
; TEXT
segment	.text
; ADDR _L6
	push	dword $_L6
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
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L7
_L7:
; DOUBLE 61.0000
	dq	61.0000
; TEXT
segment	.text
; ADDR _L7
	push	dword $_L7
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
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 2
	push	dword 2
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
; CALL $main
	call	$main
; TRASH 4
	add	esp, 4
; PUSH
	push	eax
; CALL $main
	call	$main
; TRASH 4
	add	esp, 4
; PUSH
	push	eax
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
; LOCAL -12
	lea	eax, [ebp+-12]
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
