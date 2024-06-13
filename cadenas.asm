.model small
.stack
.data
    input db 100 dup (' '),'$'
    input2 db 50 dup (' '),'$'
.code
main proc far 
    mov ax, @data
    mov ds,ax
    mov si,0
    
    jmp primera_forma
    
    
primera_forma:
    mov ah,3fh
    mov bx,00h
    mov cx,100
    mov dx,offset [input];hara un desplazamiento hacia una variable
    int 21h  
    
    
    mov ah,02h; hace un salto de linea
    mov dl,10;el 10 es el salto de linea
    int 21h
    
    mov ah,09h
    mov dx,offset [input]
    int 21h
    
segunda_forma:
    mov ah,01h
    int 21h
    cmp al,13
    je mostrar_Cadena
    mov input2[si],al
    inc si
    jmp segunda_forma
    
mostrar_Cadena:
    mov ah,09h
    lea dx,input2
    int 21h
    
    
salida:
    mov ah,4ch              ; finalizamos el programa
    int 21h
    ret
.exit
main endp
end main