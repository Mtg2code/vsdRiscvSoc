.section .text.start
.global _start
_start:
    la sp, _stack_top      # Initialize stack pointer
    jal main               # Call main
    j .                    # Infinite loop after main returns
.section .bss
.align 4
.space 1024                # Reserve 1KB for stack
_stack_top:
