; Minimal example of using ca65 to build SNES ROM.

.p816   ; 65816 processor
.i16    ; X/Y are 16 bits
.a8     ; A is 8 bits
.smart

; Address Bus B Registers
INIDISP     =   $2100   ;   Screen Display Register   single   write   any time
OBSEL       =   $2101   ;   Object Size and Character Size Register   single   write   f-blank, v-blank
OAMADDL     =   $2102   ;   OAM Address Registers (Low)   single   write   f-blank, v-blank
OAMADDH     =   $2103   ;   OAM Address Registers (High)   single   write   f-blank, v-blank
OAMDATA     =   $2104   ;   OAM Data Write Register   single   write   f-blank, v-blank
BGMODE      =   $2105   ;   BG Mode and Character Size Register   single   write   f-blank, v-blank, h-blank
MOSAIC      =   $2106   ;   Mosaic Register   single   write   f-blank, v-blank, h-blank
BG1SC       =   $2107   ;   BG Tilemap Address Registers (BG1)   single   write   f-blank, v-blank
BG2SC       =   $2108   ;   BG Tilemap Address Registers (BG2)   single   write   f-blank, v-blank
BG3SC       =   $2109   ;   BG Tilemap Address Registers (BG3)   single   write   f-blank, v-blank
BG4SC       =   $210A   ;   BG Tilemap Address Registers (BG4)   single   write   f-blank, v-blank
BG12NBA     =   $210B   ;   BG Character Address Registers (BG1&2)   single   write   f-blank, v-blank
BG34NBA     =   $210C   ;   BG Character Address Registers (BG3&4)   single   write   f-blank, v-blank
BG1HOFS     =   $210D   ;   BG Scroll Registers (BG1)   dual   write   f-blank, v-blank, h-blank
BG1VOFS     =   $210E   ;   BG Scroll Registers (BG1)   dual   write   f-blank, v-blank, h-blank
BG2HOFS     =   $210F   ;   BG Scroll Registers (BG2)   dual   write   f-blank, v-blank, h-blank
BG2VOFS     =   $2110   ;   BG Scroll Registers (BG2)   dual   write   f-blank, v-blank, h-blank
BG3HOFS     =   $2111   ;   BG Scroll Registers (BG3)   dual   write   f-blank, v-blank, h-blank
BG3VOFS     =   $2112   ;   BG Scroll Registers (BG3)   dual   write   f-blank, v-blank, h-blank
BG4HOFS     =   $2113   ;   BG Scroll Registers (BG4)   dual   write   f-blank, v-blank, h-blank
BG4VOFS     =   $2114   ;   BG Scroll Registers (BG4)   dual   write   f-blank, v-blank, h-blank
VMAIN       =   $2115   ;   Video Port Control Register   single   write   f-blank, v-blank
VMADDL      =   $2116   ;   VRAM Address Registers (Low)   single   write   f-blank, v-blank
VMADDH      =   $2117   ;   VRAM Address Registers (High)   single   write   f-blank, v-blank
VMDATAL     =   $2118   ;   VRAM Data Write Registers (Low)   single   write   f-blank, v-blank
VMDATAH     =   $2119   ;   VRAM Data Write Registers (High)   single   write   f-blank, v-blank
M7SEL       =   $211A   ;   Mode 7 Settings Register   single   write   f-blank, v-blank
M7A         =   $211B   ;   Mode 7 Matrix Registers   dual   write   f-blank, v-blank, h-blank
M7B         =   $211C   ;   Mode 7 Matrix Registers   dual   write   f-blank, v-blank, h-blank
M7C         =   $211D   ;   Mode 7 Matrix Registers   dual   write   f-blank, v-blank, h-blank
M7D         =   $211E   ;   Mode 7 Matrix Registers   dual   write   f-blank, v-blank, h-blank
M7X         =   $211F   ;   Mode 7 Matrix Registers   dual   write   f-blank, v-blank, h-blank
M7Y         =   $2120   ;   Mode 7 Matrix Registers   dual   write   f-blank, v-blank, h-blank
CGADD       =   $2121   ;   CGRAM Address Register   single   write   f-blank, v-blank, h-blank
CGDATA      =   $2122   ;   CGRAM Data Write Register   dual   write   f-blank, v-blank, h-blank
W12SEL      =   $2123   ;   Window Mask Settings Registers   single   write   f-blank, v-blank, h-blank
W34SEL      =   $2124   ;   Window Mask Settings Registers   single   write   f-blank, v-blank, h-blank
WOBJSEL     =   $2125   ;   Window Mask Settings Registers   single   write   f-blank, v-blank, h-blank
WH0         =   $2126   ;   Window Position Registers (WH0)   single   write   f-blank, v-blank, h-blank
WH1         =   $2127   ;   Window Position Registers (WH1)   single   write   f-blank, v-blank, h-blank
WH2         =   $2128   ;   Window Position Registers (WH2)   single   write   f-blank, v-blank, h-blank
WH3         =   $2129   ;   Window Position Registers (WH3)   single   write   f-blank, v-blank, h-blank
WBGLOG      =   $212A   ;   Window Mask Logic registers (BG)   single   write   f-blank, v-blank, h-blank
WOBJLOG     =   $212B   ;   Window Mask Logic registers (OBJ)   single   write   f-blank, v-blank, h-blank
TM          =   $212C   ;   Screen Destination Registers   single   write   f-blank, v-blank, h-blank
TS          =   $212D   ;   Screen Destination Registers   single   write   f-blank, v-blank, h-blank
TMW         =   $212E   ;   Window Mask Destination Registers   single   write   f-blank, v-blank, h-blank
TSW         =   $212F   ;   Window Mask Destination Registers   single   write   f-blank, v-blank, h-blank
CGWSEL      =   $2130   ;   Color Math Registers   single   write   f-blank, v-blank, h-blank
CGADSUB     =   $2131   ;   Color Math Registers   single   write   f-blank, v-blank, h-blank
COLDATA     =   $2132   ;   Color Math Registers   single   write   f-blank, v-blank, h-blank
SETINI      =   $2133   ;   Screen Mode Select Register   single   write   f-blank, v-blank, h-blank
MPYL        =   $2134   ;   Multiplication Result Registers   single   read   f-blank, v-blank, h-blank
MPYM        =   $2135   ;   Multiplication Result Registers   single   read   f-blank, v-blank, h-blank
MPYH        =   $2136   ;   Multiplication Result Registers   single   read   f-blank, v-blank, h-blank
SLHV        =   $2137   ;   Software Latch Register   single      any time
OAMDATAREAD =   $2138   ;   OAM Data Read Register   dual   read   f-blank, v-blank
VMDATALREAD =   $2139   ;   VRAM Data Read Register (Low)   single   read   f-blank, v-blank
VMDATAHREAD =   $213A   ;   VRAM Data Read Register (High)   single   read   f-blank, v-blank
CGDATAREAD  =   $213B   ;   CGRAM Data Read Register   dual   read   f-blank, v-blank
OPHCT       =   $213C   ;   Scanline Location Registers (Horizontal)   dual   read   any time
OPVCT       =   $213D   ;   Scanline Location Registers (Vertical)   dual   read   any time
STAT77      =   $213E   ;   PPU Status Register   single   read   any time
STAT78      =   $213F   ;   PPU Status Register   single   read   any time
APUIO0      =   $2140   ;   APU IO Registers   single   both   any time
APUIO1      =   $2141   ;   APU IO Registers   single   both   any time
APUIO2      =   $2142   ;   APU IO Registers   single   both   any time
APUIO3      =   $2143   ;   APU IO Registers   single   both   any time
WMDATA      =   $2180   ;   WRAM Data Register   single   both   any time
WMADDL      =   $2181   ;   WRAM Address Registers   single   write   any time
WMADDM      =   $2182   ;   WRAM Address Registers   single   write   any time
WMADDH      =   $2183   ;   WRAM Address Registers   single   write   any time

; Old Style Joypad Registers
JOYSER0     =   $4016   ;   Old Style Joypad Registers   single (write)   read/write   any time that is not auto-joypad
JOYSER1     =   $4017   ;   Old Style Joypad Registers   many (read)   read   any time that is not auto-joypad

; Internal CPU Registers
NMITIMEN    =   $4200   ;   Interrupt Enable Register   single   write   any time
WRIO        =   $4201   ;   IO Port Write Register   single   write   any time
WRMPYA      =   $4202   ;   Multiplicand Registers   single   write   any time
WRMPYB      =   $4203   ;   Multiplicand Registers   single   write   any time
WRDIVL      =   $4204   ;   Divisor & Dividend Registers   single   write   any time
WRDIVH      =   $4205   ;   Divisor & Dividend Registers   single   write   any time
WRDIVB      =   $4206   ;   Divisor & Dividend Registers   single   write   any time
HTIMEL      =   $4207   ;   IRQ Timer Registers (Horizontal - Low)   single   write   any time
HTIMEH      =   $4208   ;   IRQ Timer Registers (Horizontal - High)   single   write   any time
VTIMEL      =   $4209   ;   IRQ Timer Registers (Vertical - Low)   single   write   any time
VTIMEH      =   $420A   ;   IRQ Timer Registers (Vertical - High)   single   write   any time
MDMAEN      =   $420B   ;   DMA Enable Register   single   write   any time
HDMAEN      =   $420C   ;   HDMA Enable Register   single   write   any time
MEMSEL      =   $420D   ;   ROM Speed Register   single   write   any time
RDNMI       =   $4210   ;   Interrupt Flag Registers   single   read   any time
TIMEUP      =   $4211   ;   Interrupt Flag Registers   single   read   any time
HVBJOY      =   $4212   ;   PPU Status Register   single   read   any time
RDIO        =   $4213   ;   IO Port Read Register   single   read   any time
RDDIVL      =   $4214   ;   Multiplication Or Divide Result Registers (Low)   single   read   any time
RDDIVH      =   $4215   ;   Multiplication Or Divide Result Registers (High)   single   read   any time
RDMPYL      =   $4216   ;   Multiplication Or Divide Result Registers (Low)   single   read   any time
RDMPYH      =   $4217   ;   Multiplication Or Divide Result Registers (High)   single   read   any time
JOY1L       =   $4218   ;   Controller Port Data Registers (Pad 1 - Low)   single   read   any time that is not auto-joypad
JOY1H       =   $4219   ;   Controller Port Data Registers (Pad 1 - High)   single   read   any time that is not auto-joypad
JOY2L       =   $421A   ;   Controller Port Data Registers (Pad 2 - Low)   single   read   any time that is not auto-joypad
JOY2H       =   $421B   ;   Controller Port Data Registers (Pad 2 - High)   single   read   any time that is not auto-joypad
JOY3L       =   $421C   ;   Controller Port Data Registers (Pad 3 - Low)   single   read   any time that is not auto-joypad
JOY3H       =   $421D   ;   Controller Port Data Registers (Pad 3 - High)   single   read   any time that is not auto-joypad
JOY4L       =   $421E   ;   Controller Port Data Registers (Pad 4 - Low)   single   read   any time that is not auto-joypad
JOY4H       =   $421F   ;   Controller Port Data Registers (Pad 4 - High)   single   read   any time that is not auto-joypad

; DMA/HDMA Registers
DMAPx       =   $4300   ;   (H)DMA Control Register
BBADx       =   $4301   ;   (H)DMA Destination Register
A1TxL       =   $4302   ;   (H)DMA Source Address Registers
A1TxH       =   $4303   ;   (H)DMA Source Address Registers
A1Bx        =   $4304   ;   (H)DMA Source Address Registers
DASxL       =   $4305   ;   (H)DMA Size Registers (Low)
DASxH       =   $4306   ;   (H)DMA Size Registers (High)
DASBx       =   $4307   ;   HDMA Indirect Address Registers
A2AxL       =   $4308   ;   HDMA Mid Frame Table Address Registers (Low)
A2AxH       =   $4309   ;   HDMA Mid Frame Table Address Registers (High)
NTLRx       =   $430A   ;   HDMA Line Counter Register

.charmap $40, $40
.charmap $41, $41
.charmap $42, $42
.charmap $43, $43
.charmap $44, $44
.charmap $45, $45
.charmap $46, $46
.charmap $47, $47
.charmap $48, $48
.charmap $49, $49
.charmap $4a, $4a
.charmap $4b, $4b
.charmap $4c, $4c
.charmap $4d, $4d
.charmap $4e, $4e
.charmap $4f, $4f
.charmap $50, $50
.charmap $51, $51
.charmap $52, $52
.charmap $53, $53
.charmap $54, $54
.charmap $55, $55
.charmap $56, $56
.charmap $57, $57
.charmap $58, $58
.charmap $59, $59
.charmap $5a, $5a
.charmap $5b, $5b
.charmap $5c, $5c
.charmap $5d, $5d
.charmap $5e, $5e
.charmap $5f, $5f
.charmap $61, $61
.charmap $62, $62
.charmap $63, $63
.charmap $64, $64
.charmap $65, $65
.charmap $66, $66
.charmap $67, $67
.charmap $68, $68
.charmap $69, $69
.charmap $6a, $6a
.charmap $6b, $6b
.charmap $6c, $6c
.charmap $6d, $6d
.charmap $6e, $6e
.charmap $6f, $6f
.charmap $70, $70
.charmap $71, $71
.charmap $72, $72
.charmap $73, $73
.charmap $74, $74
.charmap $75, $75
.charmap $76, $76
.charmap $77, $77
.charmap $78, $78
.charmap $79, $79
.charmap $7a, $7a
.charmap $7b, $7b
.charmap $7c, $7c
.charmap $7d, $7d
.charmap $7e, $7e
.charmap $7f, $7f



.segment "SNESHEADER"
;$00FFC0-$00FFFF

.byte "TRSETRSETRSE         " ;rom name 21 chars
.byte $30  ;LoROM FastROM
.byte $00  ; extra chips in cartridge, 00: no extra RAM; 02: RAM with battery
.byte $08  ; ROM size (2^# in kB)
.byte $00  ; backup RAM size
.byte $01  ; US
.byte $33  ; publisher id
.byte $00  ; ROM revision number
.word $0000  ; checksum of all bytes
.word $0000  ; $FFFF minus checksum

;ffe0 not used
.word $0000
.word $0000

;ffe4 - native mode vectors
.addr return_int  ;cop native **
.addr return_int  ;brk native **
.addr return_int  ;abort native not used *
.addr Screen_nmi ;nmi native
.addr StartBlock800 ;RESET native
.addr return_int ;irq native


;fff0 not used
.word $0000
.word $0000

;fff4 - emulation mode vectors
.addr return_int  ;cop emulation **
.addr $0000 ; not used
.addr $0000  ;abort not used *
.addr Screen_nmi ;nmi emulation
.addr StartBlock800 ;RESET emulation
.addr return_int ;irq/brk emulation **

;* the SNES doesn't use the ABORT vector
;**the programmer could insert COP or BRK as debugging tools
;The SNES boots up in emulation mode, but then immediately
;  will be set in software to native mode
;IRQ_end is just an RTI
;the vectors here need to be in bank 00
;The SNES never looks at the checksum. Some emulators
;will give a warning message, if the checksum is w

VRAM_CHARSET   = $2000 ; must be at $1000 boundary
VRAM_BG1       = $1000 ; must be at $0400 boundary
VRAM_BG2       = $1400 ; must be at $0400 boundary
VRAM_BG3       = $1800 ; must be at $0400 boundary
VRAM_BG4       = $1C00 ; must be at $0400 boundary

.macro A8
        sep #$20
.endmacro

.macro A16
        rep #$20
.endmacro

.macro AXY8
        sep #$30
.endmacro

.macro AXY16
        rep #$30
.endmacro

.macro XY8
        sep #$10
.endmacro

.macro XY16
        rep #$10
.endmacro

.macro DMA_VRAM  src_addr, dst_addr, length
;dst is address in the VRAM
;a should be 8 bit, xy should be 16 bit
        ldx #dst_addr
        stx $2116 ; vram address

        lda #1
        sta $4300 ; transfer mode, 2 registers 1 write
                          ; $2118 and $2119 are a pair Low/High
        lda #$18  ; $2118
        sta $4301 ; destination, vram data
        ldx #.loword(src_addr)
        stx $4302 ; source
        lda #^src_addr
        sta $4304 ; bank
        ldx #length
        stx $4305 ; length
        lda #1
        sta $420b ; start dma, channel 0
.endmacro


.segment "CODE"
