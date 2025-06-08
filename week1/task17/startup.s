.section .text.start    # Define a section for the startup code.
.global _start          # Make _start globally visible as the entry point.

_start:
    la sp, _stack_top       # Initialize the stack pointer (sp) to the top of the stack.
                            # _stack_top is defined in the linker script.
    jal main                # Jump and link to the 'main' function.
                            # 'jal' saves the return address in ra and jumps to main.
    j .                     # Infinite loop: If main returns, jump back to this instruction.
                            # This prevents the program from crashing in a bare-metal environment.

.section .bss               # Define the BSS (Block Started by Symbol) section.
                            # This section is for uninitialized data.
.align 4                    # Align the following data to a 4-byte boundary.
.space 1024                 # Reserve 1024 bytes (1KB) for the stack.
_stack_top:                 # Label for the top of the allocated stack space.
