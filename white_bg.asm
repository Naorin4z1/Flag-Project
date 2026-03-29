; White background (space)
mov cx, 80
white_row:
mov dl, ' '
mov ah, 2
int 21h
loop white_row
