#define UART_TX 0x10000000    // UART transmit register (QEMU virt)
#define UART_READY 0x10000005 // UART status register (bit 5 = TX ready)

// Define uint32_t for bare-metal
typedef unsigned int uint32_t;

// Shared counter and mutex
volatile uint32_t shared_counter = 0;
volatile uint32_t mutex = 0; // 0 = unlocked, 1 = locked

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

// Mutex lock using lr.w/sc.w
int mutex_lock(volatile uint32_t* mutex) {
    uint32_t tmp;
    do {
        // Load-reserved
        asm volatile ("lr.w %0, (%1)" : "=r"(tmp) : "r"(mutex));
        if (tmp != 0) continue; // Mutex already locked, retry
        // Store-conditional (try to set mutex to 1)
        asm volatile ("sc.w %0, %2, (%1)" : "=r"(tmp) : "r"(mutex), "r"(1));
    } while (tmp != 0); // Retry if sc.w failed
    return 0;
}

// Mutex unlock
void mutex_unlock(volatile uint32_t* mutex) {
    *mutex = 0; // Non-atomic write is safe as lock holder
}

// Thread 1: Increment counter in critical section
void thread1(void) {
    mutex_lock(&mutex);
    uart_puts("T1: Enter critical section\n");
    shared_counter++;
    uart_puts("T1: Counter = ");
    uart_putc('0' + shared_counter);
    uart_putc('\n');
    mutex_unlock(&mutex);
    uart_puts("T1: Exit critical section\n");
}

// Thread 2: Same as Thread 1
void thread2(void) {
    mutex_lock(&mutex);
    uart_puts("T2: Enter critical section\n");
    shared_counter++;
    uart_puts("T2: Counter = ");
    uart_putc('0' + shared_counter);
    uart_putc('\n');
    mutex_unlock(&mutex);
    uart_puts("T2: Exit critical section\n");
}

int main() {
    uart_putc('A'); // Debug: program start
    uart_puts("Starting threads\n");

    // Simulate two threads by interleaving
    thread1(); // T1 runs first
    thread2(); // T2 runs second
    thread1(); // T1 again
    thread2(); // T2 again

    uart_puts("Done\n");
    while (1) {
        uart_putc('.'); // Show running
        for (volatile int i = 0; i < 100000; i++);
    }
    return 0;
}
