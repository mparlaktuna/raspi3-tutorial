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

	mov	x0, 111
	bl	is_fixnum
	bl	test_zero

	mov	x0, 111
	bl	is_true
	bl	test_non_zero

	mov	x0, 47
	bl	is_true
	bl	test_zero

	mov	x0, 47
	bl	is_false
	bl	test_non_zero

	mov	x0, 111
	bl	is_false
	bl	test_zero

	mov	x0, 63
	bl	is_null
	bl	test_non_zero

	mov	x0, #20
	bl	is_null
	bl	test_zero

	mov	x0, #25359
	bl	is_null
	bl	test_zero

	mov	x0, #25359
	bl	is_char
	bl	test_non_zero

	mov	x0, #4
	bl	is_char
	bl	test_zero

	mov	x0, #4
	bl	is_char
	bl	test_non_zero

