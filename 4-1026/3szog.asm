
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov ax, 03 ; clear screen
	int 10h

Rajz:
; *
; **
; * *
; *  *
; *****  <- itt a bal also * 10,10-nel legyen

	mov ah, 2
	mov bl, 0
	mov dh, 10 ; sor
	mov dl, 10 ; oszlop
	int 10h

; vizszintes resz:
	mov dl, '*'
;	mov ah, 2
	mov cx, 5 ; 5 db * kell
ciklus1:
	int 21h
	loop ciklus1

; fuggoleges resz:
	mov cl, 6 ; eleg cl-be, nem szukseges cx-be
ciklus2:
;	mov ah, 2
;	mov bl, 0
	mov dl, 10 ; oszlop fix
	mov dh, cl
	int 10h
	mov dl, '*'
	int 21h
	inc cl
	cmp cl, 11
	jl ciklus2

; atfogo:
	mov cl, 6
ciklus3:
	mov dl, cl
	add dl, 4
	mov dh, cl
	int 10h
	mov dl, '*'
	int 21h
	inc cl
	cmp cl, 11
	jl ciklus3

Program_vege:
	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
