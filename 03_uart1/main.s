	.arch armv8-a
	.file	"main.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Hello World!\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	uart_init
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	uart_puts
.L2:
	bl	uart_getc
	and	w0, w0, 255
	bl	uart_send
	b	.L2
	.size	main, .-main
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103"
