; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício: Considerando a concatenação de R8(MSB) com R7(LSB), escreva uma subrotina que armazene em R8 e R7 a soma das palavras de 16 bits presentes em R5 e R6
; (R8 R7 = R5 + R6). Teste seu programa com R5 = 20.000 e R6 = 20.000 e depois com R5= 40.000 e R6 = 40.000.
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
			mov.w	#20000,r8
			call	#soma2
			mov.w	#40000,r8
			call	#soma2
			jmp		$
soma2:		mov.w	r8,r7
			add.w	r7,r8
			mov.b	r8,r7
			rra.b	r8
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
            
