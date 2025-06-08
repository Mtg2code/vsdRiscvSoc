.section .text.start
.global _start
_start:
    # Initialize stack pointer
    la sp, _stack_top

    # Early UART output
    li t0, 0x10000005
    li t1, 0x20  # Bit 5
wait_uart:
    lb t2, 0(t0)
    and t2, t2, t1
    beq t2, zero, wait_uart
    li t0, 0x10000000
    li t1, 'S'   # Print 'S'
    sb t1, 0(t0)

    # Jump to main
    jal main
    j .

.section .bss
.align 4
.space 1024
_stack_top:
