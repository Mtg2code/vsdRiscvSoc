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
.LVL0:
	.loc 1 5 5
	.loc 1 6 5
	.loc 1 7 5
	.loc 1 7 14 is_stmt 0 discriminator 1
	li	a4,268435456
	addi	a4,a4,5
	li	a3,268435456
.L2:
	.loc 1 7 12 is_stmt 1 discriminator 1
	.loc 1 7 14 is_stmt 0 discriminator 1
	lbu	a5,0(a4)
	.loc 1 7 12 discriminator 1
	andi	a5,a5,32
	beq	a5,zero,.L2
	.loc 1 8 5 is_stmt 1
	.loc 1 8 14 is_stmt 0
	sb	a0,0(a3)
	.loc 1 9 1
	ret
	.cfi_endproc
.LFE0:
	.size	uart_putc, .-uart_putc
	.align	2
	.globl	uart_puts
	.type	uart_puts, @function
uart_puts:
.LFB1:
	.loc 1 11 31 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 12 5
	.loc 1 12 12
	lbu	a3,0(a0)
	beq	a3,zero,.L6
.LBB9:
.LBB10:
	.loc 1 7 14 is_stmt 0 discriminator 1
	li	a4,268435456
	addi	a4,a4,5
	li	a2,268435456
.L9:
.LBE10:
.LBE9:
	.loc 1 13 9 is_stmt 1
	.loc 1 13 21 is_stmt 0
	addi	a0,a0,1
.LVL2:
.LBB12:
.LBB11:
	.loc 1 5 5 is_stmt 1
	.loc 1 6 5
	.loc 1 7 5
.L8:
	.loc 1 7 12 discriminator 1
	.loc 1 7 14 is_stmt 0 discriminator 1
	lbu	a5,0(a4)
	.loc 1 7 12 discriminator 1
	andi	a5,a5,32
	beq	a5,zero,.L8
	.loc 1 8 5 is_stmt 1
	.loc 1 8 14 is_stmt 0
	sb	a3,0(a2)
.LVL3:
.LBE11:
.LBE12:
	.loc 1 12 12 is_stmt 1
	lbu	a3,0(a0)
	bne	a3,zero,.L9
.LVL4:
.L6:
	.loc 1 15 1 is_stmt 0
	ret
	.cfi_endproc
.LFE1:
	.size	uart_puts, .-uart_puts
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Milen RISC-V"
	.align	2
.LC1:
	.string	"Test Value :  "
	.align	2
.LC2:
	.string	"\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 17 12 is_stmt 1
	.cfi_startproc
	.loc 1 18 5
	.loc 1 17 12 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 18 18
	li	a5,100
	sw	a5,0(sp)
	.loc 1 19 5 is_stmt 1
	.loc 1 19 11 is_stmt 0
	lw	a5,0(sp)
	.loc 1 20 5
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	.loc 1 19 11
	addi	a5,a5,1
	.loc 1 19 7
	sw	a5,0(sp)
	.loc 1 20 5 is_stmt 1
	.loc 1 17 12 is_stmt 0
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 20 5
	call	uart_puts
.LVL5:
	.loc 1 21 5 is_stmt 1
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	uart_puts
.LVL6:
	.loc 1 23 5
	.loc 1 23 11 is_stmt 0
	lw	a5,0(sp)
	.loc 1 23 8
	bne	a5,zero,.L33
.LBB13:
.LBB14:
	.loc 1 7 14 discriminator 1
	li	a4,268435456
	addi	a4,a4,5
	li	a3,268435456
.L17:
	.loc 1 7 12 is_stmt 1 discriminator 1
	.loc 1 7 14 is_stmt 0 discriminator 1
	lbu	a5,0(a4)
	.loc 1 7 12 discriminator 1
	andi	a5,a5,32
	beq	a5,zero,.L17
	.loc 1 8 5 is_stmt 1
	.loc 1 8 14 is_stmt 0
	li	a5,48
	sb	a5,0(a3)
.L20:
.LBE14:
.LBE13:
	.loc 1 36 5 is_stmt 1
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	uart_puts
.LVL7:
	.loc 1 37 5
	.loc 1 38 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	.loc 1 37 12
	lw	a0,0(sp)
	.loc 1 38 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L33:
	.cfi_restore_state
.LVL8:
.LBB15:
	.loc 1 28 18 is_stmt 1
	lw	a5,0(sp)
	.loc 1 29 33 is_stmt 0
	li	a6,1717985280
	addi	a6,a6,1639
	.loc 1 27 13
	li	a0,0
	addi	a7,sp,4
	.loc 1 28 18
	ble	a5,zero,.L20
.LVL9:
.L18:
	.loc 1 29 13 is_stmt 1
	.loc 1 29 33 is_stmt 0
	lw	a4,0(sp)
	.loc 1 30 15
	lw	a5,0(sp)
	.loc 1 29 18
	addi	a0,a0,1
.LVL10:
	.loc 1 29 33
	mulh	a3,a4,a6
	.loc 1 30 15
	srai	t1,a5,31
	.loc 1 29 33
	srai	a1,a4,31
	.loc 1 29 22
	add	a2,a7,a0
	.loc 1 30 15
	mulh	a5,a5,a6
	.loc 1 29 33
	srai	a3,a3,2
	sub	a3,a3,a1
	slli	a1,a3,2
	add	a3,a1,a3
	slli	a3,a3,1
	sub	a4,a4,a3
	.loc 1 29 28
	addi	a4,a4,48
	.loc 1 29 22
	sb	a4,-1(a2)
	.loc 1 30 13 is_stmt 1
	.loc 1 30 15 is_stmt 0
	srai	a5,a5,2
	sub	a5,a5,t1
	sw	a5,0(sp)
	.loc 1 28 18 is_stmt 1
	lw	a5,0(sp)
	bgt	a5,zero,.L18
.LBB16:
.LBB17:
	.loc 1 7 14 is_stmt 0 discriminator 1
	li	a4,268435456
	mv	a3,a2
	addi	a4,a4,5
	li	a1,268435456
.LVL11:
.L23:
.LBE17:
.LBE16:
	.loc 1 33 13 is_stmt 1
	lbu	a2,-1(a3)
.LVL12:
.LBB19:
.LBB18:
	.loc 1 5 5
	.loc 1 6 5
	.loc 1 7 5
.L22:
	.loc 1 7 12 discriminator 1
	.loc 1 7 14 is_stmt 0 discriminator 1
	lbu	a5,0(a4)
	.loc 1 7 12 discriminator 1
	andi	a5,a5,32
	beq	a5,zero,.L22
	.loc 1 8 5 is_stmt 1
	.loc 1 8 14 is_stmt 0
	sb	a2,0(a1)
.LVL13:
.LBE18:
.LBE19:
	.loc 1 32 18 is_stmt 1
	addi	a3,a3,-1
.LVL14:
	bne	a7,a3,.L23
	j	.L20
.LBE15:
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1f3
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xe
	.4byte	.LASF8
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL8
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0xf
	.4byte	.LASF4
	.byte	0x1
	.byte	0x11
	.byte	0x5
	.4byte	0x10d
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10d
	.uleb128 0x3
	.string	"x"
	.byte	0x12
	.byte	0x12
	.4byte	0x114
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.4byte	0xa7
	.uleb128 0x3
	.string	"buf"
	.byte	0x1a
	.byte	0xe
	.4byte	0x119
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.string	"i"
	.byte	0x1
	.byte	0x1b
	.byte	0xd
	.4byte	0x10d
	.4byte	.LLST5
	.uleb128 0x4
	.4byte	0x19c
	.4byte	.LBB16
	.4byte	.LLRL6
	.byte	0x21
	.byte	0xd
	.uleb128 0x5
	.4byte	0x1a9
	.4byte	.LLST7
	.uleb128 0x6
	.4byte	.LLRL6
	.uleb128 0x1
	.4byte	0x1b3
	.4byte	0x10000000
	.uleb128 0x1
	.4byte	0x1bd
	.4byte	0x10000005
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x19c
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.byte	0x1
	.byte	0x18
	.byte	0x9
	.4byte	0xcb
	.uleb128 0x13
	.4byte	0x1a9
	.uleb128 0x7
	.4byte	0x1b3
	.uleb128 0x7
	.4byte	0x1bd
	.byte	0
	.uleb128 0x8
	.4byte	.LVL5
	.4byte	0x141
	.4byte	0xe2
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x8
	.4byte	.LVL6
	.4byte	0x141
	.4byte	0xf9
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x14
	.4byte	.LVL7
	.4byte	0x141
	.uleb128 0x2
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.4byte	0x10d
	.uleb128 0x16
	.4byte	0x130
	.4byte	0x129
	.uleb128 0x17
	.4byte	0x129
	.byte	0x9
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x18
	.4byte	0x130
	.uleb128 0x9
	.4byte	0x130
	.uleb128 0x19
	.4byte	.LASF5
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x197
	.uleb128 0x1a
	.string	"s"
	.byte	0x1
	.byte	0xb
	.byte	0x1c
	.4byte	0x197
	.4byte	.LLST0
	.uleb128 0x4
	.4byte	0x19c
	.4byte	.LBB9
	.4byte	.LLRL1
	.byte	0xd
	.byte	0x9
	.uleb128 0x5
	.4byte	0x1a9
	.4byte	.LLST2
	.uleb128 0x6
	.4byte	.LLRL1
	.uleb128 0xb
	.4byte	0x1b3
	.4byte	.LLST3
	.uleb128 0xb
	.4byte	0x1bd
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x137
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.byte	0x1
	.4byte	0x1c8
	.uleb128 0x1c
	.string	"c"
	.byte	0x1
	.byte	0x4
	.byte	0x15
	.4byte	0x130
	.uleb128 0xd
	.4byte	.LASF6
	.byte	0x5
	.4byte	0x1c8
	.uleb128 0xd
	.4byte	.LASF7
	.byte	0x6
	.4byte	0x1c8
	.byte	0
	.uleb128 0xc
	.4byte	0x13c
	.uleb128 0x1d
	.4byte	0x19c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	0x1a9
	.uleb128 0x1
	.byte	0x5a
	.uleb128 0x1
	.4byte	0x1b3
	.4byte	0x10000000
	.uleb128 0x1
	.4byte	0x1bd
	.4byte	0x10000005
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST5:
	.byte	0x6
	.4byte	.LVL8
	.byte	0x4
	.uleb128 .LVL8-.LVL8
	.uleb128 .LVL9-.LVL8
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL9-.LVL8
	.uleb128 .LVL11-.LVL8
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL11-.LVL8
	.uleb128 .LVL14-.LVL8
	.uleb128 0x8
	.byte	0x7d
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1b
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL14-.LVL8
	.uleb128 .LFE2-.LVL8
	.uleb128 0x8
	.byte	0x7d
	.sleb128 0
	.byte	0x91
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1c
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x8
	.4byte	.LVL12
	.uleb128 .LVL13-.LVL12
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LLST0:
	.byte	0x6
	.4byte	.LVL1
	.byte	0x4
	.uleb128 .LVL1-.LVL1
	.uleb128 .LVL2-.LVL1
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL2-.LVL1
	.uleb128 .LFE1-.LVL1
	.uleb128 0x1
	.byte	0x5a
	.byte	0
.LLST2:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL3-.LVL2
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LLST3:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL4-.LVL2
	.uleb128 0x4
	.byte	0x40
	.byte	0x48
	.byte	0x24
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL4-.LVL2
	.uleb128 0x6
	.byte	0xc
	.4byte	0x10000005
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL1:
	.byte	0x5
	.4byte	.LBB9
	.byte	0x4
	.uleb128 .LBB9-.LBB9
	.uleb128 .LBE9-.LBB9
	.byte	0x4
	.uleb128 .LBB12-.LBB9
	.uleb128 .LBE12-.LBB9
	.byte	0
.LLRL6:
	.byte	0x5
	.4byte	.LBB16
	.byte	0x4
	.uleb128 .LBB16-.LBB16
	.uleb128 .LBE16-.LBB16
	.byte	0x4
	.uleb128 .LBB19-.LBB16
	.uleb128 .LBE19-.LBB16
	.byte	0
.LLRL8:
	.byte	0x7
	.4byte	.Ltext0
	.uleb128 .Letext0-.Ltext0
	.byte	0x7
	.4byte	.LFB2
	.uleb128 .LFE2-.LFB2
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF7:
	.string	"uart_ready"
.LASF3:
	.string	"char"
.LASF9:
	.string	"uart_putc"
.LASF6:
	.string	"uart_tx"
.LASF4:
	.string	"main"
.LASF8:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -misa-spec=20191213 -march=rv32im -g -O2"
.LASF5:
	.string	"uart_puts"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/thomas/risc/project/week1/uart"
.LASF0:
	.string	"hello.c"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
