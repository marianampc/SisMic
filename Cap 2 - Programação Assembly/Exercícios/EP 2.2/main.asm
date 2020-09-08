; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício: Sempre operando com palavras de 16 bits (.W), escreva uma sub-rotina que armazene em R7 a soma das palavras de 16 bits presentes em R5 e R6 (R7 = R5 + R6).
; Teste seu programa com R5 = 20.000 e R6 = 20.000 e depois com R5 = 30.000 e R6 = 30.000.
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
			mov.w	#20000,r5
			call	#soma2
			mov.w	#30000,r5
			call	#soma2
			jmp		$
soma2:		mov.w		r5,r6
			mov.w		r5,r7
			add.b		r6,r7
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
            
