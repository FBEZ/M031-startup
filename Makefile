include ./makefile.conf
NAME=project

#STARTUP_DEFS=-D__STARTUP_CLEAR_BSS -D__START=main

# Need following option for LTO as LTO will treat retarget functions as
# unused without following option
CFLAGS += -fno-builtin 
CFLAGS += -D ARM_MATH_CM$(CORTEX_M)

LDSCRIPTS=-L. -T gcc_arm.ld

LFLAGS=$(USE_NANO) $(USE_NOHOST) $(LDSCRIPTS) $(GC) $(MAP) 

$(NAME): startup.o main.o
	$(CC) *.o $(CFLAGS) $(LFLAGS)  -g -o $@.elf 
# $(STARTUP)

# startup.s: startup.c
# 	$(CC) $^ $(CFLAGS) $(LFLAGS) -S 
startup.o: startup.c
	$(CC) $^ $(CFLAGS) $(LFLAGS) -c -o startup.o -g
main.o: main.c 
	$(CC) $^ $(CFLAGS) $(LFLAGS) -c -o $@ -g

.PHONY: clean debug flash 
# flash:
# 	openocd -f ../scripts/interface/nulink.cfg -f ../scripts/target/numicroM$(CORTEX_M).cfg -c "init" -c "reset halt" -c "flash write_image erase Objects/$(NAME).bin 0x00000000" -c "reset" -c "exit"

clean:
	rm *.o 
	rm *.s
	rm *.elf
	rm *.map

debug:
	gdb-multiarch -iex "set auto-load safe-path ." $(NAME).elf


