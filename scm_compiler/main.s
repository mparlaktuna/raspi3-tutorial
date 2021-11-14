	.arch armv8-a
	.file	"main.c"
	.text
	.align	2
	.p2align 4,,11
	.global	is_fixnum
	.type	is_fixnum, %function
is_fixnum:
	tst	x0, 3
	cset	w0, eq
	ret
	.size	is_fixnum, .-is_fixnum
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Hello World!\n"
	.text
	.align	2
	.p2align 4,,11
	.global	test
	.type	test, %function
test:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	b	uart_puts
	.size	test, .-test
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	uart_init
	ldp	x29, x30, [sp], 16
	b	scheme_entry
	.size	main, .-main
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103"
