target extended-remote host.docker.internal:2331
monitor reset
load
monitor reset halt
layout regs
b reset_handler
c
