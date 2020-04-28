.model small
.stack 1024
.data
.code
start:
  mov ax,@data
	mov ds,ax
	extrn writesint:proc
	mov ah,2ch
	int 21h
	mov dl,ch
	add dl,48
	mov ah,2h
	int 21h
	mov ah,00h
	mov al,cl
	mov bl,cl
	call writesint
	mov dl,dh
	mov al,dh
	call writesint
	add bl,10
	looper:
		mov ah,2ch
		int 21h
		mov ah,00h
		mov al,ch
		call writesint
		mov ah,00h
		mov al,cl
		call writesint
		mov dl,dh
		mov al,dh
		call writesint
		mov cx,01
		mov dx,00
		mov ah,86h
		int 15h
		mov ax,00h
		int 10h
		cmp cl,bl
		jnz looper
	mov ah,4ch
	int 21h
	end start
end
