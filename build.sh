#!/bin/bash

#  build.sh
#  FreaX
#
#  Created by mrtuxa on 31.05.22.
#

alias bootsfile = "boot.s"
alias bootofile = "boot.o"
alias kernelc = "kernel.c"
alias kernelo = "kernel.o"
alias kerneloptions-prefix = "-m32 -c -o"
alias kerneloptions-suffix = "-sdt=gnu99 -ffreestanding -O2 -Wall -Wextra"
alias linker = "linker.ld"
alias compiles = "gcc -S"
alias assemblyoptions-prefix = "--32"
alias assemblyoptions-suffix = "-o"
alias assembly = "as"
alias ccompiler = "gcc"
echo "compiling assembly files"
alias link = "ld"
alias linkoption-prefix = "-m elf_i386 -T"
alias linkfile = "linker.ld"
alias ooption = "-o"
alias binfile = "FreaX.bin"
alias stdoption = "-nostdlib"
alias gfile = "grub-file"
alias multiboot = "--is-x86-multiboot"
alias mdir = "mkdir"
alias diropt = "-pv"
alias copy = "cp -v"
alias bootloc = "build/boot"
alias grubloc = "build/boot/grub"
alias grubcfg = "grub.cfg"
alias rescue = "grub-mkrescue"
alias rescueopt = "-o"
alias builddir = "build"

$assembly $assemblyoptions-prefix $assembly-suffix
$compiles $kernelc

$ccompiler $kerneloptions-prefix $kernelo $kerneloptions-suffix
$link $linkoption $linkfile $kernelo $bootofile $ooption $binfile $stdoption
$gfile $multiboot $binfile
$mdir $diropt build/boot/grub
$copy $binfile $bootloc
$copy $grubcfg $grubloc
$rescue rescueopt $builddir
