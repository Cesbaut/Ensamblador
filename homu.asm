
.model small; definimos un modelo de datos
.stack; hace referencia al segmento de pila
.data
    letrero db 'Hola segundo mundo $'
.code
main proc FAR
    ;ya definimos los segmentos
    mov ax,@data       ;otra forma de indicar
    mov ds, ax

    mov ah, 09h        ; es la funcion para imprimir la cadena en la pantalla
    ;mov dx, offset letrero ; mueve al registro dx lo de letrero
    lea dx, letrero    ; otra opcion para imprimir cadena
    int 21h            ; interruccion a la que se hace referencia

    mov ah, 4ch        ; interrupcion para selir
    int 21h

    ret                ;  cerramos

.exit
main endp        ; cerramos el procedimiento

codigo ends

end main

