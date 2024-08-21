print macro cadena
    mov ah,09h
    lea dx,cadena
    int 21h
endm
imprimer_caracter macro caracter
    mov ah,02h
    mov dl, caracter
    int 21h
endm

.model small
.stack
.data
    frase db 'Hola amigps$'
.code
main proc far
    mov ax,@data
    mov ds,ax
    
    print frase
    imprime_caracter 35h
    imprime_caracter 'A'
    
    mov ah,4ch
    int 21h
    
.exit
main endp
end main
