/* Linker script to configure memory regions. */
MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x4000    /* 16k */
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 0x0800    /* 2k  */
}

/* Library configurations */
GROUP(libgcc.a libc.a libm.a libnosys.a)

/* Linker script to place sections and symbol values. Should be used together
 * with other linker script that defines memory regions FLASH and RAM.
 * It references following symbols, which must be defined in code:
 *   Reset_Handler : Entry of reset handler
 *
 * It defines following symbols, which code can use without definition:
 *   __exidx_start
 *   __exidx_end
 *   __copy_table_start__
 *   __copy_table_end__
 *   __zero_table_start__
 *   __zero_table_end__
 *   __etext
 *   __data_start__
 *   __preinit_array_start
 *   __preinit_array_end
 *   __init_array_start
 *   __init_array_end
 *   __fini_array_start
 *   __fini_array_end
 *   __data_end__
 *   __bss_start__
 *   __bss_end__
 *   __end__
 *   end
 *   __HeapLimit
 *   __StackLimit
 *   __StackTop
 *   __stack
 *   __Vectors_End
 *   __Vectors_Size
 */
/*ENTRY(Reset_Handler)
*/
ENTRY(reset_handler)

SECTIONS
{
  /* placing my named section at given address: */
  .isr_vector_sec 0x00000000 : ALIGN(2)
  {
    KEEP(*(.isr_vector_sec)) /* keep my variable even if not referenced */
  } > FLASH
  
  .reset_handler_sec 0x00000100 : ALIGN(2)
  {
    KEEP(*(.reset_handler_sec)) /* keep my variable even if not referenced */
  } > FLASH

}