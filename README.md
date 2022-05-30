<h1> FreaX   </h1>

<p> FreaX is a open source kernel </p>



<h2> Dependcies </h2>

- nasm
- gcc
- grub



<h2> Compiling </h2>

```bash
# assemble boot.S file
as --32 -o boot.S -o boot.o

# compiling the kernel

gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

# linking kernel.o and boot.o

ld -m elf_i386 -T linker.ld kernel.o boot.o -o FreaX.bin

# check binray file is x86 multiboot or not
grub-file --is-x86-multiboot FreaX.bin
```



<h2> Building the ISO </h2>

```bash
mkdir -pv out/boot/grub
cp FreaX.bin out/boot -v
cp -v grub.cfg out/boot
grub-mkrescue -o FreaX out
```
