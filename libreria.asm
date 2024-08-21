.model small
INCLUDE libre.lib
.stack
.data
    frase db 'Hola amigos$'
.code
    main proc far
        mov ax,@data
        mov ds,ax
        
        
        call clscr
        print frase
        
        
       
        
        mov ah,4ch
        int 21h
        
    .exit
    main endp
   
end main
