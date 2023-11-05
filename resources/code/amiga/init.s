BPLCON0=                    $100
BPLCON1=                    $102
BPLCON2=                    $104
BLTAMOD:                equ $64
BLTBMOD:                equ $62
BLTCMOD:                equ $60
BLTDMOD:                equ $66
BLTAFWM:                equ $44
BLTCON0:                equ $40
BLTCON1:                equ $42
VHPOSR:                 equ 6
BLTAPTH:                equ $50
BLTAPTL:                equ $52
BLTBPTH:                equ $4c
BLTCPTH:                equ $48
BLTDPTH:                equ $54
BLTSIZE:                equ $58
BLTADAT:                equ $74
BLTBDAT:                equ $72
CIAAPRA         EQU             $bfe001
VPOSR           EQU             $dff004
COP1LCH         EQU             $dff080
DMACONR		EQU		$dff002
ADKCONR		EQU		$dff010
INTENAR		EQU		$dff01c
INTREQR		EQU		$dff01e


CIAAPRA2         EQU             $001
VPOSR2           EQU             $004
COP1LCH2         EQU             $080
DMACONR2		EQU		$002
ADKCONR2		EQU		$010
INTENAR2		EQU		$01c
INTREQR2		EQU		$01e

DMACON		EQU		$dff096
ADKCON		EQU		$dff09e
INTENA		EQU		$dff09a
INTREQ		EQU		$dff09c


DMACON2		EQU		$096
ADKCON2		EQU		$09e
INTENA2		EQU		$09a
INTREQ2		EQU		$09c






init:
	; store data in hardwareregisters ORed with $8000
        ;(bit 15 is a write-set bit when values are written back into the system)



;Stack the registers

	movem.l d0-d7/a0-a6,-(sp)


	move.w	DMACONR,d0
	or.w #$8000,d0
	move.w d0,olddmareq
	move.w	INTENAR,d0
	or.w #$8000,d0
	move.w d0,oldintena
	move.w	INTREQR,d0
	or.w #$8000,d0
	move.w d0,oldintreq

;        move.w  #$7fff,INTENA

        move.w	ADKCONR,d0;
	or.w #$8000,d0
	move.w d0,oldadkcon


	; base library address in $4
	move.l	$4,a6
	move.l	#gfxname,a1
	moveq	#0,d0 ; whatever
	jsr	-552(a6) 
	move.l	d0,gfxbase
	move.l 	d0,a6
	move.l 	34(a6),oldview
	move.l 	38(a6),oldcopper

	move.l #0,a1
	jsr -222(a6)	; LoadView
	jsr -270(a6)	; WaitTOF
	jsr -270(a6)	; WaitTOF
	move.l	$4,a6
	jsr -132(a6)	; Forbid

        move.l #cop,a0
        move.l a0,COP1LCH

