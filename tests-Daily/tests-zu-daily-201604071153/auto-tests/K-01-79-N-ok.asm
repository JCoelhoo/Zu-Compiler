; DATA
segment	.data
; ALIGN
align	4
; GLOBAL x, :object
global	x:object
; LABEL x
x:
; CONST 10
	dd	10
; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL $f, :function
global	$f:function
; LABEL $f
$f:
; ENTER 4
	push	ebp
	mov	ebp, esp
	sub	esp, 4
; INT 3
	push	dword 3
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; LOCAL -4
	lea	eax, [ebp+-4]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LABEL _L2
_L2:
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
; ENTER 4
	push	ebp
	mov	ebp, esp
	sub	esp, 4
; INT 0
	push	dword 0
; LOCA -4
	pop	eax
	mov	[ebp-4], eax
; CALL $f
	call	$f
; TRASH 0
	add	esp, 0
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LABEL _L4
_L4:
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
