org 100h

mov ax, 0013h

int 10h


; ชี้ ES ไปที่ VGA Memory (A000:0000)

mov ax, 0A000h
mov es, ax
