
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov dl, 100	; X koordinata
	mov dh, 100	; Y koordinata
	push dx

	mov ax, 13h	; grafikus mod: ah = 00, al = 13; 40x25 (320x200 px), 256 szin -> 64 000 bajt, ami kisebb, mint 64 KiB (ami a lapmeret)
	; pixel -> cim: sor * 320 + oszlop
	; cim -> pixel: cim / 320, egeszresz a sor, maradek az oszlop
	int 10h	; set video mode

	mov ax, 0a000h	; videomemoria kezdocim; 13h-nal a000, 03h-nal b800
	mov es, ax	; extra szegmens (es-en kozvetlenul muvelet nem vegezheto)

Rajz:
	pop dx	; dx-ben Y(dh), X(dl) koordinata
	xor ah, ah
	mov al, dh	; ax-ben Y koordinata
	push dx	; dx mentese, mul utasitas felulirja
	mov bx, 320
	mul bx	; Y koordinata * 320
	; 16 bites: mul bx => bx * ax erteke bekerul dx+ax -be
	; 8 bites: mul bl => bl * al erteke bekerul ah+al -be
	; imul: elojeles szorzas
	pop dx	; dx-ben Y(dh), X(dl) koordinata
	add al, dl
	jnc Pixel
	inc ah	; van atvitel

Pixel:
	push dx
	mov di, ax
	mov al, 128	; pixel szine
	mov es:[di], al	; videomemoriaban beallitja a megfelelo pixel szinet

Var:
	xor ah, ah
	int 16h

	cmp al, 27	; ESC
	jz Program_vege

	cmp ah, 75
	jz Balra

	cmp ah, 77
	jz Jobbra

	cmp ah, 72
	jz Felfele

	cmp ah, 80
	jz Lefele

	jmp Var

Balra:
	pop dx
	dec dl	; szamolas
	cmp dl, 1	; hatarellenorzes
	jnc Tarol
	inc dl
	jmp Tarol

Jobbra:
	pop dx
	inc dl
	cmp dl, 250
	jc Tarol
	dec dl
	jmp Tarol

Felfele:
	pop dx
	dec dh
	cmp dh, 1
	jnc Tarol
	inc dh
	jmp Tarol

Lefele:
	pop dx
	inc dh
	cmp dh, 200
	jc Tarol
	dec dh
	jmp Tarol

Tarol:
	push dx
	jmp Rajz

Program_vege:
	mov ax, 03h	; szoveges mod, 80x25, 16 szin
	int 10h	; set video mode

	pop dx

	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
