/* Linker script to configure memory regions. */
MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x4000    /* 16k */
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 0x0800    /* 2k  */
}

ENTRY(reset_handler)

SECTIONS
{
  .text 0x00000000 :
	{
		KEEP(*(.isr_vector_sec))
		__ResetHandlerSectionStart = .;
    	KEEP(*(.reset_handler_sec))
		*(.text*)
		KEEP(*(.init))
		KEEP(*(.fini))
		*(.rodata*)
	} > FLASH

	__etext = .;
	__text_end__ = .;
	.data : AT (__etext)
	{
		__data_start__ = .;
		*(vtable)
		*(.data*)
		__data_end__ = .;
	}> RAM
	.bss :
	{
		. = ALIGN(4);
		__bss_start__ = .;
		*(.bss*)
		*(COMMON)
		. = ALIGN(4);
		__bss_end__ = .;
	} > RAM

  __StackTop = ORIGIN(RAM) + LENGTH(RAM);
}