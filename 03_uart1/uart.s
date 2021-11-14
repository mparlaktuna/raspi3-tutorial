	.arch armv8-a
	.file	"uart.c"
	.text
	.align	2
	.global	uart_init
	.type	uart_init, %function
uart_init:
	str	x19, [sp, -16]!
	mov	x0, 20484
	movk	x0, 0x3f21, lsl 16
	ldr	w1, [x0]
	mov	x0, 20484
	movk	x0, 0x3f21, lsl 16
	orr	w1, w1, 1
	str	w1, [x0]
	mov	x0, 20576
	movk	x0, 0x3f21, lsl 16
	str	wzr, [x0]
	mov	x0, 20556
	movk	x0, 0x3f21, lsl 16
	mov	w1, 3
	str	w1, [x0]
	mov	x0, 20560
	movk	x0, 0x3f21, lsl 16
	str	wzr, [x0]
	mov	x0, 20548
	movk	x0, 0x3f21, lsl 16
	str	wzr, [x0]
	mov	x0, 20552
	movk	x0, 0x3f21, lsl 16
	mov	w1, 198
	str	w1, [x0]
	mov	x0, 20584
	movk	x0, 0x3f21, lsl 16
	mov	w1, 270
	str	w1, [x0]
	mov	x0, 4
	movk	x0, 0x3f20, lsl 16
	ldr	w19, [x0]
	and	w19, w19, -258049
	mov	w0, 8192
	movk	w0, 0x1, lsl 16
	orr	w19, w19, w0
	mov	x0, 4
	movk	x0, 0x3f20, lsl 16
	str	w19, [x0]
	mov	x0, 148
	movk	x0, 0x3f20, lsl 16
	str	wzr, [x0]
	mov	w19, 150
	b	.L2
.L3:
	// Start of user assembly
// 63 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
.L2:
	mov	w0, w19
	sub	w19, w0, #1
	cmp	w0, 0
	bne	.L3
	mov	x0, 152
	movk	x0, 0x3f20, lsl 16
	mov	w1, 49152
	str	w1, [x0]
	mov	w19, 150
	b	.L4
.L5:
	// Start of user assembly
// 65 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
.L4:
	mov	w0, w19
	sub	w19, w0, #1
	cmp	w0, 0
	bne	.L5
	mov	x0, 152
	movk	x0, 0x3f20, lsl 16
	str	wzr, [x0]
	mov	x0, 20576
	movk	x0, 0x3f21, lsl 16
	mov	w1, 3
	str	w1, [x0]
	nop
	ldr	x19, [sp], 16
	ret
	.size	uart_init, .-uart_init
	.align	2
	.global	uart_send
	.type	uart_send, %function
uart_send:
	sub	sp, sp, #16
	str	w0, [sp, 12]
.L7:
	// Start of user assembly
// 75 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	mov	x0, 20564
	movk	x0, 0x3f21, lsl 16
	ldr	w0, [x0]
	and	w0, w0, 32
	cmp	w0, 0
	beq	.L7
	mov	x0, 20544
	movk	x0, 0x3f21, lsl 16
	ldr	w1, [sp, 12]
	str	w1, [x0]
	nop
	add	sp, sp, 16
	ret
	.size	uart_send, .-uart_send
	.align	2
	.global	uart_getc
	.type	uart_getc, %function
uart_getc:
	sub	sp, sp, #16
.L9:
	// Start of user assembly
// 86 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	mov	x0, 20564
	movk	x0, 0x3f21, lsl 16
	ldr	w0, [x0]
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L9
	mov	x0, 20544
	movk	x0, 0x3f21, lsl 16
	ldr	w0, [x0]
	strb	w0, [sp, 15]
	ldrb	w0, [sp, 15]
	cmp	w0, 13
	beq	.L10
	ldrb	w0, [sp, 15]
	b	.L11
.L10:
	mov	w0, 10
.L11:
	add	sp, sp, 16
	ret
	.size	uart_getc, .-uart_getc
	.align	2
	.global	uart_puts
	.type	uart_puts, %function
uart_puts:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x0, [sp, 24]
	b	.L14
.L16:
	ldr	x0, [sp, 24]
	ldrb	w0, [x0]
	cmp	w0, 10
	bne	.L15
	mov	w0, 13
	bl	uart_send
.L15:
	ldr	x0, [sp, 24]
	add	x1, x0, 1
	str	x1, [sp, 24]
	ldrb	w0, [x0]
	bl	uart_send
.L14:
	ldr	x0, [sp, 24]
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L16
	nop
	nop
	ldp	x29, x30, [sp], 32
	ret
	.size	uart_puts, .-uart_puts
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103"
