
Code	Segment
	assume CS:Code, DS:Data, SS:Stack

Start:
	mov	ax, Code
	mov	DS, AX

; set video mode, ettol torlodik a kepernyo:
  mov ax, 03h ; ah: 00h; al: 03h => text, 80x25, 16/8 colors
  int 10h
; jelen esetben ezt eleg egyszer lefuttatni, ugyanoda fogjuk kiirni a szoveget

Kiiras:
; set cursor position:
  mov ah, 02h
  mov bh, 0   ; display page number
  ; mov dh, 10  ; row
  ; mov dl, 0   ; column
  xor dx,dx ; 0. sor, 0. oszlop
  int 10h

  mov ah,9 ; kiiras
  mov dx,offset SZOVEGE ; SZOVEGE es DARAB nem $-re vegzodik, ugyhogy ki fogja irni az egeszet
  int 21h

  mov ah,2
  mov dl,10
  int 21h
  mov dl,13
  int 21h

  mov ah,9
  mov dx,offset bszoveg1
  int 21h
  mov dx,offset bszamlalo
  int 21h
  mov dx,offset bszoveg2
  int 21h

  mov ah,2
  mov dl,10
  int 21h
  mov dl,13
  int 21h

  mov ah,9
  mov dx,offset cszoveg1
  int 21h
  mov dx,offset cszamlalo
  int 21h
  mov dx,offset cszoveg2
  int 21h

  mov ah,2
  mov dl,10
  int 21h
  mov dl,13
  int 21h

  mov ah,9
  mov dx,offset dszoveg1
  int 21h
  mov dx,offset dszamlalo
  int 21h
  mov dx,offset dszoveg2
  int 21h

  mov ah,2
  mov dl,10
  int 21h
  mov dl,13
  int 21h

Beolvas: ; beker egy karaktert, megnezi, mi volt
  xor ax,ax ; ax kinullazasa
  int 16h   ; karakter beolvasasa
  cmp al,27 ; 27 = ESC
  je Program_vege ; ha ESC, akkor kilep
  cmp al,'a'
  je aNovel ; ha kis 'a', akkor azt szamoljuk
  cmp al,'A'
  je aNovel
  cmp al,'b'
  je bNovel
  cmp al,'B'
  je bNovel
  cmp al,'c'
  je cNovel
  cmp al,'C'
  je cNovel
  cmp al,'d'
  je dNovel
  cmp al,'D'
  je dNovel
  jmp Beolvas ; kulonben visszater Beolvas elejere

aNovel:
  mov DI, OFFSET DARAB
  jmp Novel

bNovel:
  mov DI, OFFSET bszamlalo
  jmp Novel

cNovel:
  mov DI, OFFSET cszamlalo
  jmp Novel

dNovel:
  mov DI, OFFSET dszamlalo

Novel:
  mov AL,[DI]
  inc AL
  mov [DI],AL
  jmp Kiiras

Program_Vege:
	mov ax, 4c00h
	int 21h

SZOVEGE DB "Eddig "
DARAB DB '0' ; ASCII, mert azt rogton ki lehet iratni, meg ugyis csak 9-ig megyunk
SZOVEGV DB " db 'a' vagy 'A' betu lett lenyomva.$"
bszoveg1 db "A 'b' vagy 'B' billentyu $"
bszamlalo db "0$"
bszoveg2 db " alkalommal volt leutve.$"
cszoveg1 db "A 'c' vagy 'C' billentyu $"
cszamlalo db "0$"
cszoveg2 db " alkalommal volt leutve.$"
dszoveg1 db "A 'd' vagy 'D' billentyu $"
dszamlalo db "0$"
dszoveg2 db " alkalommal volt leutve.$"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
