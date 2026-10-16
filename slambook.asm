global _start

section .data
    cls         db 0x1b, "[2J", 0x1b, "[H", 0x1b, "[44;37m", 0
    cls_len     equ $ - cls

    top_frame   db "╔══════════════════════════════════════════════════════╗", 10, 0
    top_frame_l equ $ - top_frame
    
    banner      db "║         * MY INTERACTIVE DIGITAL SLAMBOOK *          ║", 10
                db "╠══════════════════════════════════════════════════════╣", 10, 0
    banner_len  equ $ - banner

    side_l      db "║  ", 0
    side_l_len  equ $ - side_l

    raw_nl      db 10, 0
    raw_nl_len  equ $ - raw_nl

    div_frame   db "╠══════════════════════════════════════════════════════╣", 10, 0
    div_frame_l equ $ - div_frame

    bot_frame   db "╚══════════════════════════════════════════════════════╝", 10, 0
    bot_frame_l equ $ - bot_frame

    s_about     db "║                ✦ [ ABOUT ME PROFILE ] ✦              ║", 10, 0
    s_about_l   equ $ - s_about
    
    s_firsts    db "║                 ✦ [ LIFE MY FIRSTS ] ✦               ║", 10, 0
    s_firsts_l  equ $ - s_firsts
    
    s_faves     db "║                 ✦ [ PERSONAL FAVES ] ✦               ║", 10, 0
    s_faves_l   equ $ - s_faves
    
    s_motto     db "║               ✦ [ HOBBIES & LIFE MOTTO ] ✦           ║", 10, 0
    s_motto_l   equ $ - s_motto

    lbl_name    db "Name:              ", 0
    lbl_name_l  equ $ - lbl_name
    lbl_email   db "Email:             ", 0
    lbl_email_l equ $ - lbl_email
    lbl_blog    db "Blog/Website:      ", 0
    lbl_blog_l  equ $ - lbl_blog

    lbl_achieve db "First Achievement: ", 0
    lbl_achieve_l equ $ - lbl_achieve
    lbl_risk    db "First Risk Taken:  ", 0
    lbl_risk_l  equ $ - lbl_risk

    lbl_colors  db "Favorite Colors:   ", 0
    lbl_colors_l equ $ - lbl_colors
    lbl_food    db "Favorite Food:     ", 0
    lbl_food_l  equ $ - lbl_food

    lbl_hobby   db "Hobby Activity:    ", 0
    lbl_hobby_l equ $ - lbl_hobby
    lbl_motto   db "Life Motto:        ", 0
    lbl_motto_l equ $ - lbl_motto

    summary_h   db "║                    ✦ MY SLAMBOOK ✦                   ║", 10
                db "╠══════════════════════════════════════════════════════╣", 10, 0
    summary_hl  equ $ - summary_h

    done_msg    db 10, "Press [ENTER] to save record and close app...", 10, 0
    done_msg_l  equ $ - done_msg

section .bss
    buf_name    resb 32
    buf_email   resb 32
    buf_blog    resb 32
    buf_achieve resb 32
    buf_risk    resb 32
    buf_colors  resb 32
    buf_food    resb 32
    buf_hobby   resb 32
    buf_motto   resb 32

section .text
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, cls
    mov edx, cls_len
    int 0x80

    mov eax, 4
    mov ecx, top_frame
    mov edx, top_frame_l
    int 0x80

    mov eax, 4
    mov ecx, banner
    mov edx, banner_len
    int 0x80

    mov eax, 4
    mov ecx, s_about
    mov edx, s_about_l
    int 0x80

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_name
    mov edx, lbl_name_l
    int 0x80
    mov ecx, buf_name
    call get_input

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_email
    mov edx, lbl_email_l
    int 0x80
    mov ecx, buf_email
    call get_input

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_blog
    mov edx, lbl_blog_l
    int 0x80
    mov ecx, buf_blog
    call get_input

    mov eax, 4
    mov ecx, div_frame
    mov edx, div_frame_l
    int 0x80

    mov eax, 4
    mov ecx, s_firsts
    mov edx, s_firsts_l
    int 0x80

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_achieve
    mov edx, lbl_achieve_l
    int 0x80
    mov ecx, buf_achieve
    call get_input

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_risk
    mov edx, lbl_risk_l
    int 0x80
    mov ecx, buf_risk
    call get_input

    mov eax, 4
    mov ecx, div_frame
    mov edx, div_frame_l
    int 0x80

    mov eax, 4
    mov ecx, s_faves
    mov edx, s_faves_l
    int 0x80

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_colors
    mov edx, lbl_colors_l
    int 0x80
    mov ecx, buf_colors
    call get_input

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_food
    mov edx, lbl_food_l
    int 0x80
    mov ecx, buf_food
    call get_input

    mov eax, 4
    mov ecx, div_frame
    mov edx, div_frame_l
    int 0x80

    mov eax, 4
    mov ecx, s_motto
    mov edx, s_motto_l
    int 0x80

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_hobby
    mov edx, lbl_hobby_l
    int 0x80
    mov ecx, buf_hobby
    call get_input

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_motto
    mov edx, lbl_motto_l
    int 0x80
    mov ecx, buf_motto
    call get_input

    mov eax, 4
    mov ecx, bot_frame
    mov edx, bot_frame_l
    int 0x80

    mov ecx, buf_name
    call clean_input
    mov ecx, buf_email
    call clean_input
    mov ecx, buf_blog
    call clean_input
    mov ecx, buf_achieve
    call clean_input
    mov ecx, buf_risk
    call clean_input
    mov ecx, buf_colors
    call clean_input
    mov ecx, buf_food
    call clean_input
    mov ecx, buf_hobby
    call clean_input
    mov ecx, buf_motto
    call clean_input

    mov eax, 4
    mov ebx, 1
    mov ecx, cls
    mov edx, cls_len
    int 0x80

    mov eax, 4
    mov ecx, top_frame
    mov edx, top_frame_l
    int 0x80

    mov eax, 4
    mov ecx, summary_h
    mov edx, summary_hl
    int 0x80

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_name
    mov edx, lbl_name_l
    int 0x80
    mov eax, 4
    mov ecx, buf_name
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_email
    mov edx, lbl_email_l
    int 0x80
    mov eax, 4
    mov ecx, buf_email
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_blog
    mov edx, lbl_blog_l
    int 0x80
    mov eax, 4
    mov ecx, buf_blog
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_achieve
    mov edx, lbl_achieve_l
    int 0x80
    mov eax, 4
    mov ecx, buf_achieve
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_risk
    mov edx, lbl_risk_l
    int 0x80
    mov eax, 4
    mov ecx, buf_risk
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_colors
    mov edx, lbl_colors_l
    int 0x80
    mov eax, 4
    mov ecx, buf_colors
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_food
    mov edx, lbl_food_l
    int 0x80
    mov eax, 4
    mov ecx, buf_food
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_hobby
    mov edx, lbl_hobby_l
    int 0x80
    mov eax, 4
    mov ecx, buf_hobby
    mov edx, 32
    int 0x80
    call print_newline

    call print_side_borders
    mov eax, 4
    mov ecx, lbl_motto
    mov edx, lbl_motto_l
    int 0x80
    mov eax, 4
    mov ecx, buf_motto
    mov edx, 32
    int 0x80
    call print_newline

    mov eax, 4
    mov ecx, bot_frame
    mov edx, bot_frame_l
    int 0x80

    mov eax, 4
    mov ecx, done_msg
    mov edx, done_msg_l
    int 0x80

    mov ecx, buf_name
    call get_input

    mov eax, 1
    xor ebx, ebx
    int 0x80

print_side_borders:
    mov eax, 4
    mov ebx, 1
    mov ecx, side_l
    mov edx, side_l_len
    int 0x80
    ret

print_newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, raw_nl
    mov edx, raw_nl_len
    int 0x80
    ret

get_input:
    mov eax, 3
    mov ebx, 0
    mov edx, 32
    int 0x80
    ret

clean_input:
    mov esi, ecx
.loop:
    mov al, [esi]
    cmp al, 10
    je .found
    cmp al, 0
    je .done
    inc esi
    jmp .loop
.found:
    mov byte [esi], 0
.done:
    ret
