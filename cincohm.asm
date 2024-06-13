
pila segment stack
    db 32 DUP('stack--')
pila ends
datos segment
    letrero1 db 10,13, 'Hola mundo $'
   
    
datos ends
codigo segment 'code'
main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax,datos
    mov ds,ax
   
   
    mov cx,05d
bucle:
    mov ah, 09h
    lea dx, letrero1
    int 21h
    loop bucle
    
    
    
   
salida:
    mov ah, 4ch;
    int 21h 
    
    ret
main endp
codigo ends
end main

