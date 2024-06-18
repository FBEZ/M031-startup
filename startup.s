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
	.size	isr_vector, 8
isr_vector:
	.word	__StackTop
	.word	__ResetHandlerSectionStart
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #2
	str	r3, [r7]
.L2:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	adds	r3, r2, r3
	str	r3, [r7]
	b	.L2
	.size	reset_handler, .-reset_handler
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
