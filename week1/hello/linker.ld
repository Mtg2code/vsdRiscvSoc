/* linker.ld - Minimal linker script for RISC-V RV32IMC */
ENTRY(_start)
SECTIONS {
    . = 0x80000000; /* Code starts here */
    .text : {
        *(.text*)
    }
    .data : {
        *(.data*)
    }
    .bss : {
        *(.bss*)
        *(COMMON)
    }
}
