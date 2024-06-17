unsigned long isr_vector[4] __attribute__ ((section (".isr_vector_sec")))  = {0x20000100, 0x00000100,0x00000201,0x00000302};


void __attribute__((section (".reset_handler_sec"))) __attribute__((naked)) reset_handler(){
    __asm__(
        "loop: \n\t ADD R0, R0, #1 \n\t ADD R1, R1, #5\n\t b loop\n\t"
    );
}




