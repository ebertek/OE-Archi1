
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov ax, 13h
	int 10h

	mov ax, 0a000h
	mov es, ax

	mov ax, 100 ; sor
	mov bx, 320
	mul bx ; dx:ax = ax * bx
	add ax, 100 ; ax = 100*320+100
	mov di, ax

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