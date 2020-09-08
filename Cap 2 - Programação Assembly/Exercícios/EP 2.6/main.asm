; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício:   Sempre operando com palavras de 16 bits (.W), escreva uma sub-rotina que armazene em R7 o resultado de R6 subtraído de R5 (R7 = R5 - R6).
; Teste seu programa com R5 = 6 e R6 = 5 e depois com R5 = 5 e R6 = 6. Qual a diferença para com os resultados apresentados no problema anterior?
;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
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
			mov		#6,r6
			mov		#5,r5
			call	#sub
			mov		#6,r5
			mov		#5,r6
			call	#sub
			jmp		$
sub:		mov		r6,r7
			sub		r5,r7
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
            
