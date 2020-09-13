; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício:    Considerando R5 = 0xABCD e R6 = 0xDCBA, armazenar em R6 soma em 16 bits
; de R5 + R6 (R6 = R5 + R6).
;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
			MOV.W	#0xABCD,R5
			MOV.W 	#0xDCBA,R6
			ADD.W	R5,R6 		;Nesse exemplo a soma de R5 e R6 ultrapassa o valor de 16bits, logo a flag carry é mudado para 1.
			mov		#0,R7
			adc		R7			;Assim, colocamos o carry no registrador r7
			JMP		$

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
