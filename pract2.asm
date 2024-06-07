
pila segment stack
    db 32 DUP('stack--')
pila ends
datos segment
    letrero1 db 10,13, '1.Suma $'
    letrero2 db 10,13, '2.Resta $'
    letrero3 db 10,13, '3.Multiplicacion $'
    letrero4 db 10,13, '4.Division $'
    letrero5 db 10,13, '5.Cambiar a azul la pantalla $'
    letrero6 db 10,13, '6.Salir $'
    pregunta db 10,13, 'Ingresa una opcion valida $'
    numero1 db 10,13, 'Ingresa el primer numero: $'
    numero2 db 10,13, 'Ingresa el segundo numero: $'
    resultado db 10,13, ?
    impreresul db 10,13, 'El resultado es: $'
    
datos ends
codigo segment 'code'
main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax,datos
    mov ds,ax 
    
    
menu:
    mov ah, 09h
    lea dx, letrero1
    int 21h
    mov ah, 09h
    lea dx, letrero2
    int 21h
    mov ah, 09h
    lea dx, letrero3
    int 21h
    mov ah, 09h
    lea dx, letrero4
    int 21h
    mov ah, 09h
    lea dx, letrero5
    int 21h
    mov ah, 09h
    lea dx, letrero6
    int 21h
    mov ah, 09h
    lea dx, pregunta
    int 21h
    
    mov ah,01h
    int 21h
    
    cmp al, 31h
    je opcion1

    cmp al, 32h
    je opcion2
    
    cmp al, 33h
    je opcion3

    cmp al, 34h
    je opcion4
    
    cmp al, 35h
    je opcion5
    
    cmp al, 36h
    je opcion6
    

    
opcion1:
    mov ah, 09h
    lea dx, numero1
    int 21h
    
    mov ah,01h
    int 21h
    
    mov cl,al

    
    mov ah, 09h
    lea dx, numero2
    int 21h
    
    mov ah,01h
    int 21h
    
    mov ch,al

    
    add cl,ch 
    
    mov resultado,cl
    sub resultado,30h 
    
    mov ah, 09h
    lea dx, impreresul
    int 21h
    mov ah, 02h
    mov dl, resultado
    int 21h
    jmp menu
    
opcion2:
    mov ah, 09h
    lea dx, numero1
    int 21h
    
    mov ah,01h
    int 21h
    
    mov cl,al

    
    mov ah, 09h
    lea dx, numero2
    int 21h
    
    mov ah,01h
    int 21h
    
    mov ch,al

    
    sub cl,ch 
    
    mov resultado,cl
    add resultado,30h 
    
    mov ah, 09h
    lea dx, impreresul
    int 21h
    mov ah, 02h
    mov dl, resultado
    int 21h
    jmp menu

opcion3:
    mov ah, 09h
    lea dx, numero1
    int 21h
    
    mov ah,01h
    int 21h
    
    mov cl,al
    
    sub cl, 30h

    
    mov ah, 09h
    lea dx, numero2
    int 21h
    
    mov ah,01h
    int 21h
    

    sub al,30h
    
    mul cl
     
    
    mov resultado,al
    add resultado,30h 
    
    mov ah, 09h
    lea dx, impreresul
    int 21h
    mov ah, 02h
    mov dl, resultado
    int 21h
    jmp menu


opcion4:
    
    mov ah, 09h
    lea dx, numero1
    int 21h
    
    mov ah,01h
    int 21h
    
    mov cl,al
    
    sub cl, 30h

    
    mov ah, 09h
    lea dx, numero2
    int 21h
    
    mov ah,01h
    int 21h
    
    
    mov ch,al
    sub ch,30h
    

    sub al,30h

    
    
    xor ax,ax
    
    mov al,cl
    
    
    div ch
     
    
    mov resultado,al
    add resultado,30h 
    
    mov ah, 09h
    lea dx, impreresul
    int 21h
    mov ah, 02h
    mov dl, resultado
    int 21h
    jmp menu
opcion5:
     mov ah, 06h
     mov al, 00h
     mov bh, 10h
     mov cx, 0000h
     mov dh, 18h
     mov dl,4fh
     int 10h
     jmp menu
               
               

opcion6:    
     jmp salida
    
    
    
    
    
    
    
salida:
    mov ah, 4ch;
    int 21h 
    
    ret
main endp
codigo ends
end main


