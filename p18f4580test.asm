    ;***************************************
    ; File name: p18f4580test.asm: test flag bits inside the status register
    ; Name: Ryan Lewis
    ; Date: 9/20/2018
    ;***********************

    list p=18f4580
    #include <p18f4580.inc>
    R1 EQU 0x25		; R1 = 0x25
    R2 EQU 0x26		; R1 = 0x26
 
	ORG   0x000	; process reset vector
AGAIN	MOVLW	d'50'	; WREG = 50
	MOVWF R1	; [0x25] = 50
LOP_1	MOVLW d'33'	; WREG = 33
	MOVWF R2	; [0x26] = 33
LOP_2	DECF R2, F	; [0x26] = [0x26]-1
	BNZ LOP_2	; if STATUS.zero = 0 goto LOP_2
	DECF R1, F	; R1 = R1-1 or [0x25] = [0x25]-1
	BNZ LOP_1	; if STATUS.zero != 0 goto LOP_1
	GOTO AGAIN
	END