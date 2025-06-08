#define UART_TX 0x10000000    // UART transmit register (QEMU virt)
#define UART_READY 0x10000005 // UART status register (bit 5 = TX ready)
#define MTIME 0x0200bff8      // Machine timer register (QEMU virt CLINT)
#define MTIMECMP 0x02004000   // Machine timer compare register

// Define uint32_t and uint64_t for bare-metal
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;

void uart_putc(char c) {
    volatile char* uart_tx = (volatile char*)UART_TX;
    volatile char* uart_ready = (volatile char*)UART_READY;
    while (!(*uart_ready & (1 << 5))); // Wait for TXFIFO empty
    *uart_tx = c;
}

void uart_puts(const char* s) {
    while (*s) {
        uart_putc(*s++);
    }
}

// Timer interrupt handler
void timer_handler(void) {
    uart_puts("MTIP\n");
    // Clear interrupt
    volatile uint64_t* mtime = (volatile uint64_t*)MTIME;
    volatile uint64_t* mtimecmp = (volatile uint64_t*)MTIMECMP;
    *mtimecmp = *mtime + 1000000; // ~1s interval
}

void enable_timer_interrupt(void) {
    // Set mtimecmp
    volatile uint64_t* mtime = (volatile uint64_t*)MTIME;
    volatile uint64_t* mtimecmp = (volatile uint64_t*)MTIMECMP;
    *mtimecmp = *mtime + 1000000;

    // Enable MTIP (bit 7) in mie
    asm volatile ("li t0, 0x80");
    asm volatile ("csrs mie, t0");

    // Enable global interrupts (MIE, bit 3)
    asm volatile ("csrs mstatus, 0x8");
}

int main() {
    uart_putc('A'); // Debug: program start
    enable_timer_interrupt();
    uart_puts("Timer enabled\n");
    while (1) {
        uart_putc('.');
        for (volatile int i = 0; i < 100000; i++);
    }
    return 0;
}
