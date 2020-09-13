; Autor: Mariana Martins Pessoa Costa
; Matrícula: 140154175
; Exercício:  Vamos propor um exercício muito semelhante ao anterior. Escreva a sub-rotina SOMA que calcula o somatório dos números de 16 bits que estão
; armazenados a partir do endereço 0x2400. A quantidade de números a serem somados é indicada por R6. O resultado do somatório deve ser calculado com 32 bits
; ,usando os registradores R10 (LSWord) e R11 (MSWord).
;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking and retain current section.
            .retainrefs                     ; And retain any sections that have references to current section.
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer
;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
			mov		#5,r6
			clr.w	r11
			clr.w	r10
			mov 	#DT,r8
 			call	#soma
			jmp 	$
soma:		add.w	@r8,r10
			adc		r11
 			incd	r8
 			dec		r6
 			jnz		soma
 			ret

 .data ;Indicar uso da memória de dados
DT: .word 0xABCD,0xEEEE,0x1111,0xBA98, 0xAAAA ;Nr a somar
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
            
