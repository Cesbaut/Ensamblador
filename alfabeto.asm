
pila segment stack
    db 32 DUP('stack--')
pila ends
datos segment

datos ends
codigo segment 'code'
main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax,datos
    mov ds,ax
    
    mov bl,97d
   
   
    mov cx,26d
bucle:
    mov ah, 02h
    mov dl, bl
    int 21h
    inc bl
    loop bucle
    
    
    
   
salida:
    mov ah, 4ch
    int 21h 
    
    ret
main endp
codigo ends
end main

