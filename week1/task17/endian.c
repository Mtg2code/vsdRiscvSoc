#include <stdint.h> // For uint32_t and uint8_t

// --- UART Register Definitions for QEMU virt machine ---
// UART Transmit Register: Writing a byte here sends it over UART.
#define UART_TX 0x10000000
// UART Status Register: Bit 5 indicates if the transmit FIFO is empty and ready for a new character.
#define UART_READY 0x10000005

// --- Custom UART Functions ---

// Sends a single character over UART.
// It waits until the UART's transmit FIFO is empty before writing the character.
void uart_putc(char c) {
    volatile char* uart_tx = (volatile char*)UART_TX;
    volatile char* uart_ready = (volatile char*)UART_READY;
    // Wait until the 5th bit (TXFIFO empty) of the UART status register is set.
    while (!(*uart_ready & (1 << 5)));
    *uart_tx = c; // Write the character to the transmit register.
}

// Sends a null-terminated string over UART.
// It iterates through the string, sending each character using uart_putc.
void uart_puts(const char* s) {
    while (*s) { // Loop until the null terminator is reached.
        uart_putc(*s++); // Send the current character and move to the next.
    }
}

// --- Helper Functions for Printing Numbers ---

// Prints a single byte in hexadecimal format (e.g., 0x0A).
void uart_put_hex_byte(uint8_t byte) {
    char hex_digits[] = "0123456789ABCDEF"; // Hexadecimal digit characters.
    uart_putc('0');
    uart_putc('x');
    // Get the upper 4 bits and print the corresponding hex digit.
    uart_putc(hex_digits[(byte >> 4) & 0xF]);
    // Get the lower 4 bits and print the corresponding hex digit.
    uart_putc(hex_digits[byte & 0xF]);
}

// Prints a 32-bit unsigned integer in hexadecimal format (e.g., 0x01020304).
void uart_put_hex_u32(uint32_t val) {
    char hex_digits[] = "0123456789ABCDEF"; // Hexadecimal digit characters.
    uart_putc('0');
    uart_putc('x');
    // Iterate from the most significant hex digit to the least significant.
    // A 32-bit value has 8 hex digits (4 bits per digit).
    for (int i = 7; i >= 0; i--) {
        uart_putc(hex_digits[(val >> (i * 4)) & 0xF]);
    }
}

// Converts and prints an integer to a string in decimal format.
void uart_put_int(int num) {
    if (num == 0) { // Handle the special case for zero.
        uart_putc('0');
        return;
    }

    char buf[12]; // Buffer to store the digits (max 10 for 32-bit int + sign + null).
    int i = 0;
    int is_negative = 0;

    if (num < 0) {
        is_negative = 1;
        num = -num; // Work with a positive number for conversion.
    }

    // Convert digits to characters in reverse order.
    while (num > 0) {
        buf[i++] = '0' + (num % 10); // Get the last digit and convert to char.
        num /= 10; // Remove the last digit.
    }

    if (is_negative) {
        uart_putc('-'); // Print the negative sign if applicable.
    }

    // Print digits in the correct order (reverse of how they were stored in buf).
    while (i > 0) {
        uart_putc(buf[--i]);
    }
}

// --- Main Program Entry Point ---
int main() {
    // --- Basic Test: Printing an integer ---
    volatile int x = 42; // Declare a volatile integer (prevents compiler optimizations).
    x = x + 1;           // Increment the value.

    uart_puts("--------------------------------\n");
    uart_puts("Bare-metal RISC-V Application\n");
    uart_puts("Value of x: ");
    uart_put_int(x); // Print the value of x.
    uart_puts("\n");
    uart_puts("--------------------------------\n\n");

    // --- Endianness Check Using a Union ---
    union {
        uint32_t value;   // A 32-bit unsigned integer.
        uint8_t bytes[4]; // An array of 4 8-bit unsigned integers (bytes).
    } endian_check;

    // Store the hexadecimal value 0x01020304.
    // 0x01 is the most significant byte, 0x04 is the least significant byte.
    endian_check.value = 0x01020304;

    uart_puts("Verifying Byte Ordering (Endianness):\n");
    uart_puts("Value stored: ");
    uart_put_hex_u32(endian_check.value); // Print the full 32-bit value.
    uart_puts("\n");

    uart_puts("Bytes in memory (from lowest to highest address):\n");
    // Iterate through the bytes array to see how the individual bytes are stored.
    for (int i = 0; i < 4; i++) {
        uart_puts("Byte ");
        uart_put_int(i); // Print the byte index.
        uart_puts(": ");
        uart_put_hex_byte(endian_check.bytes[i]); // Print the byte value in hex.
        uart_puts("\n");
    }

    // Determine and print the endianness based on the first byte.
    if (endian_check.bytes[0] == 0x04) {
        uart_puts("\nThis system is Little-Endian.\n");
        uart_puts("The least significant byte (0x04) is stored at the lowest memory address.\n");
    } else if (endian_check.bytes[0] == 0x01) {
        uart_puts("\nThis system is Big-Endian.\n");
        uart_puts("The most significant byte (0x01) is stored at the lowest memory address.\n");
    } else {
        uart_puts("\nCould not determine endianness (unexpected byte order).\n");
    }

    // --- Program Loop ---
    // In a bare-metal environment, `main` typically doesn't return to an OS.
    // An infinite loop prevents the program from "falling off the end" and crashing.
    while (1) {
        // This loop keeps the program active after completing its tasks.
        // In a real application, this would contain the main system loop.
    }

    // This return statement is technically unreachable due to the while(1) loop,
    // but included for completeness if the loop were to be removed.
    return 0;
}
