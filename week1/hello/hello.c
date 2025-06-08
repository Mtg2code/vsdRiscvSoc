// hello.c
int main() {
    volatile char *uart = (char *)0x10000000; // Memory-mapped UART address
    const char *msg = "Hello, World!\n";

    while (*msg) {
        *uart = *msg++; // Write each character to UART
    }
    return 0;
}

// Minimal _start (no C runtime)
void _start() {
    main();
    while (1); // Trap CPU after main returns
}
