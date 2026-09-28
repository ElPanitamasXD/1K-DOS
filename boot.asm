org 0x7C00

inicio:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov ax, 0x1000   
    mov es, ax       
    xor bx, bx       

    mov ah, 0x02     
    mov al, 20       
    mov ch, 0        
    mov cl, 2        
    mov dh, 0        
    int 0x13         
    jc .disk_error         

    jmp 0x1000:0000

.disk_error:
    mov ax, 0x0B800
    mov gs, ax
    mov word [gs:0], 0x0C45 
    jmp $

times 510-($-$$) db 0   
dw 0xAA55
