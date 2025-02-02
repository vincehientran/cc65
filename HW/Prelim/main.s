;
; File generated by cc65 v 2.19 - Git 6ac4aa4e2
;
	.fopt		compiler,"cc65 v 2.19 - Git 6ac4aa4e2"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_printf
	.export		_fib
	.export		_main

.segment	"RODATA"

S0001:
	.byte	$25,$6C,$75,$0A,$00

; ---------------------------------------------------------------
; unsigned long __near__ fib (int n)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fib: near

.segment	"CODE"

	jsr     pushax
	ldy     #$01
	jsr     ldaxysp
	cmp     #$03
	txa
	sbc     #$00
	bvc     L0003
	eor     #$80
L0003:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jeq     L0002
	ldx     #$00
	stx     sreg
	stx     sreg+1
	lda     #$01
	jmp     L0004
	jmp     L0004
L0002:	ldy     #$01
	jsr     ldaxysp
	jsr     decax1
	jsr     _fib
	jsr     pusheax
	ldy     #$05
	jsr     ldaxysp
	jsr     decax2
	jsr     _fib
	jsr     tosaddeax
	jmp     L0004
L0004:	jsr     incsp2
	rts

.endproc

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	lda     #<(S0001)
	ldx     #>(S0001)
	jsr     pushax
	ldx     #$00
	lda     #$19
	jsr     _fib
	jsr     pusheax
	ldy     #$06
	jsr     _printf
	ldx     #$00
	lda     #$00
	jmp     L0001
L0001:	rts

.endproc

