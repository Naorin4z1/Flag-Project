mov cx, 160         ; ความสูง 160 บรรทัด

mov di, 6450        ; จุดเริ่มต้น (ซ้ายบนของกรอบธง)

draw_bg_row:

    push cx

    mov cx, 220     ; ความกว้าง 220 พิกเซล

    mov al, 15      ; สีขาว

    rep stosb

    add di, 320-220 ; ปัด DI ลงไปบรรทัดถัดไปและกลับมาที่ขอบ X=50

    pop cx

    loop draw_bg_row
