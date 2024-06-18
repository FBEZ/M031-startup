/* Linker script to configure memory regions. */
MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x4000    /* 16k */
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 0x0800    /* 2k  */
}

ENTRY(reset_handler)

SECTIONS
{
  .isr_vector_sec 0x00000000 : ALIGN(2)
  {
    KEEP(*(.isr_vector_sec)) /* keep my variable even if not referenced */
  } > FLASH
  __ResetHandlerSectionStart = .;
  .reset_handler_sec : ALIGN(2)
  {
    KEEP(*(.reset_handler_sec)) /* keep my variable even if not referenced */
  } > FLASH
  __StackTop = ORIGIN(RAM) + LENGTH(RAM);
}