pila segment stack
    db 32 DUP('stack--')
pila ends
datos segment 
    asterisco db '*', '$'
    x db 28h
    y db 0h
    aux db 15d
    cant db 01h
    

datos ends
codigo segment 'code'

main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax,datos
    mov ds,ax
      


primerC:             
    mov ah,02h
    mov bh,00h
    mov dh,y
    mov dl,x
    int 10h 
    mov cl,cant 
   
    
    
    
impresion:
    mov ah, 02h
    mov dl,asterisco
    int 21h  
    dec cl
    cmp cl,0h
    jne impresion
    je decremento
    
    
decremento: 
    dec x
    inc y
    dec aux
    add cant, 02h
    
    mov ah,02h
    mov bh,00h
    mov dh,y
    mov dl,x
    int 10h  
    
    mov cl,cant
    
    cmp aux,0h    
    
    jne impresion
    


    
    
    


salida:
    mov ah, 4ch;
    int 21h 
    
    ret
main endp
codigo ends
end main