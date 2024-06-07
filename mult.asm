
pila segment stack; segmento de pila
    db 32 DUP('stack--'); define una localidad de 32
pila ends; cerramos segmento

datos segment
    letrero1 db 10,13, 'Ingresa un numero de un digito:  $'
    letrero2 db 10,13, 'Ingresa otro numero de un digito:  $' 
    letrero3 db 10,13, 'El numero es:  $'
    numero1 db ?
    numero2 db ?
    datos ends

codigo segment 'code'; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo ; asumir las variables

    mov ax, datos; muueve al registro ax tod lo de datos
    mov ds, ax; tambien se mueve al data segment
    
    
    mov ah,09h; imprimimos el primer letrero
    lea dx,letrero1
    int 21h
    
    mov ah, 01h; pedimos el primer valor y lo guardamos
    int 21h
    mov numero1, al
    
    mov ah,09h; imprimimos el segundo letrero
    lea dx,letrero2
    int 21h
    
    
    mov ah, 01h; pedimos el segundo valor y lo guardamos
    int 21h
    mov numero2, al
    
   
    
    
    

    
    
    
    mov ah,09h; imprimimos el segundo letrero
    lea dx,letrero3
    int 21h
    
    mov al, numero1; se almacenan en estos spacios para la multplicacion
    mov bl, numero2
    mul bl; multiplica con lo que tenga el registro al
    
    
    
    
    mov ah, 02h
    mov dl, al
    add dl, 30h
    int 21h
   

    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos


main endp; cerramos el procedimiento

codigo ends

end main
