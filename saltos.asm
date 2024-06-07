
pila segment stack; segmento de pila
    db 32 DUP('stack--'); define una localidad de 32
pila ends; cerramos segmento

datos segment

    datos ends

codigo segment 'code'; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo ; asumir las variables

    mov ax, datos; muueve al registro ax tod lo de datos
    mov ds, ax; tambien se mueve al data segment
    
    
    numero5:
        mov ah, 02h
        mov dl, 35h
        int 21h
        jmp numero3
    numero2:
        mov ah, 02h
        mov dl, 32h
        int 21h
    numero3:
        mov ah, 02h
        mov dl, 33h
        int 21h
    
    
    

    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos


main endp; cerramos el procedimiento

codigo ends

end main
