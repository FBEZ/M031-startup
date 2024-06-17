	.cpu cortex-m0
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"startup.c"
	.text
	.global	isr_vector
	.section	.isr_vector_sec,"aw"
	.align	2
	.type	isr_vector, %object
	.size	isr_vector, 16
isr_vector:
	.word	536871168
	.word	256
	.word	513
	.word	770
	.section	.reset_handler_sec,"ax",%progbits
	.align	1
	.global	reset_handler
	.arch armv6s-m
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	reset_handler, %function
reset_handler:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.syntax divided
@ 5 "startup.c" 1
	loop: 
	 ADD R0, R0, #1 
	 ADD R1, R1, #5
	 b loop
	
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	.size	reset_handler, .-reset_handler
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
