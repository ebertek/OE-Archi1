
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

	mov cl, 6 ; bal felso
ciklus1:
	mov dh, cl
	mov dl, 20
	sub dl, cl
	int 10h
	mov dl, '*'
	int 21h

	inc cl
	cmp cl, 10
	jng ciklus1

	mov cl, 7 ; jobb felso
ciklus2:
	mov dh, cl
	mov dl, 8
	add dl, cl
	int 10h
	mov dl, '*'
	int 21h

	inc cl
	cmp cl, 10
	jng ciklus2

	mov cl, 11 ; jobb also
ciklus3:
	mov dh, cl
	mov dl, 28
	sub dl, cl
	int 10h
	mov dl, '*'
	int 21h

	inc cl
	cmp cl, 14
	jng ciklus3

	mov cl, 11 ; bal also
ciklus4:
	mov dh, cl
	mov dl, 0
	add dl, cl
	int 10h
	mov dl, '*'
	int 21h

	inc cl
	cmp cl, 13
	jng ciklus4

Program_vege:
	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
