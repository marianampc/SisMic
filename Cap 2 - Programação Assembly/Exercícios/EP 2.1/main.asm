; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício:    Sempre operando com bytes (.B), escreva uma sub-rotina que armazene em R7 a
; soma dos bytes presentes em R5 e R6 (R7 = R5 + R6). Teste seu programa com R5 =
; 100 e R6 = 100 e depois com R5 = 150 e R6 = 150.
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
			mov.b	#100,R5
			mov.b	#100,R6
			call	#soma
			mov.b	#150,R5
			mov.b	#150,R6
			call	#soma
			jmp		$

soma:		mov.b		R5,R7
			add.b		R6,R7
			ret

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
            
