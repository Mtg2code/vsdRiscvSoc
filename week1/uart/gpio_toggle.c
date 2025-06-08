#define GPIO_OUT 0x10012000   // GPIO output register (verify for SCL180 PDK)
#define UART_TX 0x10000000    // UART transmit register for QEMU virt
#define UART_READY 0x10000005 // UART status register (bit 5 = TX ready)

// Define uint32_t for bare-metal (since -nostdlib)
typedef unsigned int uint32_t;

void uart_putc(char c) {
    volatile char* uart_tx = (volatile char*)UART_TX;
    volatile char* uart_ready = (volatile char*)UART_READY;
    while (!(*uart_ready & (1 << 5))); // Bit 5 = TXFIFO empty
    *uart_tx = c;
}

void uart_puts(const char* s) {
    while (*s) {
        uart_putc(*s++);
    }
}

void gpio_toggle(void) {
    volatile uint32_t* gpio_out = (volatile uint32_t*)GPIO_OUT;
    *gpio_out |= (1 << 0);  // Set bit 0 (GPIO on)
    *gpio_out &= ~(1 << 0); // Clear bit 0 (GPIO off)
}

int main() {
    uart_puts("GPIO Toggled\n"); // Print before toggle
    gpio_toggle();
    uart_putc('B'); // Debug: after gpio_toggle
    while (1) {
        uart_putc('.'); // Print dots to confirm running
        for (volatile int i = 0; i < 100000; i++); // Delay
    }
    return 0;
}
