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
; INT 2
	push	dword 2
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
; PUSH
	push	eax
; CALL printi
	call	printi
; TRASH 4
	add	esp, 4
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
