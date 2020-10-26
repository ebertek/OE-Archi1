
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
	; loop Vizsg ; beepitett ciklus, ua., mint a kovetkezo ket sor:
	dec cx
	jnz Vizsg

	mov ah, 02h
	mov bh, 0
	mov dh, 10 ; 10. sor
	mov dl, 10 ; 10. oszlop
	int 10h

	mov dx, offset hiba
	mov ah, 09
	int 21h

	jmp Bevitel

Tarol:
	mov [di], al ; bekert karaktert beirjuk az elso * helyere az ertek-ben
	inc di ; noveljuk az indexet, a kovetkezo szam mar a kovetkezo helyre kerul
	mov al, '$'
	mov [di], al ; ott lesz vege az ertek-nek, ahol eppen jarunk

	mov ah, 02h
	mov bh, 0
	mov dh, 5 ; 5. sor
	mov dl, 28 ; 28. oszlop
	int 10h

	mov dx, offset ertek
	mov ah, 09
	int 21h

	mov ax, offset ertek
	add ax, 4
	cmp ax, di
	jnz Bevitel ; 4 db szamot kerunk csak be

	mov ah, 02h
	mov bh, 0
	mov dh, 7
	mov dl, 7
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
