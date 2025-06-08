.section .text
.global trap_handler
.align 4
trap_handler:
    # Save registers
    addi sp, sp, -64
    sw ra, 0(sp)
    sw t0, 4(sp)
    sw t1, 8(sp)

    # Check mcause for MTIP (0x80000007)
    csrr t0, mcause
    li t1, 0x80000007
    bne t0, t1, skip

    # Call C handler
    jal timer_handler

skip:
    # Restore registers
    lw ra, 0(sp)
    lw t0, 4(sp)
    lw t1, 8(sp)
    addi sp, sp, 64

    # Return
    mret
