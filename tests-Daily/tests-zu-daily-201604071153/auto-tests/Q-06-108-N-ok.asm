; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL $main, :function
global	$main:function
; LABEL $main
$main:
; ENTER 8
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; LOCAL 8
	lea	eax, [ebp+8]
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
; DSTORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
	pop	eax
	mov	[ecx+4], eax
; TRASH 8
	add	esp, 8
; LABEL _L1
_L1:
; LOCAL -8
	lea	eax, [ebp+-8]
	push	eax
; DLOAD
	pop	eax
	push	dword [eax+4]
	push	dword [eax]
; DPOP
	fld	qword [esp]
	add	esp, byte 8
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
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L4
_L4:
; DOUBLE 61.0000
	dq	61.0000
; TEXT
segment	.text
; ADDR _L4
	push	dword $_L4
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
; LOCAL -12
	lea	eax, [ebp+-12]
	push	eax
; CALL $main
	call	$main
; TRASH 4
	add	esp, 4
; DPUSH
	sub	esp, byte 8
	fstp	qword [esp]
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
