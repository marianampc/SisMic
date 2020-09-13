; Autor: Mariana Martins Pessoa Costa
; Matr�cula: 140154175
; Exerc�cio:    Este exerc�cio � semelhante ao anterior, mas opera com 16 bits. � pedido para
; armazenar em R10 soma das palavras de 16 bits que est�o nas posi��es 0x2400 e
; 0x2402 (note os endere�os pares).
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
			MOV.W 	&DT,R10 	;R10 = primeiro byte
 			ADD.W 	&0x2402,R10 ;Somar R10 com o segundo byte
 			JMP 	$ 			;Prender MSP

			.data				;Indica o uso de mem�ria de dados.
DT: .word 0x1111, 0x4444 		;Inicializar posi��es 0x2400 e 0x2401
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
            
