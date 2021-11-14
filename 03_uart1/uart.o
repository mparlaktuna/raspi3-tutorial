	.arch armv8-a
	.file	"uart.c"
	.text
	.align	2
	.p2align 4,,11
	.global	uart_init
	.type	uart_init, %function
uart_init:
	mov	x1, 20484
	mov	x7, 20576
	movk	x1, 0x3f21, lsl 16
	movk	x7, 0x3f21, lsl 16
	mov	x4, 20556
	mov	x5, 20560
	ldr	w0, [x1]
	movk	x4, 0x3f21, lsl 16
	movk	x5, 0x3f21, lsl 16
	mov	x2, 20548
	orr	w0, w0, 1
	str	w0, [x1]
	str	wzr, [x7]
	movk	x2, 0x3f21, lsl 16
	mov	w6, 3
	mov	x3, 20552
	str	w6, [x4]
	movk	x3, 0x3f21, lsl 16
	mov	x0, 20584
	str	wzr, [x5]
	movk	x0, 0x3f21, lsl 16
	str	wzr, [x2]
	mov	w4, 198
	mov	x2, 4
	str	w4, [x3]
	mov	w1, 270
	movk	x2, 0x3f20, lsl 16
	str	w1, [x0]
	mov	x3, 148
	mov	w4, 8192
	ldr	w1, [x2]
	movk	x3, 0x3f20, lsl 16
	movk	w4, 0x1, lsl 16
	mov	w0, 150
	and	w1, w1, -258049
	orr	w1, w1, w4
	str	w1, [x2]
	str	wzr, [x3]
	.p2align 3,,7
.L2:
	// Start of user assembly
// 63 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	subs	w0, w0, #1
	bne	.L2
	mov	x1, 152
	mov	w2, 49152
	movk	x1, 0x3f20, lsl 16
	mov	w0, 150
	str	w2, [x1]
	.p2align 3,,7
.L3:
	// Start of user assembly
// 65 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	subs	w0, w0, #1
	bne	.L3
	mov	x2, 152
	mov	x0, 20576
	movk	x2, 0x3f20, lsl 16
	movk	x0, 0x3f21, lsl 16
	mov	w1, 3
	str	wzr, [x2]
	str	w1, [x0]
	ret
	.size	uart_init, .-uart_init
	.align	2
	.p2align 4,,11
	.global	uart_send
	.type	uart_send, %function
uart_send:
	mov	x2, 20564
	movk	x2, 0x3f21, lsl 16
	.p2align 3,,7
.L8:
	// Start of user assembly
// 75 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	ldr	w1, [x2]
	tbz	x1, 5, .L8
	mov	x1, 20544
	movk	x1, 0x3f21, lsl 16
	str	w0, [x1]
	ret
	.size	uart_send, .-uart_send
	.align	2
	.p2align 4,,11
	.global	uart_getc
	.type	uart_getc, %function
uart_getc:
	mov	x1, 20564
	movk	x1, 0x3f21, lsl 16
	.p2align 3,,7
.L12:
	// Start of user assembly
// 86 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	ldr	w0, [x1]
	tbz	x0, 0, .L12
	mov	x0, 20544
	mov	w1, 10
	movk	x0, 0x3f21, lsl 16
	ldr	w0, [x0]
	and	w0, w0, 255
	cmp	w0, 13
	csel	w0, w0, w1, ne
	ret
	.size	uart_getc, .-uart_getc
	.align	2
	.p2align 4,,11
	.global	uart_puts
	.type	uart_puts, %function
uart_puts:
	ldrb	w1, [x0]
	cbz	w1, .L16
	mov	x2, 20564
	mov	x4, 20544
	movk	x2, 0x3f21, lsl 16
	movk	x4, 0x3f21, lsl 16
	mov	w5, 13
	.p2align 3,,7
.L21:
	cmp	w1, 10
	beq	.L19
.L18:
	ldrb	w3, [x0], 1
	.p2align 3,,7
.L20:
	// Start of user assembly
// 75 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	ldr	w1, [x2]
	tbz	x1, 5, .L20
	str	w3, [x4]
	ldrb	w1, [x0]
	cbnz	w1, .L21
.L16:
	ret
	.p2align 2,,3
.L19:
	// Start of user assembly
// 75 "uart.c" 1
	nop
// 0 "" 2
	// End of user assembly
	ldr	w1, [x2]
	tbz	x1, 5, .L19
	str	w5, [x4]
	b	.L18
	.size	uart_puts, .-uart_puts
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103"
