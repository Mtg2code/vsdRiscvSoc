OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    FLASH (rx) : ORIGIN = 0x80000000, LENGTH = 16M
    RAM (rw)   : ORIGIN = 0x81000000, LENGTH = 16M
}

SECTIONS
{
    . = 0x80000000;

    .text : {
        *(.text.start)
        *(.text)
        *(.text.*)
    } > FLASH

    .rodata : ALIGN(4) {
        *(.rodata)
        *(.rodata.*)
    } > FLASH

    .data : ALIGN(4) {
        *(.data)
        *(.data.*)
    } > RAM AT > FLASH

    .bss : ALIGN(4) {
        *(.bss)
        *(.bss.*)
    } > RAM

    _end = .;
}
