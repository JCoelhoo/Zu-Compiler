; TEXT
segment	.text
; ALIGN
align	4
; GLOBAL $f, :function
global	$f:function
; LABEL $f
$f:
; ENTER 0
	push	ebp
	mov	ebp, esp
	sub	esp, 0
; LOCAL 12
	lea	eax, [ebp+12]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; LOCAL 8
	lea	eax, [ebp+8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; ADD
	pop	eax
	add	dword [esp], eax
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
; LABEL _L1
_L1:
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
; INT 3
	push	dword 3
; INT 4
	push	dword 4
; CALL $f
	call	$f
; TRASH 4
	add	esp, 4
; TRASH 4
	add	esp, 4
; TRASH 0
	add	esp, 0
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