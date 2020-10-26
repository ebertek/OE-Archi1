
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov ax, 03 ; clear screen
	int 10h

Rajz:
;     *
;    * *
;   *   *
;  *     *
; *       *
;  *     *
;   *   *
;    * *
;     *

	mov ah, 2
	mov bl, 0
	mov dh, 10 ; sor
	mov dl, 10 ; oszlop
	int 10h

	mov dl, '*'
	int 21h

	mov cx, 5
ciklus:
	mov dh, 11 ; bal felso
	sub dh, cl
	mov dl, 9
	add dl, cl
	int 10h
	mov dl, '*'
	int 21h

	mov dh, 11 ; jobb felso
	sub dh, cl
	mov dl, 19
	sub dl, cl
	int 10h
	mov dl, '*'
	int 21h

	mov dh, 15 ; bal also
	sub dh, cl
	mov dl, 15
	sub dl, cl
	int 10h
	mov dl, '*'
	int 21h

	mov dh, 9 ; jobb also
	add dh, cl
	mov dl, 19
	sub dl, cl
	int 10h
	mov dl, '*'
	int 21h

	loop ciklus

Program_vege:
	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
