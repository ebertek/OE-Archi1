;==========================================================================
;N�v: Ebert David
;Neptun k�d: W81GPX
;D�tum: 2020-11-23
;
;==========================================================================
Code	Segment
	assume CS:Code, DS:Data, SS:Stack


Start:
	mov	ax, Code
	mov	DS, AX

	mov ax,3
	int 10h


;==========================================================================
;1. feledat:
;Karakteres �zemm�dban rajzoljon egy der�ksz�g� h�romsz�get.
;A h�romsz�g egyik cs�csa legyen a 10,10 koordin�t�n.
;
;A h�romsz�g m�rete �s elhelyezked�se az al�bbi v�zlatnak megfelel� legyen!
;x
;xx
;x x
;x  x
;x   x
;x    x
;x     x
;xxxxxxxx
;==========================================================================

	mov	dx, offset feladat1
	mov	ah,9
	int	21h
;**************************************************************************
;Ide �rja a megfelel� programr�szt!
	mov ah, 2
	mov bl, 0
	mov dh, 10 ; sor
	mov dl, 10 ; oszlop
	int 10h ; 10,10 koordinatara megyunk

	mov cl, 10 ; fuggolegesen
cyc1:
	mov dl, 10
	mov dh, cl
	int 10h
	mov dl, 'x'
	int 21h
	inc cl
	cmp cl, 17 ; 8 db
	jle cyc1

	mov cx, 7 ; vizszintesen csak 7 x kiiarasa siman (8.-at az elozo cikl.)
cyc2:
	int 21h
	loop cyc2

	mov cl, 11 ; atfogo
cyc3:
	mov dl, cl
	mov dh, cl
	int 10h
	mov dl, 'x'
	int 21h
	inc cl
	cmp cl, 16
	jle cyc3


;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;2. feledat:
;Karakteres �zemm�dban �rja ki a k�perny�re SI �rt�k�t bin�ris form�ban!
;Haszn�lja a balra rot�l� (RCL) utas�t�st, amely a Carry bitet �ll�tja!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,12		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat2
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,14		;DH:Y koordinata
	int	10h

	mov	si,65534
;**************************************************************************
;Ide �rja a megfelel� programr�szt!

; SI-t at kell valtani 2-es szamrendszerbe: 0 vagy 1
	mov cx, 16 ; 16 bit, addig megy a ciklus, annyi 0 vagy 1 lesz kiirva
cyc4:
	xor dl, dl
	rcl si, 1 ; rotate left, ettol C flagben 1 vagy 0 lesz
	jnc cyc4_0 ; nincs carry
	jc cyc4_1 ; van carry
cyc4_1:
	add dl, '1' ; karakterkent
	int 21h ; kiiras
	jmp cyc4_2
cyc4_0:
	add dl, '0'
	int 21h
cyc4_2:
	loop cyc4

;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;3. feledat:
;D�ntse el a megnyomott bilenty�r�l, hogy sz�mot, vagy egy�b karaktert
;"vitt" be! A ciklusb�l "ESC" billenty� le�t�s�vel lehet kil�pni.
;Haszn�lja a program el�re meg�rt �zeneteit!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,15		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat3
	mov	ah,9
	int	21h

bevitel1:
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,17		;DH:Y koordinata
	int	10h

	xor ah,ah
	int 16h
	cmp al,27
	jz Feladat3_Vege
;**************************************************************************
;Ide �rja a megfelel� programr�szt!

; szam, ha 0 es 9 kozott van
	cmp al, '0'
	jl egyeb
	cmp al, '9'
	jg egyeb
	; ha nem ugrottunk tovabb az egyebre, akkor szam
	mov	dx, offset uzenetszam
	mov	ah, 9
	int	21h
	jmp bevitel1

egyeb:
	mov	dx, offset uzenetnemszam
	mov	ah, 9
	int 21h
	jmp bevitel1

;Eddig
;**************************************************************************
Feladat3_Vege:
;===========================================================================
; 4. feladat:
;
; Sz�molja meg az al�bbi mondat szavait �s �rja ki a  k�perny�re:
;
;	"Az assembly nyelv nem keverendo ossze a gepi koddal!"
;
; Felt�telezz�k, hogy a magyar helyes�r�si szab�lyoknak megfelel�en a szavak
; k�z�tt mindig 1 sz�k�z van!
; Haszn�lja a program el�re meg�rt �zenet�t (mondat)!
;
; 15 perc, 0 vagy 1 pont
;===========================================================================
	mov	ax, 03h
	int	10h

	mov	ah,9
	mov	dx, offset feladat4
	int	21h

	mov     dh, 2
	mov     dl, 5
	xor     bx, bx
	mov     ah, 02
	int     10h

	mov	ah,9
	mov	dx, offset mondat
	int	21h

	mov     dh, 3
	mov     dl, 5
	xor     bx, bx
	mov     ah, 02
	int     10h

	mov	ah,9
	mov	dx, offset feladat4_1
	int	21h

	xor	ax, ax
	xor	bx, bx
	xor	cx, cx
	xor	dx, dx
	xor di, di
	xor si, si


; --------------------------------------------------------------------------
; Ide �rja a megfelel� programr�szt!
	mov si, 0
	mov cx, 0
szamol:
;	cmp mondat[si], '$'
;	je vege
;	cmp mondat[si], ' '
;	jne nemszokoz ; valamiert ez phase error hibat dob

szokoz:
;	inc cx ; ha szokoz

nemszokoz:
;	inc si
;	jmp szamol
vege:
;	mov dl, cl
;	add dl, '0' ; vissza a szamot karakterre
;	mov ah, 2 ; kiiras
;	int 21h

; Eddig
; --------------------------------------------------------------------------
; V�rakoz�s billenty� le�t�sre
	xor ax, ax
	int 16h

;==========================================================================
;5. feledat:
;Karakteres �zemm�dban �rja ki a "Hello Vilag" uzenetet!
;Haszn�lja a megl�v� "uzenet5" sztringet!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,6		;DH:Y koordinata

	mov	dx, offset feladat5
	mov	ah,9
	int	21h

	int	10h

;**************************************************************************
;Ide �rja a megfelel� programr�szt!


;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;6. feledat:
;Sz�m�tsa ki a "muvelet1" sztringben megadott szorz�st.
;A k�t sz�jegyet elv�laszt� "*" szimb�lumot nem kell feldolgozni!
;A szorzat eredm�ny�nek megfelel� karaktert jelen�tse meg a k�perny�n.
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,10		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat6
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,12		;DH:Y koordinata
	int	10h

;**************************************************************************
;Ide �rja a megfelel� programr�szt!
	xor ax, ax ; urites
	mov si, offset muvelet1
	mov al, [si]
	sub al, '0' ; atalakitas szamma
	inc si ; itt van a csillag
	inc si ; itt a masik szam
	mov bl, [si]
	sub bl, '0'
	mul bl ; maga a szorzas
	mov cx, ax
	mov dx, ax
	add dx, '0' ; igy jo lenne, ha <= 9 lenne ..
	mov ah, 2 ; kiiras
	int 21h

;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h

Program_Vege:
	mov	ax, 4c00h
	int	21h

uzenetszam	db	"Szamjegy lett leutve!    $"
uzenetnemszam	db	"Nem szamjegy lett leutve!$"
uzenet5		db	"!indula gorog a ludnI"
muvelet1	db	"5*7"

feladat1	db	"Elso feladat: derekszogu haromszog.$"
feladat2	db	"Masodik feladat: SI erteke binarisan.$"
feladat3	db	"Harmadik feladat: szamjegy bevitele.(ESC=kilepes)$"

feladat4	db	"4. feladat: Szavak szama az alabbi mondatban:$"
feladat4_1	db	"Szavak szama: $"
mondat		db	"Az assembly nyelv nem keverendo ossze a gepi koddal!$"

feladat5	db	10,13,"Otodik feladat: uzenet kiiras.$"
feladat6	db	"Hatodik feladat: szamolas.$"

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start
