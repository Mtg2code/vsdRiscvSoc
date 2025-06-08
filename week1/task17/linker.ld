OUTPUT_ARCH(riscv)  # Specify the target architecture as RISC-V.
ENTRY(_start)       # Define the entry point of the program as the _start symbol.

MEMORY
{
    # Define memory regions available on the QEMU 'virt' machine.
    # FLASH (read-only, executable) starts at 0x80000000 with a length of 16MB.
    FLASH (rx) : ORIGIN = 0x80000000, LENGTH = 16M
    # RAM (read-write) starts at 0x81000000 with a length of 16MB.
    RAM (rw)   : ORIGIN = 0x81000000, LENGTH = 16M
}

SECTIONS
{
    # Set the current address to the start of FLASH.
    . = 0x80000000;

    # .text section: Contains executable code.
    .text : {
        *(.text.start)  # Place the startup code first.
        *(.text)        # Place standard .text sections.
        *(.text.*)      # Place all other .text subsections.
    } > FLASH           # This section goes into the FLASH memory region.

    # .rodata section: Contains read-only data (e.g., string literals).
    .rodata : ALIGN(4) { # Align to a 4-byte boundary.
        *(.rodata)
        *(.rodata.*)
    } > FLASH           # This section goes into the FLASH memory region.

    # .data section: Contains initialized global/static data.
    .data : ALIGN(4) {  # Align to a 4-byte boundary.
        *(.data)
        *(.data.*)
    } > RAM AT > FLASH  # This section resides in RAM at runtime, but its initial values
                        # are loaded from FLASH (at the end of .rodata in the ELF file).

    # .bss section: Contains uninitialized global/static data.
    # This data will be zero-initialized by the startup code (implicitly by QEMU for this simple example).
    .bss : ALIGN(4) {   # Align to a 4-byte boundary.
        *(.bss)
        *(.bss.*)
    } > RAM             # This section resides in RAM.

    # Define a symbol _end at the current address, marking the end of the sections.
    _end = .;
}
