
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov ax, 13h
	int 10h

	mov ax, 0a000h
	mov es, ax

	mov ax, 100
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 1a: Vizszintes es fuggoleges vonalak

	mov al, 65
	mov cx, 100
cik1:
	mov es:[di], al
	inc al ; szinek :)
	inc di ; dec: masik irany
	loop cik1

	mov cx, 50
cik2:
	mov es:[di], al
	inc al
	add di, 320 ; sub: masik irany
	loop cik2

	mov cx, 100
cik3:
	mov es:[di], al
	inc al
	dec di
	loop cik3

	mov cx, 50
cik4:
	mov es:[di], al
	inc al
	sub di, 320
	loop cik4

	xor ax, ax
	int 16h
	mov ax, 100
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 1b: Ferde vonalak
	mov cx, 50
cik5:
	mov es:[di], al
	inc al
	add di, 319
	loop cik5

	mov cx, 50
cik6:
	mov es:[di], al
	inc al
	add di, 321
	loop cik6

	xor ax, ax
	int 16h
	mov ax, 100
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 2a: Fuggolegesen kitoltott teglalap

	mov dx, 51
kulsocikl1:
	mov al, 65
	mov cx, 101
cikl1:
	mov es:[di], al
	inc di
	inc al
	loop cikl1
	add di, 320
	sub di, 101
	dec dx
	jnz kulsocikl1

	xor ax, ax
	int 16h
	mov ax, 100
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 2b: Ferden kitoltott teglalap

	mov dx, 51
	mov ah, 65
kulsocikl2:
	mov al, ah
	mov cx, 101
cikl2:
	mov es:[di], al
	inc di
	inc al
	loop cikl2
	add di, 320
	sub di, 101
	dec dx
	inc ah
	jnz kulsocikl2

Program_vege:
	xor ax, ax
	int 16h

	mov ax, 03h
	int 10h

	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
