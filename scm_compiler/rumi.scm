	.arch armv8-a
	.file "rumi.s"
	.text
	.align 2
	.p2align 4,,11
	.global scheme_entry
	.type scheme_entry, %function
scheme_entry:
	mov	x0, #4
	bl	is_fixnum
	bl	test_non_zero

	mov	x0, #400
	bl	is_fixnum
	bl	test_non_zero

	mov	x0, #4936
	bl	is_fixnum
	bl	test_non_zero

	mov	x0, #568
	bl	is_fixnum
	bl	test_non_zero

