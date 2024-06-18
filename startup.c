#include <stdint.h> /*For uint32_t etc definitions*/

/* Linker defined variables */
extern const uint32_t __ResetHandlerSectionStart;
extern const uint32_t __StackTop;

uint32_t isr_vector[] __attribute__ ((section (".isr_vector_sec")))  = {(uint32_t)&__StackTop, (uint32_t)&__ResetHandlerSectionStart };



void __attribute__((section (".reset_handler_sec"))) reset_handler(){
   uint32_t i = 0;
   uint32_t j = 2;
   while(1){
        i++;
        j = j+i;
   }

}





