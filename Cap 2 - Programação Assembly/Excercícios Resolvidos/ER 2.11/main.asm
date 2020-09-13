; Nome: 		Mariana Martins Pessoa Costa
; Matrícula:	140154175
; Problema: 	Para este exercício e os próximos, vamos sugerir uma forma de se arrumar um vetor na memória, como mostrado na Figura 2.4.
;				Note que para indicar o vetor, a única referência necessária é a do endereço de início, pois a primeira posição já indica seu tamanho.
;				Os elementos podem ser bytes, palavras de 16 bits (W16) ou palavras de 32 bits (W32). Para o caso de letras, os bytes serão indicados pela Tabela ASCII.
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
			mov		#vetor1,r5
			call	#sum16
			mov.b	r10,r7
			mov		#vetor2,r5
			call	#sum16
			mov.b	r10,r8
			mov		#vetor3,r5
			call	#sum16
			mov.b	r10,r9
			mov		#vetor4,r5
			call	#sum16
			jmp 	$

sum16:		clr.w	r10
			mov.w	@r5+,r6
loop:		add.w	@r5,r10
			dec.w	r6
			jnz		loop
			ret

 .data ;Indicar uso da memória de dados
vetor1: .word 0x05, 0x04, 0x07, 0x03, 0x09, 0x02
vetor2: .word 7, 1, 2, 3, 4, 5, 6, 7
vetor3: .word 10, 1, 2, 3, 4, 5, 5, -4, -3, -2, -1
vetor4: .word 6, 1234, 4567, 3, 5, -7654, 0

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
