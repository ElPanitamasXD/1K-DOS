org 0x0000

start:
    mov ax, cs
    mov ds, ax
    mov es, ax

    mov ah, 0x00
    mov al, 0x03
    int 0x10

terminal_init:
    mov ah, 0x06
    mov al, 0
    mov bh, 0x0B
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10

    mov ah, 0x02
    mov bh, 0
    mov dh, 2    
    mov dl, 0    
    int 0x10

    mov ah, 0x09
    mov al, ' '
    mov bh, 0x0E
    mov cx, 80
    int 0x10

    mov si, msg_term_head
    call print_string

prompt_loop:
    mov si, prompt_str
    call print_string_color
    
_reset_and_read_buffer:
    mov di, cmd_buffer
.read_loop:
    mov ah, 0x00
    int 0x16
    cmp al, 13
    je .execute
    cmp al, 8
    je .backspace
    
    call translate_keyboard

    cmp byte [game_active], 1
    jne .skip_limit
    cmp di, cmd_buffer+2
    je .read_loop
.skip_limit:
    push ax
    mov ah, 0x09
    mov bh, 0
    mov bl, [text_color]
    mov cx, 1
    int 0x10
    pop ax

    mov ah, 0x0e
    int 0x10
    stosb
    jmp .read_loop

.backspace:
    cmp di, cmd_buffer
    je .read_loop
    dec di
    mov ah, 0x0e
    mov al, 8
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 8
    int 0x10
    jmp .read_loop

.execute:
    mov al, 0
    stosb
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10

    cmp byte [game_active], 1
    je do_game.game_eval

    mov si, cmd_buffer
    mov al, [si]
    
    cmp al, 'e'
    je do_echo
    cmp al, 'h'
    je do_help
    cmp al, 'g'
    je do_game
    cmp al, 'r'
    je do_reboot
    cmp al, 'c'
    je check_c_commands
    cmp al, 'i'
    je do_info
    cmp al, 't'  
    je do_time   
    cmp al, 's'  
    je do_shutdown 
    cmp al, 'd'  
    je do_date

    mov si, msg_unknown
    call print_string
    jmp prompt_loop

check_c_commands:
    mov al, [si+1]
    cmp al, 'l'
    je near terminal_init
    cmp al, 'o'
    je check_color_full
    
    mov si, msg_unknown
    call string_error
    jmp prompt_loop

check_color_full:
    cmp byte [si+2], 'l'
    jne .invalid
    cmp byte [si+3], 'o'
    jne .invalid
    cmp byte [si+4], 'r'
    jne .invalid
    jmp do_color
.invalid:
    mov si, msg_unknown
    call string_error
    jmp prompt_loop

string_error:
    call print_string
    ret
do_help:
    mov si, msg_help
    call print_string
    jmp prompt_loop

do_echo:
    mov si, cmd_buffer
    add si, 5
    call print_string
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10
    jmp prompt_loop

do_info:
    mov si, msg_info_art
    call print_string
    jmp prompt_loop

do_time:
    mov ah, 0x02        
    int 0x1A            
    jc .error           

    mov al, ch
    call print_bcd_byte

    mov ah, 0x0e
    mov al, ':'
    int 0x10

    mov al, cl
    call print_bcd_byte

    mov ah, 0x0e
    mov al, ':'
    int 0x10

    mov al, dh
    call print_bcd_byte
    jmp .done

.error:
    mov si, msg_unknown
    call print_string
.done:
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10
    jmp prompt_loop

do_date:
    mov ah, 0x04        
    int 0x1A            
    jc .error           

    mov al, dl
    call print_bcd_byte

    mov ah, 0x0e
    mov al, '/'
    int 0x10

    mov al, dh
    call print_bcd_byte

    mov ah, 0x0e
    mov al, '/'
    int 0x10

    mov al, ch          
    call print_bcd_byte
    mov al, cl          
    call print_bcd_byte
    jmp .done

.error:
    mov si, msg_unknown
    call print_string
.done:
    mov ah, 0x0e
    mov al, 13
    int 0x10
    mov al, 10
    int 0x10
    jmp prompt_loop

print_bcd_byte:
    push ax
    shr al, 4           
    add al, '0'         
    mov ah, 0x0e
    int 0x10            
    pop ax
    and al, 0x0F        
    add al, '0'         
    mov ah, 0x0e
    int 0x10            
    ret

do_shutdown:
    mov ax, 0x5301
    xor bx, bx
    int 0x15
    mov ax, 0x530E
    xor bx, bx
    mov cx, 0x0102
    int 0x15
    mov ax, 0x5307
    mov bx, 0x0001
    mov cx, 0x0003
    int 0x15
    jmp $

do_color:
    mov al, [cmd_buffer+6]
    cmp al, '1'
    je .c_blue
    cmp al, '2'
    je .c_green
    cmp al, '3'
    je .c_cyan
    cmp al, '4'
    je .c_red
    cmp al, '5'
    je .c_white
    
    mov si, msg_color_err
    call print_string
    jmp prompt_loop

.c_blue:
    mov byte [text_color], 0x09
    jmp .done
.c_green:
    mov byte [text_color], 0x0A
    jmp .done
.c_cyan:
    mov byte [text_color], 0x0B
    jmp .done
.c_red:
    mov byte [text_color], 0x0C
    jmp .done
.c_white:
    mov byte [text_color], 0x0F
    jmp .done
.done:
    jmp prompt_loop
do_game:
    mov si, msg_game_start
    call print_string

    mov ah, 0x00
    int 0x1A
    mov ax, dx
    xor dx, dx
    mov cx, 9
    div cx
    inc dl
    mov bl, dl

    mov ax, bx
    add ax, dx
    xor dx, dx
    div cx
    inc dl
    mov bh, dl

    mov ah, 0x00
    int 0x1A
    and dl, 1
    jz .do_sub

.do_add:
    mov cl, '+'
    mov al, bl
    add al, bh
    jmp .print_eq

.do_sub:
    mov cl, '-'
    mov al, bl
    cmp al, bh     
    jae .calc_sub
    xchg al, bh
    mov bl, al
.calc_sub:
    sub al, bh

.print_eq:
    aam
    add ax, 0x3030
    mov [game_target], ax

    mov ah, 0x0e
    mov al, bl
    add al, '0'
    int 0x10
    mov al, cl
    int 0x10
    mov al, bh
    add al, '0'
    int 0x10
    mov al, '='
    int 0x10

    mov byte [game_active], 1
    jmp _reset_and_read_buffer

.game_eval:
    mov byte [game_active], 0
    mov cx, [game_target]     
    
    mov si, cmd_buffer
    lodsb                    
    mov dl, [si]              

    cmp dl, 0                 
    jne .eval_two

    cmp ch, '0'              
    jne .lose
    cmp al, cl
    je .win
    jmp .lose

.eval_two:
    cmp al, ch
    jne .lose
    cmp dl, cl
    je .win

.lose:
    mov ah, 0x0e
    mov al, 0x07    
    int 0x10
    mov si, msg_game_err
    mov bl, 0x0C
    call print_custom_color
    jmp .end_game

.win:
    mov si, msg_game_ok
    mov bl, 0x0A
    call print_custom_color

.end_game:
    mov ah, 0x0e
    mov al, 13      
    int 0x10
    mov al, 10
    int 0x10
    jmp prompt_loop

do_reboot:
    db 0xea
    dw 0x0000
    dw 0xffff

translate_keyboard:
    cmp al, ';'
    je .set_ie
    cmp al, '['
    je .set_ob
    cmp al, ']'
    je .set_cb
    cmp al, '/'
    je .set_dash
    cmp al, '='
    je .set_inv
    ret
.set_ie:
    mov al, 164
    ret
.set_ob:
    mov al, '['
    ret
.set_cb:
    mov al, ']'
    ret
.set_dash:
    mov al, '-'
    ret
.set_inv:
    mov al, '/'
    ret

print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0e
    int 0x10
    jmp print_string
.done:
    ret

print_string_color:
    mov bl, [text_color]
print_custom_color:
    lodsb
    or al, al
    jz .color_done
    mov ah, 0x09
    mov cx, 1
    int 0x10
    
    mov ah, 0x0e
    int 0x10
    jmp print_custom_color
.color_done:
    ret

game_active    db 0
game_target    dw 0
text_color     db 0x0B

msg_term_head  db ' === 1K-DOS ===', 13, 10, 'Escriba "help" para comandos.', 13, 10, 0
prompt_str     db 'vtx> ', 0
msg_unknown    db 'Comando invalido.', 13, 10, 0
msg_help       db 'Comandos: help, echo [msg], game, cls, color [1-5], info, time, date, shutdown, rb', 13, 10, 0
msg_game_start db 'MathLock Active: ', 0

msg_game_ok    db ' [WIN!] (*^_^*)', 0
msg_game_err   db ' [LOSE] (X_X)', 0

msg_color_err  db 'Uso: color [1=Azul, 2=Verde, 3=Cyan, 4=Rojo, 5=Blanco]', 13, 10, 0

msg_info_art db '  __________________________________________', 13, 10, \
                ' |   __    _       ______   _____ _____     |', 13, 10, \
                ' |  /_ |  | |     |  _  \ /  ___/  ___|     |', 13, 10, \
                ' |   | |  | | __  | | | | \ `--.\ `--.      |', 13, 10, \
                ' |   | |  | |/ /  | | | |  `--. \`--. \     |', 13, 10, \
                ' |   | | _|   < _ | |/ /  /\__/ /\__/ /     |', 13, 10, \
                ' |   |_|(_)_|\_(_)|___/   \____/\____/      |', 13, 10, \
                '  ------------------------------------------', 13, 10, \
                '  Creado con exito por ElPanitamasXD.', 13, 10, 0

cmd_buffer:
