; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício:    Usaremos agora a memória RAM do MSP que inicia em 0x2400. É pedido para
; armazenar em R10 soma dos dois bytes que estão nas posições 0x2400 e 0x2401.
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
;			Primeira tentativa
			mov.b	&0x2401,R6	;No R6 será salvo o valor da memória 0x2401, para eu poder fazer a soma manualmente
			mov.b	&0x2400,R7	;No R7 será salvo o valor da memória 0x2400, para eu poder fazer a soma manualmente
			mov.b 	&0x2401,R8	;É feito a mesma ação de R6, contudo ele será apagado em baixo
			add.w 	R7,R8

;			Segunda Tentativa
			mov.b 	&0x2400,R9
			add.b 	&0x2401,R9

;			Correção do Livro:
			MOV.B 	&DT,R10 	;R10 = primeiro byte
 			ADD.B 	&0x2401,R10 ;Somar R10 com o segundo byte
 			JMP 	$ 			;Prender MSP

			.data
DT: .byte 0x33, 0x44 ;Inicializar posições 0x2400 e 0x2401
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
            
