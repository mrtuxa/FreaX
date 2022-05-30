#ifndef KERNEL_H
#define KERNEL_H

typedef unsigned char uint8;
typedef unsigned char uint16;
typedef unsigned uint32;

#define VGA_ADRESS 0xB8000
#define BUFSIZE 2200

uint16* vga_buffer;

#define NULL 0

enum vga_color {
   BLACK,
    BLUE,
    GREEN,
    CYAN,
    RED,
    MAGENTA,
    BROWN,
    GREY,
    DARK_GREY,
    BRIGHT_BLUE,
    BRIGHT_GREEN,
    BRIGHT_CYAN,
    BRIGHT_RED,
    BRIGHT_MAGENTA,
    YELLOW,
    WHITE, 
};

#endif
