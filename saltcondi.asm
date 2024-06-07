
pila segment stack; segmento de pila
    db 32 DUP('stack--'); define una localidad de 32
pila ends; cerramos segmento

datos segment
    letrero1 db 10,13, 'mayor $'
    letrero2 db 10,13, 'menor $'
    n1 db 4
    n2 db 4
    r db 0

datos ends

codigo segment 'code'; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo ; asumir las variables

    mov ax, datos; muueve al registro ax tod lo de datos
    mov ds, ax; tambien se mueve al data segment
         
         
    mov bl,n1
    mov bh,n2     
    cmp bl, bh;compara los dos registros
    jae mayor; si son iguales
    jbe menor;si son diferentes
    
    mayor:
        mov ah,09h
        lea dx, letrero1 
        int 21h 
        jmp salida
    menor:
        mov ah, 09h
        lea dx, letrero2
        int 21h



    salida:
        mov ah, 4ch; interrupcion para selir
        int 21h
        ret ;  cerramos


main endp; cerramos el procedimiento

codigo ends

end main
