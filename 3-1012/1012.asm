
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	DS, AX

; set video mode:
  mov ax, 03h ; ah: 00h; al: 03h => text, 80x25, 16/8 colors
  int 10h

; set cursor position:
  mov ah, 02h
  mov bh, 0   ; display page number
  mov dh, 10  ; row
  mov dl, 0   ; column
  int 10h

Beolvas: ; beker egy karaktert, ha Esc, akkor kilep
  xor ax,ax ; ax kinullazasa
  int 16h   ; karakter beolvasasa
  cmp al,27 ; 27 = ESC
  je Program_vege ; ha igaz, kilep
  jmp Beolvas ; kulonben visszater Beolvas elejere

Program_Vege:
	mov ax, 4c00h
	int 21h

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
