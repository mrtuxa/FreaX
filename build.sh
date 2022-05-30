#!/bin/bash
# assemble boot.s file
as --32 -o boot.s -o boot.o

# compile kernel

gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

# linking kernel with kernel.o and boot.o

ld -m elf_i386 -T linker.ld kernel.o boot.o -o FreaX.bin -nostdlib

# check binary file is x86 multiboot or not
grub-file --is-x86-multiboot FreaX.bin

# building the iso file

mkdir out/boot/grub
cp FreaX.bin out/boot -v
cp -v grub.cfg out/boot
grub-mkrescue -o FreaX out
