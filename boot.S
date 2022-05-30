# to identified by bootloader
.set MAGIC, 0x1BADB002

# set flags to 0
.set FLAGS, 0

# checksum
.set CHECKSUM, -(MAGIC + FLAGS)

# enable multiboot
.section .multiboot

# define type to long for each data defined as above

.long MAGIC
.long FLAGS
.long CHECKSUM

# set the stack bottom
stackBottom:

# define the maximum size of stack to 512 bytes
.skip 1024

# set stack top which grows from higher to lower
stackTop:

.section .text
.global _start
.type _start, @function

_start:

# assign current stack pointer location to stacktop

# call kernel main source

call kernel_entry

cli

# put system in infinite loop

hltLoop:

    hltLoop
    jmp hltLoop

.size _start, . - _start
