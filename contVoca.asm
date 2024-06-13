.model small
.stack
.data
    cadena db 'Esta es otra prueba$'
    num equ $-cadena
    tiene db 10,13,'Tiene un total de vocales $'
    total db ?

.code
main proc far
    mov ax,@data
    mov ds,ax
    
    mov si,0
    mov dx,0h
    mov cx,num
    
etiqueta:
    mov al,cadena[si]
    cmp al,61h
    je vocal
    cmp al,65h
    je vocal
    cmp al,69h
    je vocal
    cmp al,6fh
    je vocal
    cmp al,75h
    je vocal
    regresa:
        inc si
    loop etiqueta
    
    mov dh,0
    mov total,dl
    
    mov ah,09h
    lea dx,cadena
    int 21h
    
    mov ah,09h
    lea dx,tiene
    int 21h
    
    mov ax,0
    mov al,total
    aaa
    add ax,3030h
    mov bx,ax
    
    mov ah,02h
    mov dl,bh
    int 21h
    
     mov ah,02h     ; aca van la unidades
     mov dl,bl
     int 21h
     jmp salir  
    jmp salir
vocal:
    inc dl
    jmp regresa
    
    
salir: 
    mov ah,4ch
    int 21h

.exit
main endp
end main