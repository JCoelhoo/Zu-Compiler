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
; LOCAL 8
	lea	eax, [ebp+8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 0
	push	dword 0
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; JZ _L2
	pop	eax
	cmp	eax, byte 0
	je	near _L2
; INT 0
	push	dword 0
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
; JMP _L3
	jmp	dword _L3
; LABEL _L2
_L2:
; LOCAL 8
	lea	eax, [ebp+8]
	push	eax
; LOAD
	pop	eax
	push	dword [eax]
; INT 1
	push	dword 1
; SUB
	pop	eax
	sub	dword [esp], eax
; CALL $f
	call	$f
; TRASH 4
	add	esp, 4
; PUSH
	push	eax
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
; JMP _L1
	jmp	dword _L1
; LABEL _L3
_L3:
; INT 9
	push	dword 9
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
; INT 3
	push	dword 3
; CALL $f
	call	$f
; TRASH 4
	add	esp, 4
; PUSH
	push	eax
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
