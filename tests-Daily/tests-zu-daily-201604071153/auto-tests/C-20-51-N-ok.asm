; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L1
_L1:
; STR (value omitted -- see below)
	db	"ole", 0
; DATA
segment	.data
; ALIGN
align	4
; LABEL x
x:
; ID _L1
	dd	_L1
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
; CALL prints
	call	prints
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
; EXTERN prints
extern	prints
