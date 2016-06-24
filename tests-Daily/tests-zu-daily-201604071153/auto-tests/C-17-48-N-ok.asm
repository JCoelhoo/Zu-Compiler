; DATA
segment	.data
; ALIGN
align	4
; LABEL x
x:
; CONST 10
	dd	10
; DATA
segment	.data
; ALIGN
align	4
; LABEL y
y:
; CONST 3
	dd	3
; DATA
segment	.data
; ALIGN
align	4
; LABEL z
z:
; CONST 30
	dd	30
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
; ADDR x
	push	dword $x
; LOAD
	pop	eax
	push	dword [eax]
; ADDR y
	push	dword $y
; LOAD
	pop	eax
	push	dword [eax]
; EQ
	pop	eax
	xor	ecx, ecx
	cmp	[esp], eax
	sete	cl
	mov	[esp], ecx
; DUP
	push	dword [esp]
; JZ _L5
	pop	eax
	cmp	eax, byte 0
	je	near _L5
; INT 7
	push	dword 7
; DUP
	push	dword [esp]
; ADDR z
	push	dword $z
; STORE
	pop	ecx
	pop	eax
	mov	[ecx], eax
; AND
	pop	eax
	and	dword [esp], eax
; LABEL _L5
_L5:
; TRASH 4
	add	esp, 4
; ADDR z
	push	dword $z
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
