
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	DS, AX

  ; hello world, karakterenkent:
  mov AH,2 ; DOS Fn 02H: Send the character in DL to stdout
  mov DL, 'H'
  int 21h
  mov DL, 'e'
  int 21h
  mov DL, 'l'
  int 21h
  int 21h
  mov DL, 'o'
  int 21h
  mov DL, ' '
  int 21h
  mov DL, 'v'
  int 21h
  mov DL, 'i'
  int 21h
  mov DL, 'l'
  int 21h
  mov DL, 'a'
  int 21h
  mov DL, 'g'
  int 21h
  mov DL, '!'
  int 21h
  mov DL, 10
  int 21h
  mov DL, 13
  int 21h

  ; hello world, egyben
  mov AH,9 ; DOS Fn 09H:  DS:DX address of a string terminated with $
  mov DX, OFFSET szoveg ; DS:DX-be cimet, DS-ben mar AX van, amiben meg a Code
  int 21h

  mov AH,2
  mov DL, 10
  int 21h
  mov DL, 13
  int 21h

  ; szammuveletek
  mov AH,2
  mov DL,'A'
  inc DL ; 'B'
  sub DL,2 ; '@'
  add DL,3 ; 'C'
  dec DL ; 'B'
  int 21h

  mov AH,2
  mov DL, 10
  int 21h
  mov DL, 13
  int 21h

  ; ugralas, osszehasonlitas
  mov AH,2
  cmp AH,3 ; csak flageket (OSZPAC) allit
  jz pEgyenlo ; jump if zero. a je (jump if equal) ugyanezt csinalja. a jnz pedig ugyanazt, amit a jne.

  mov AH,9
  mov DX, OFFSET negyenlo
  int 21h
  jmp Tovabb

pEgyenlo:
  mov AH,9
  mov DX, OFFSET egyenlo
  int 21h

Tovabb:
  mov AH,2
  mov DL, 10
  int 21h
  mov DL, 13
  int 21h

  mov ah,2
  cmp ah,1
  jg pNagyobb
  jl pKisebb

  ; ha nem nagyobb es nem is kisebb, akkor egyenlo:
  mov AH,9
  mov DX, OFFSET egyenlo
  int 21h

  ; a mov AH,9 / int 21h sorokat lehetne optimalizalni

pKisebb:
  mov AH,9
  mov DX, OFFSET kisebb
  int 21h
  jmp MegTovabb

pNagyobb:
  mov AH,9
  mov DX, OFFSET nagyobb
  int 21h

MegTovabb:
  mov AH,2
  mov DL, 10
  int 21h
  mov DL, 13
  int 21h

  ; bitwise muveletek:
  ; shl (x2), shr (/2), rol (ami az egyik oldalt kimegy, az a masikon bejon), ror
  ; and, or, xor -> ezek is bitenkenti muveletek, nem logikaiak
  ; not -> egy operandusu, invertalja a biteket
  ; neg -> kettes komplemenst kepez

  ; regiszter kinullazasara modszerek:
  mov ax,0
  sub ax,ax
  xor ax,ax ; ez talan a leggyorsabb

Program_Vege:
	mov ax, 4c00h
	int 21h

szoveg DB "Hello vilag megint!$" ; define byte, olyan adatstruktura, ami bajtokbol all
egyenlo DB "Egyenlo!$"
negyenlo DB "Nem egyenlo!$"
nagyobb DB "Nagyobb$"
kisebb DB "Kisebb$"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
