.model small
.stack
.data 
    n1 dw ? ;dw define una localidad mas grande
    n2 dw ?
    
.code
main proc far 
    mov ax, @data
    mov ds,ax 
    
    mov ah, 01h  
    int 21h
    
    mov ah,00h
    mov bl,al
    
    push bx
    
    mov ah,01h
    int 21h
    
    mov ah,00h
    mov cl,al
    
    push cx 
    
    pop bx
    pop cx
    
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov ah,02h
    mov dl,cl
    int 21h
    
     
    
    
    
salida:
    mov ah,4ch
    int 21h
    ret
.exit
main endp
end main