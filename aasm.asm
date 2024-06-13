.model small
.stack
.data
    letrero db 10,13, 'Ingresa un numero: $'
    letsuma db 10,13, 'El resultado de tu suma es: $'
    letmult db 10,13, 'El resultado de tu multiplicacion es: $'
    n1 db ?
    n2 db ?
    result db 10,13,'El resultado es: $'

.code
main proc far
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,letrero
    int 21h
    
    mov ah,01h
    int 21h
    
    mov ch,al
    sub ch,30h
    
    mov ah,09h
    lea dx,letrero
    int 21h
    
    mov ah,01h
    int 21h
    
    mov cl,al
    sub cl,30h
    
    mov bx,cx
    
    jmp tercer_ejemplo
    
suma:
    
    mov cl,al
    sub cl,30h
    
    xor ax,ax
    
    add ch,cl
    
    mov al,ch
    
    aaa
    
    mov cx,ax 
    add cx,3030h
    
    mov ah,09h
    lea dx,letsuma
    int 21h
    
    mov ah,02h
    mov dl,ch
    int 21h
    
    mov ah,02h
    mov dl,cl
    int 21h 
 
multiplicacion:
    mov cx,bx

    xor ax,ax
    
    mov al,ch
    
    mul cl
    
    
    aam
    
    mov cx,ax 
    add cx,3030h
    
    mov ah,09h
    lea dx,letmult
    int 21h
    
    mov ah,02h
    mov dl,ch
    int 21h
    
    mov ah,02h
    mov dl,cl
    int 21h
 tercer_ejemplo:
            mov ah,09h
            lea dx, letrero
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h
            
            mov bl,al 
           
            
            mov ah,01h
            int 21h
            sub al,30h
            mov cl,al
            
            ; ingresa segundo numero
            mov ah,09h
            lea dx, letrero
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h 
            add bl,al 
            
            mov ah,01h
            int 21h
            sub al,30h
            
            add cl,al
            
            mov ah,09h
            lea dx,result 
            int 21h
            
            
            mov ax,cx
            
            aam
            
            mov cx,ax
            
            add bl,ch
            mov ax,bx
            
            aam
            mov bx,ax
            
            mov ah,02h
            mov dl,bh
            add dl,30h
            int 21h
            
            mov ah,02h
            mov dl,bl
            add dl,30h
            int 21h 
            
            mov ah,02h
            mov dl,cl
            add dl,30h
            int 21h
            
            mov ah,01h
            int 21h
    
    
    
    
    
.exit
main endp
end main
    