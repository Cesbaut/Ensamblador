          
pila segment stack
    db 32 DUP('stack--')
pila ends

datos segment

    datos ends

codigo segment 'code'
main proc FAR
    assume ss:pila, ds:datos, cs:codigo 

    mov ax, datos
    mov ds, ax
    
    jmp cuarto_salto
    
  
 
    

primer_ajuste: 
    mov bh, 0ch;numero hexadecimal
    mov ah,00h
    mov al,bh    
    ;AAA
    aaa
    mov cx,ax
    
    mov ah,02h
    mov dl,ch
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,cl
    add dl,30h
    int 21h 
    jmp salida
    
segundo_ajuste:
    mov bh,1
    mov bl,2
    
    mov ax,bx
    aad; aad junta los dos numeros de ax, y los pone como hexa en al
    
    mov ah,00h
    
    aaa
    
    mov cx,ax
    
    mov ah,02h
    mov dl,ch
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,cl
    add dl,30h
    int 21h 
    jmp salida
    
tercer_ajuste:
    mov al,4
    mov bl,3
    mul bl
    aam     
     
     
    mov dl,ah
    mov cl,al
    
     
    mov ah,02h
    add dl,30h
    int 21h
    
    
    mov dl,cl 
    mov ah,02h
    add dl,30h
    int 21h 
   
  cuarto_salto:
  ; Practica para capturar un numero de dos digitos
    
   mov ah,01h    ; solicito el primer digito
   int 21h
   
   sub al,30h    ; realizo su ajuste
   
   mov ch,al     ; lo guardo en la parte alta del registro CX
   
   mov ah,01h    ; capturo otro digito por teclado
   int 21h
   
   sub al,30h    ; realizo el ajuste
   
   mov cl,al     ; guardo en la parte baja del registro CX
   
   mov ax,cx     ; lo muevo al registro AX para hacer el ajuste
   
   aad           ; Realizo el ajuste para dejarlo en hexadecimal y poderlo operar
   
   add al,80      ; sumo 2, esto no es obligatorio solo fue de ejemplp
   
   aam           ; ya que lo sume realizo el ajuste AAM para mostrarlo en pantalla
   mov cx,ax
                 ; y lo guardo en el registro CX para imprimirlo en pantalla
   
  mov ah,02h     ; muestro el resultado que esta en el registro CX
  mov dl,ch
  add dl,30h
  int 21h
  
  mov ah,02h
  mov dl,cl
  add dl,30h
  int 21h
    
    
salida:
    mov ah, 4ch
    int 21h

    ret
   



main endp

codigo ends

end main
