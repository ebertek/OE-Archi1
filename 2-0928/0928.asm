
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
  

Program_Vege:
	mov ax, 4c00h
	int 21h

szoveg DB "Hello vilag megint!$" ; define byte, olyan adatstruktura, ami bajtokbol all

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
