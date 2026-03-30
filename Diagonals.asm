; วาดเส้นทแยงมุมทั้ง 4 เส้น (คำนวณสมการเส้นตรง)

; D1: ยอดแหลมบน (160, 68) ไปซ้ายล่าง (132, 120)

mov si, 68          ; ตัวแปร Y เริ่มที่ 68

d1_loop:

    mov ax, si

    sub ax, 68

    mov bx, 28

    mul bx

    mov bx, 52

    div bx          ; AX = ((Y - 68) * 28) / 52

    mov cx, 160

    sub cx, ax      ; CX (แกน X) = 160 - AX

    mov dx, si      ; DX (แกน Y) = SI

    call put_pixel_thick

    inc si

    cmp si, 121

    jl d1_loop



; D2: ยอดแหลมบน (160, 68) ไปขวาล่าง (188, 120)

mov si, 68

d2_loop:

    mov ax, si

    sub ax, 68

    mov bx, 28

    mul bx

    mov bx, 52

    div bx

    mov cx, 160

    add cx, ax      ; CX (แกน X) = 160 + AX

    mov dx, si

    call put_pixel_thick

    inc si

    cmp si, 121

    jl d2_loop



; D3: ซ้ายบน (132, 80) ไปยอดแหลมล่าง (160, 132)

mov si, 80

d3_loop:

    mov ax, si

    sub ax, 80

    mov bx, 28

    mul bx

    mov bx, 52

    div bx

    mov cx, 132

    add cx, ax      ; CX (แกน X) = 132 + AX

    mov dx, si

    call put_pixel_thick

    inc si

    cmp si, 133

    jl d3_loop



; D4: ขวาบน (188, 80) ไปยอดแหลมล่าง (160, 132)

mov si, 80

d4_loop:

    mov ax, si

    sub ax, 80

    mov bx, 28

    mul bx

    mov bx, 52

    div bx

    mov cx, 188

    sub cx, ax      ; CX (แกน X) = 188 - AX

    mov dx, si

    call put_pixel_thick

    inc si

    cmp si, 133

    jl d4_loop
; --------------------------------------------------

; รอรับการกดปุ่มใดๆ แล้วคืนค่าโหมดเดิม

; --------------------------------------------------

mov ah, 00h

int 16h



mov ax, 0003h

int 10h



mov ax, 4c00h

int 21h



; --------------------------------------------------

; ฟังก์ชันย่อยสำหรับวาดพิกเซลแบบเพิ่มความหนา (แกน X)

; --------------------------------------------------

put_pixel_thick:

    push ax

    push bx

    push di

    

    ; คำนวณ Address = (Y * 320) + X

    mov ax, 320

    mul dx

    add ax, cx

    mov di, ax

    

    mov al, 1       ; สีน้ำเงิน

    ; วาดความหนา 3 พิกเซลแนวนอนให้เส้นทแยงมุมดูคมชัดขึ้น

    mov byte ptr es:[di], al

    mov byte ptr es:[di+1], al

    mov byte ptr es:[di+2], al

    

    pop di

    pop bx

    pop ax

    ret
