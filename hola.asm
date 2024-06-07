.model small
.stack
.data
cadena db "Hola mundo", "$"
.code
main proc
mov ax, @data
mov ds,ax
mov ah, 09
lea dx, cadena
int 21h
mov ax, 4c00h
int 21h
main endp
end main