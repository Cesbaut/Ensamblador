pila segment stack
    db 32 DUP('stack--')
pila ends
datos segment

datos ends

codigo segment 'code'


main proc FAR
    assume ss:pila, ds:datos, cs:codigo
    
    mov ax,datos
    mov ds,ax


main ends
codigo ends
end main

