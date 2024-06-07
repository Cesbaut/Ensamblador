.286 ; ARQUITECTURA
pila segment stack; segmento de pila
    db 32 DUP('stack--'); define una localidad de 32
pila ends; cerramos segmento

datos segment
    letrero1 db 10,13, 'Ingresa un numero de un digito:  $' 
    letrero2 db 10,13, 'El numero es:  $'
datos ends

codigo segment 'code'; segmento de codigo
main proc FAR

    assume ss:pila, ds:datos, cs:codigo ; asumir las variables

    mov ax, datos; muueve al registro ax tod lo de datos
    mov ds, ax; tambien se mueve al data segment


    mov ah, 09h; imprime le letrero 1
    lea dx, letrero1
    int 21h
    
    mov ah, 01h; solicito un caracter
    int 21h
    
    mov cl, al ;lo movemos a cl


    mov ah, 09h; imprimimos el letrero 2
    lea dx, letrero2
    int 21h
    
    mov ah, 02h; im?rimimos el caracter
    mov dl, cl
    int 21h




    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos


main endp; cerramos el procedimiento

codigo ends

end main