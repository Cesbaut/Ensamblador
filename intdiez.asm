
pila segment stack
    db 32 DUP('stack--')
pila ends

datos segment
    letrero1 db 'Hola $'

datos ends

codigo segment 'code'

main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax, datos
    mov ds, ax
    
    mov ah,02h      ; funcion para posicionar el cursor en la pantalla
    mov bh,00h      ; modo de video
    mov dh,05h      ; columna donde se pondra
    mov dl,0Ah      ; fila donde se pondra
    int 10h
    
    mov ah, 09h     ; funcion que imprime una cadena en pantalla
    lea dx,letrero1
    int 21h
    
    mov ah, 01h ;pedir un valor
    int 21h
    
    mov ah, 06h ;funcion 06h
    mov al, 00h ;numero de lineas a desplazar, 0 se limpia
    mov bh, 1Dh ;primer digito color de pantalla, segundo el del texto
    ;mov cx, 0000h; tambien se puede poner de esta manera
    mov ch, 00h ;coordenadas donde empieza a limpiar
    mov cl, 00h
    mov dh, 18h ;coordenadas donde termina de limpiar la pantalla
    mov dl,4fh
    int 10h  
    
    
    mov ah, 09h     ; funcion que imprime una cadena en pantalla
    lea dx,letrero1
    int 21h
    
    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos    
        
    
    
main endp
codigo ends
end main    
    
    