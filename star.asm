; Star (ง่ายๆ)
lea dx, star
mov ah, 9
int 21h

star db "   /\\   ",10
     db "  /  \\  ",10
     db " /____\\ ",10
     db " \\    / ",10
     db "  \\  /  ",10
     db "   \\/   $"