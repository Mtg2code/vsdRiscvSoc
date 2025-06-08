// Define _start as the entry point
void _start() {
    volatile int x = 42;
    x = x + 1;
    
    // Bare-metal programs need to hang or reset
    while(1); // Infinite loop
}
