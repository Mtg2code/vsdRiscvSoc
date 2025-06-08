	.file	"hello.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/thomas/risc/project/week1/uart" "hello.c"
	.align	2
	.globl	uart_putc
	.type	uart_putc, @function
uart_putc:
.LFB0:
	.file 1 "hello.c"
	.loc 1 4 24
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-33(s0)
	.loc 1 5 20
	li	a5,268435456
	sw	a5,-20(s0)
	.loc 1 6 20
	li	a5,268435456
	addi	a5,a5,5
	sw	a5,-24(s0)
	.loc 1 7 11
	nop
.L2:
	.loc 1 7 14 discriminator 1
	lw	a5,-24(s0)
	lbu	a5,0(a5)
	andi	a5,a5,0xff
	.loc 1 7 26 discriminator 1
	andi	a5,a5,32
	.loc 1 7 12 discriminator 1
	beq	a5,zero,.L2
	.loc 1 8 14
	lw	a5,-20(s0)
	lbu	a4,-33(s0)
	sb	a4,0(a5)
	.loc 1 9 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	uart_putc, .-uart_putc
	.align	2
	.globl	uart_puts
	.type	uart_puts, @function
uart_puts:
.LFB1:
	.loc 1 11 31
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 1 12 11
	j	.L4
.L5:
	.loc 1 13 21
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 1 13 9
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_putc
.L4:
	.loc 1 12 12
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L5
	.loc 1 15 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	uart_puts, .-uart_puts
	.section	.rodata
	.align	2
.LC0:
	.string	"Milen RISC-V"
	.align	2
.LC1:
	.string	"Test Value :  "
	.align	2
.LC2:
	.string	"\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 17 12
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 18 18
	li	a5,100
	sw	a5,-24(s0)
	.loc 1 19 11
	lw	a5,-24(s0)
	addi	a5,a5,1
	.loc 1 19 7
	sw	a5,-24(s0)
	.loc 1 20 5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	uart_puts
	.loc 1 21 5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	uart_puts
	.loc 1 23 11
	lw	a5,-24(s0)
	.loc 1 23 8
	bne	a5,zero,.L7
	.loc 1 24 9
	li	a0,48
	call	uart_putc
	j	.L8
.L7:
.LBB2:
	.loc 1 27 13
	sw	zero,-20(s0)
	.loc 1 28 15
	j	.L9
.L10:
	.loc 1 29 33
	lw	a4,-24(s0)
	li	a5,1717985280
	addi	a5,a5,1639
	mulh	a5,a4,a5
	srai	a3,a5,2
	srai	a5,a4,31
	sub	a3,a3,a5
	mv	a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	slli	a5,a5,1
	sub	a3,a4,a5
	.loc 1 29 28
	andi	a4,a3,0xff
	.loc 1 29 18
	lw	a5,-20(s0)
	addi	a3,a5,1
	sw	a3,-20(s0)
	.loc 1 29 28
	addi	a4,a4,48
	andi	a4,a4,0xff
	.loc 1 29 22
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-20(a5)
	.loc 1 30 15
	lw	a5,-24(s0)
	li	a4,1717985280
	addi	a4,a4,1639
	mulh	a4,a5,a4
	srai	a4,a4,2
	srai	a5,a5,31
	sub	a5,a4,a5
	sw	a5,-24(s0)
.L9:
	.loc 1 28 18
	lw	a5,-24(s0)
	bgt	a5,zero,.L10
	.loc 1 32 15
	j	.L11
.L12:
	.loc 1 33 13
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-20(a5)
	mv	a0,a5
	call	uart_putc
.L11:
	.loc 1 32 18
	lw	a5,-20(s0)
	bgt	a5,zero,.L12
.L8:
.LBE2:
	.loc 1 36 5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	uart_puts
	.loc 1 37 12
	lw	a5,-24(s0)
	.loc 1 38 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x10c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x8
	.4byte	.LASF4
	.byte	0x1
	.byte	0x11
	.byte	0x5
	.4byte	0x71
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x71
	.uleb128 0x1
	.string	"x"
	.byte	0x12
	.byte	0x12
	.4byte	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1
	.string	"buf"
	.byte	0x1a
	.byte	0xe
	.4byte	0x7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.string	"i"
	.byte	0x1b
	.byte	0xd
	.4byte	0x71
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.4byte	0x71
	.uleb128 0xb
	.4byte	0x94
	.4byte	0x8d
	.uleb128 0xc
	.4byte	0x8d
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0xd
	.4byte	0x94
	.uleb128 0x2
	.4byte	0x94
	.uleb128 0xe
	.4byte	.LASF5
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc8
	.uleb128 0x4
	.string	"s"
	.byte	0xb
	.byte	0x1c
	.4byte	0xc8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.4byte	0x9b
	.uleb128 0xf
	.4byte	.LASF6
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a
	.uleb128 0x4
	.string	"c"
	.byte	0x4
	.byte	0x15
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x5
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x6
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.4byte	0xa0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 20
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF8:
	.string	"uart_ready"
.LASF3:
	.string	"char"
.LASF6:
	.string	"uart_putc"
.LASF7:
	.string	"uart_tx"
.LASF4:
	.string	"main"
.LASF9:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -misa-spec=20191213 -march=rv32im -g -O0"
.LASF5:
	.string	"uart_puts"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/thomas/risc/project/week1/uart"
.LASF0:
	.string	"hello.c"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
