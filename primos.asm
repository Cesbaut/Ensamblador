pila segment stack
    db 32 DUP('stack--')
pila ends
datos segment

datos ends
    letrero1 db 10,13, 'Ingresa un numero para saber si es numero primo: $'
    letrero2 db 10,13, 'El numero es par $'
    letrero3 db 10,13, 'El numero es impar$'
codigo segment 'code'


main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax,datos
    mov ds,ax   
    
    mov ah,09h
    lea dx, letrero1
    int 21h
    
    mov ah, 01h
    int 21h
    sub al,30h
    mov cl,al
    
    xor ax,ax
    mov al,cl    
    mov bl,02h  
    div bl 
    
    cmp ah, 00h
    je par
    jne impar
    
par:
    mov ah,09h
    lea dx, letrero2
    int 21h
    jmp salida
impar:
    mov ah,09h
    lea dx, letrero3
    int 21h
    jmp salida
    
   
    
salida:
    mov ah, 4ch;
    int 21h 
    
    ret    


main endp
codigo ends
end main

