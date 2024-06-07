.286 ; ARQUITECTURA
pila segment stack; segmento de pila
    db 32 DUP('stack--'); define una localidad de 32
pila ends; cerramos segmento

datos segment
    letrero1 db ""
    letrero db 'Hola mundo' ; signo de pesos para decir que acabamos la cadena
datos ends

codigo segment 'code'; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo ; asumir las variables

    mov ax, datos; muueve al registro ax tod lo de datos
    mov ds, ax; tambien se mueve al data segment

    mov ah, 09h; es la funcion para imprimir la cadena en la pantalla
    ;mov dx, offset letrero ; mueve al registro dx lo de letrero
    lea dx, letrero; otra opcion para imprimir cadena
    int 21h; interruccion a la que se hace referencia

    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos


main endp; cerramos el procedimiento

codigo ends

end main