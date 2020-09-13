; Autor: Mariana Martins Pessoa Costa
; Matr�cula: 140154175
; Exerc�cio: Escreva a sub-rotina SOMA, que armazena em R10 o somat�rio dos n�meros de
; 8 bits que est�o armazenados a partir do endere�o 0x2400. A quantidade de bytes a
; serem somados � indicada por R6. Por simplicidade, vamos supor que o somat�rio n�o
; ultrapasse a representa��o em 8 bits
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
;Inicio
			mov.b	#6,R6
			call 	#soma
			jmp		$

soma:		MOV.b 	&DT,R10
 			ADD.b 	&DT+1,R10
 			dec.b	R6
 			cmp.b	#0,R6
 			jnz		soma
 			ret

			.data				;Indica o uso de mem�ria de dados.
DT: .byte 0x11, 0x44 			;Inicializar posi��es 0x2400 e 0x2401
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
            
