;Ejercicio, pedir al usuario dos numeros enteros del 1 al 10, sumarlos y mostrar el resultado
;Cesar Bautista Castilla

pila segment stack; segmento de pila
    db 32 DUP('stack--'); define una localidad de 32
pila ends; cerramos segmento

datos segment
    letrero1 db 10,13, 'Ingresa un numero de un digito:  $'
    letrero2 db 10,13, 'Ingresa otro numero de un digito:  $' 
    letrero3 db 10,13, 'El numero es:  $'
    numero1 db 30h
    numero2 db 30h
    r db 30h
    datos ends

codigo segment 'code'; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo ; asumir las variables

    mov ax, datos; muueve al registro ax tod lo de datos
    mov ds, ax; tambien se mueve al data segment
    
   
    
    
    mov ah, 09h;imprimimos el primer letrero
    lea dx, letrero1
    int 21h
    
    mov ah, 01h; pedimos el primer numero y lo guardamos en ch con su codigo asccii
    int 21h
    sub al, 30h 
    mov numero1, al
    
    
    mov ah, 09h; imprimimos el segundo letrero
    lea dx, letrero2
    int 21h
    
    mov ah, 01h; pedimos el segundo numero a cl
    int 21h
    sub al, 30h 
    mov numero2,al
    
    
    
    mov al, numero1; suma
    add al, numero2
    mov r,al
    
    mov ah, 09h; tercer letrero
    lea dx, letrero3
    int 21h
    
    
    mov dl,r
    add dl, 30h ; Convertir de numero a ASCII
    mov ah, 02h; imprimimos el resultado
    int 21h
    
    
    
    
   

    mov ah, 4ch; interrupcion para selir
    int 21h

    ret ;  cerramos


main endp; cerramos el procedimiento

codigo ends

end main

