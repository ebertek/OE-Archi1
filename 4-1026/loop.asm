
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	ds, ax

	mov ax, 03 ; clear screen
	int 10h

	mov ah, 2
	mov bl, 0
	mov dh, 0 ; sor
	mov dl, 0 ; oszlop
	int 10h

	mov cx, 20
ciklusA:
	mov dl, 'A'
	int 21h
	loop ciklusA

	mov cx, 40
ciklusB:
	mov dl, 'B'
	int 21h
	loop ciklusB

	mov cx, 80
ciklusC:
	mov dl, 'C'
	int 21h
	loop ciklusC

	mov cx, 160
ciklusD:
	mov dl, 'D'
	int 21h
	loop ciklusD

	mov dl, 10
	int 21h
	mov dl, 13
	int 21h

	mov cx, 20
sajatA:
	mov dl, 'A'
	int 21h
	dec cx
	cmp cx, 0
	jne sajatA

	mov cx, 40
sajatB:
	mov dl, 'B'
	int 21h
	dec cx
	cmp cx, 0
	jne sajatB

	mov cx, 80
sajatC:
	mov dl, 'C'
	int 21h
	dec cx
	cmp cx, 0
	jne sajatC

	mov cx, 160
sajatD:
	mov dl, 'D'
	int 21h
	dec cx
	cmp cx, 0
	jne sajatD

Program_vege:
	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment
Data	Ends

Stack	Segment
Stack	Ends

	End	Start
