;==========================================================================
;Név:
;Neptun kód:
;Dátum:
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
;Karakteres üzemmódban rajzoljon egy derékszügû háromszöget.
;A háromszög egyik csúcsa legyen a 10,10 koordinátán.
;
;A háromszög mérete és elhelyezkedése az alábbi vázlatnak megfelelõ legyen! 
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
;Ide írja a megfelelõ programrészt!


;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;2. feledat: 
;Karakteres üzemmódban írja ki a képernyõre SI értékét bináris formában!
;Használja a balra rotáló (RCL) utasítást, amely a Carry bitet állítja!
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
;Ide írja a megfelelõ programrészt!


;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;3. feledat: 
;Döntse el a megnyomott bilentyûrõl, hogy számot, vagy egyéb karaktert
;"vitt" be! A ciklusból "ESC" billentyû leütésével lehet kilépni.
;Használja a program elõre megírt üzeneteit!
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
;Ide írja a megfelelõ programrészt!


;Eddig
;**************************************************************************
Feladat3_Vege:
;==========================================================================
;4. feledat: 
;Karakteres üzemmódban írja ki a képernyõre SI értékét decimális formában!
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,19		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat4
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,21		;DH:Y koordinata
	int	10h

	mov	si,256
;**************************************************************************
;Ide írja a megfelelõ programrészt!


;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h

	mov ax,3
	int 10h

;==========================================================================
;5. feledat: 
;Karakteres üzemmódban írja ki a "Hello Vilag" uzenetet!
;Használja a meglévõ "uzenet5" sztringet!
;==========================================================================
	mov	dx, offset feladat5
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,2		;DH:Y koordinata
	int	10h

;**************************************************************************
;Ide írja a megfelelõ programrészt!


;Eddig
;**************************************************************************
	xor	ax,ax
	int	16h
;==========================================================================
;6. feledat: 
;Számítsa ki a "muvelet1" sztringben megadott szorzást.
;A két szájegyet elválasztó "*" szimbólumot nem kell feldolgozni!
;A szorzat eredményének megfelelõ karaktert jelenítse meg a képernyõn.
;==========================================================================
	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,4		;DH:Y koordinata
	int	10h

	mov	dx, offset feladat6
	mov	ah,9
	int	21h

	mov	ah, 02h
	mov	bh, 0
	mov	dl,0		;DL:X koordinata
	mov	dh,6		;DH:Y koordinata
	int	10h

;**************************************************************************
;Ide írja a megfelelõ programrészt!


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
feladat4	db	"Negyedik feladat: SI erteke decimalisan.$" 
feladat5	db	"Otodik feladat: uzenet kiiras.$" 
feladat6	db	"Hatodik feladat: szamolas.$" 

Code	Ends

Data	Segment

Data	Ends

Stack	Segment

Stack	Ends
	End	Start

