
pila segment stack
    db 32 DUP('stack--')
pila ends

datos segment
    ;letrero db 13,10 'Ingresa un numero: $'
    n1 db 33h
    n2 db 35h
    n3 db 34h
    mayor db 0
    menor db ?
    medio db 0

datos ends

codigo segment 'code'

main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax, datos
    mov ds, ax
    
    mov bl, n1
    mov bh, n2
    mov cl, n3  
    
    
    
    cmp bl,bh
    jb condicion1
    ja condicion2
    
    condicion1:
        cmp bl,cl
        mov ch,bl
        jb menorX
        mov ch, cl
        ja menorX
    condicion2:
        cmp bh, cl
        mov ch,bh
        jb menorX
        mov ch, cl
        ja menorX 
    menorX:
        mov menor, ch
        jmp numeroMay
        
    numeroMay:
        cmp bl,bh
        ja condicion3
        jb condicion4
    condicion3:
        cmp bl,cl
        mov ch,bl
        mov medio, cl
        ja mayorX
        mov ch,cl
        jb mayorX
    condicion4:
        cmp bh,cl
        mov ch,bh
        ja mayorX
        mov ch,cl
        jb mayorX
        
    mayorX: 
        mov mayor,ch
        
        

     mov ah, 02h
     mov dl, menor
     int 21h 
     
     mov ah, 02h
     mov dl, mayor
     int 21h 
     
     
     mov ah, 02h
     mov dl, medio
     int 21h    
     
        
    
    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos    
        
    
    
main endp
codigo ends
end main    
    
    
