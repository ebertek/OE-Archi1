
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
	inc al	; szinek :)
	inc di	; dec: masik irany
	loop cik1

	mov cx, 50
cik2:
	mov es:[di], al
	inc al
	add di, 320	; sub: masik irany
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
	inc ah
	dec dx
	jnz kulsocikl2

	xor ax, ax
	int 16h
	mov ax, 100
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 2c: Vizszintesen kitoltott teglalap

	mov dx, 51
	mov al, 65
kulsocikl3:
	mov cx, 101
cikl3:
	mov es:[di], al
	inc di
	loop cikl3
	inc al
	add di, 320
	sub di, 101
	dec dx
	jnz kulsocikl3

	xor ax, ax
	int 16h
	mov ax, 0
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 3a: Rombusz
; Teteje:
	xor bx, bx	; pontok kozotti tavolsag
	mov ah, 65
	mov cx, 50
cikl4:
	sub di, bx	; eloszor 100 marad (line 149)
	mov es:[di],ah
	add di, bx	; vissza kozepre
	add di, bx	; masik oldal
	mov es:[di],ah
	sub di, bx	; vissza kozepre
	inc bx	; ponttavolsag novelese
	add di, 320	; kovi sor
	loop cikl4

; Alja:
	mov bx, 50	; amennyiszer az elobb novelve lett a ciklusvaltozo (line 155)
	mov cx, 50
cikl5:
	sub di, bx
	mov es:[di],ah
	add di, bx
	add di, bx
	mov es:[di],ah
	sub di, bx
	dec bx	; itt most forditva
	add di, 320
	loop cikl5

	xor ax, ax
	int 16h
	mov ax, 50
	mov bx, 320
	mul bx
	add ax, 100
	mov di, ax
; 3b: Egyenlo szaru derekszogu haromszog
; Ugyanaz, mint az elozo, de csak az egyik fele kell, aztan az aljara egy egyenes szakasz
	xor bx, bx	; pontok kozotti tavolsag
	mov ah, 65
	mov cx, 50
cikl6:
	sub di, bx
	mov es:[di], ah
	add di, bx
	add di, bx
	mov es:[di], ah
	sub di, bx
	inc bx
	add di, 320
	loop cikl6

	mov cx, 100
	sub di, bx
cikl7:
	mov es:[di], ah
	inc di
	loop cikl7

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
