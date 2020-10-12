
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	DS, AX
  mov DI, OFFSET DARAB ; attettuk ide aNovel-bol

; set video mode, ettol torlodik a kepernyo:
  mov ax, 03h ; ah: 00h; al: 03h => text, 80x25, 16/8 colors
  int 10h

Kiiras:
; set cursor position:
  mov ah, 02h
  mov bh, 0   ; display page number
  ; mov dh, 10  ; row
  ; mov dl, 0   ; column
  xor dx,dx ; 0. sor, 0. oszlop
  int 10h

  mov ah,9 ; kiiras
  mov dx,offset SZOVEGE
  int 21h

Beolvas: ; beker egy karaktert, megnezi, mi volt
  xor ax,ax ; ax kinullazasa
  int 16h   ; karakter beolvasasa
  cmp al,27 ; 27 = ESC
  je Program_vege ; ha ESC, akkor kilep
  cmp al,'a'
  je aNovel ; ha kis 'a', akkor azt szamoljuk
  jmp Beolvas ; kulonben visszater Beolvas elejere

aNovel:
  ; mov DI, OFFSET DARAB ; attettuk a program elejere
  mov AL,[DI]
  inc AL
  mov [DI],AL
  ; inc byte ptr [di] ; a fenti 3 sor helyett lehetne ezzel is novelni
  jmp Kiiras

Program_Vege:
	mov ax, 4c00h
	int 21h

SZOVEGE DB "Eddig "
DARAB DB '0' ; ASCII, mert azt rogton ki lehet iratni, meg ugyis csak 9-ig megyunk
SZOVEGV DB " db 'a' betu lett lenyomva.$"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
