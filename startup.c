#include <stdint.h> /*For uint32_t etc definitions*/

/* Linker defined variables */
extern const uint32_t __ResetHandlerSectionStart;
extern const uint32_t __StackTop;
extern uint32_t __text_end__;
extern uint32_t __data_start__;
extern uint32_t __data_end__;
extern uint32_t __bss_start__;
extern uint32_t __bss_end__;

extern void main();



uint32_t isr_vector[] __attribute__ ((section (".isr_vector_sec")))  = {(uint32_t)&__StackTop, (uint32_t)&__ResetHandlerSectionStart };


void __attribute__((section (".reset_handler_sec"))) reset_handler(){
   
   // initializing bss value to zero
    for(uint32_t *i=&__bss_start__; i<&__bss_end__;i++){
        *i=0;
    }

    /* Copy init values from text to data */
    uint32_t *init_values_ptr = &__text_end__;
    uint32_t *data_ptr = &__data_start__;

    if (init_values_ptr != data_ptr) {
        while (data_ptr < &__data_end__) {
            *data_ptr++ = *init_values_ptr++;
        }
    }

    main();
    while(1);

}






