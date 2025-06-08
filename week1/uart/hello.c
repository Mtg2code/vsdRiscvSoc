#include <stdint.h>

#define UART_TX 0x10000000 // UART transmit register for QEMU virt machine
#define UART_READY 0x10000005 // UART status register (bit 5 = TX ready)

void uart_putc(char c) {
    volatile char* uart_tx = (volatile char*)UART_TX;
    volatile char* uart_ready = (volatile char*)UART_READY;
    while (!(*uart_ready & (1 << 5))); // Wait for TXFIFO empty (bit 5)
    *uart_tx = c;
}

void uart_puts(const char* s) {
    while (*s) {
        uart_putc(*s++);
    }
}

uint32_t read_cycle_counter(void) {
    uint32_t cycles;
    __asm__ volatile (
        "rdcycle %0"
        : "=r" (cycles)
        :
        :
    );
    return cycles;
}

void uart_put_num(uint32_t num) {
    if (num == 0) {
        uart_putc('0');
    } else {
        char buf[10];
        int i = 0;
        while (num > 0) {
            buf[i++] = '0' + (num % 10);
            num /= 10;
        }
        while (i > 0) {
            uart_putc(buf[--i]);
        }
    }
}

int main() {
    uint32_t start = read_cycle_counter();
    uart_puts("Milen Week 1 Task 9");
    uart_puts("\n");
    uint32_t end = read_cycle_counter();
    uart_puts("Cycles taken: ");
    uart_put_num(end - start);
    uart_puts("\n");
    return 1;
}
