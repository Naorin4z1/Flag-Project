; แถบสีน้ำเงินบน (Y=46 ถึง 63 -> หนา 18 บรรทัด)

mov cx, 18

mov di, 14770       ; (46 * 320) + 50 = 14770

draw_top_stripe:

    push cx

    mov cx, 220

    mov al, 1       ; สีน้ำเงิน

    rep stosb

    add di, 320-220

    pop cx

    loop draw_top_stripe

; แถบสีน้ำเงินล่าง (Y=136 ถึง 153 -> หนา 18 บรรทัด)

mov cx, 18

mov di, 43570       ; (136 * 320) + 50 = 43570

draw_bot_stripe:

    push cx

    mov cx, 220

    mov al, 1       ; สีน้ำเงิน

    rep stosb

    add di, 320-220

    pop cx

    loop draw_bot_stripe
