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
; INT 0
	push	dword 0
; JZ _L2
	pop	eax
	cmp	eax, byte 0
	je	near _L2
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L3
_L3:
; STR (value omitted -- see below)
	db	"KO", 0
; TEXT
segment	.text
; ADDR _L3
	push	dword $_L3
; CALL prints
	call	prints
; TRASH 4
	add	esp, 4
; JMP _L4
	jmp	dword _L4
; LABEL _L2
_L2:
; LABEL _L4
_L4:
; INT 1
	push	dword 1
; JZ _L5
	pop	eax
	cmp	eax, byte 0
	je	near _L5
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L6
_L6:
; STR (value omitted -- see below)
	db	"elif", 0
; TEXT
segment	.text
; ADDR _L6
	push	dword $_L6
; CALL prints
	call	prints
; TRASH 4
	add	esp, 4
; JMP _L7
	jmp	dword _L7
; LABEL _L5
_L5:
; RODATA
segment	.rodata
; ALIGN
align	4
; LABEL _L8
_L8:
; STR (value omitted -- see below)
	db	"OK", 0
; TEXT
segment	.text
; ADDR _L8
	push	dword $_L8
; CALL prints
	call	prints
; TRASH 4
	add	esp, 4
; LABEL _L7
_L7:
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
; EXTERN prints
extern	prints
