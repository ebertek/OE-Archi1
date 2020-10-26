
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov di, offset ertek

	mov ax, 03 ; clear screen
	int 10h

Bevitel:
	xor ax, ax ; ah <- 0
	int 16h ; al <- beolvasott karakter

	mov bx, ax ; bl-be elmentjuk, mert al-t masra kell most hasznalnunk
	mov ax, 03 ; clear screen
	int 10h
	mov ax, bx ; visszatoltjuk al-be

	cmp al, 27
	jz Program_vege

	mov cx, 10
	mov ah, '0'

Vizsg:
	cmp al, ah ; al <- bekert karakter
	jz Tarol ; elso korben 0,
	inc ah ; aztan 1..9
	loop Vizsg ; beepitett ciklus, ua., mint dec cx jnz Vizsg

	mov ah, 02h
	mov bh, 0
	mov dh, 10 ; 10. sor
	int 10h

	mov dx, offset hiba
	mov ah, 09
	int 21h

	jmp Bevitel

Tarol:
	mov [di], al
	inc di
	mov al, '$'
	mov [di], al

	mov ah, 02h
	mov bh, 0
	mov dh, 5
	mov dl, 28
	int 10h

	mov dx, offset ertek
	mov ah, 09
	int 21h

	mov ax, offset ertek
	add ax, 4
	cmp ax, di
	jnz Bevitel

	mov ah, 02h
	mov bh, 0
	mov dh, 7
	int 10h

	mov dx, offset uzenet
	mov ah, 09h
	int 21h

Program_vege:
	mov ax, 4c00h
	int 21h

hiba:
	db 'Nem megengedett karakter!$'
ertek:
	db '*****$'
uzenet:
	db 'Vege a bevitelnek.$'

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
