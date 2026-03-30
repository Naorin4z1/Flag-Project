; เส้นแนวนอนของดาว เส้นล่าง (y=29, x=27 ถึง 43)
mov dx, 29
mov cx, 27
star_h1:
    mov al, 1
    mov ah, 0Ch
    mov bh, 0
    int 10h
    inc cx
    cmp cx, 44
    jl star_h1

; เส้นแนวนอนของดาว เส้นบน (y=19, x=27 ถึง 43)
mov dx, 19
mov cx, 27
star_h2:
    mov al, 1
    mov ah, 0Ch
    mov bh, 0
    int 10h
    inc cx
    cmp cx, 44
    jl star_h2

; เส้นทแยงมุม 1 (ยอดแหลมบนไปซ้ายล่าง)
mov si, 17      ; ใช้ si เป็น y
diag1_loop:
    mov ax, si
    sub ax, 17
    mov bx, 8
    mul bx
    mov bx, 12
    div bx      ; คำนวณความชัน x = 35 - ((y-17)*8)/12
    mov cx, 35
    sub cx, ax  ; cx = x
    mov dx, si  ; dx = y
    mov al, 1
    mov ah, 0Ch
    mov bh, 0
    int 10h
    inc si
    cmp si, 30
    jl diag1_loop

; เส้นทแยงมุม 2 (ยอดแหลมบนไปขวาล่าง)
mov si, 17
diag2_loop:
    mov ax, si
    sub ax, 17
    mov bx, 8
    mul bx
    mov bx, 12
    div bx      ; x = 35 + ((y-17)*8)/12
    mov cx, 35
    add cx, ax
    mov dx, si
    mov al, 1
    mov ah, 0Ch
    mov bh, 0
    int 10h
    inc si
    cmp si, 30
    jl diag2_loop

; เส้นทแยงมุม 3 (ยอดแหลมล่างไปซ้ายบน)
mov si, 19
diag3_loop:
    mov ax, 31
    sub ax, si
    mov bx, 8
    mul bx
    mov bx, 12
    div bx      ; x = 35 - ((31-y)*8)/12
    mov cx, 35
    sub cx, ax
    mov dx, si
    mov al, 1
    mov ah, 0Ch
    mov bh, 0
    int 10h
    inc si
    cmp si, 32
    jl diag3_loop

; เส้นทแยงมุม 4 (ยอดแหลมล่างไปขวาบน)
mov si, 19
diag4_loop:
    mov ax, 31
    sub ax, si
    mov bx, 8
    mul bx
    mov bx, 12
    div bx      ; x = 35 + ((31-y)*8)/12
    mov cx, 35
    add cx, ax
    mov dx, si
    mov al, 1
    mov ah, 0Ch
    mov bh, 0
    int 10h
    inc si
    cmp si, 32
    jl diag4_loop