
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
	add ax, 160 ; ax = 100*320+160
	mov di, ax

	mov al, 65
	mov es:[di], al

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
