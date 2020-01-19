;it draw a row on graphic pixel from x to y
DRow macro sx,ex,y,color
	local label1
	push cx
	push dx
	mov cx,sx
	mov dx,y
label1:
	mov ah,0ch
	mov bh,0
	mov al,color
	inc cx
	cmp cx,ex
	int 10h
	jnz label1
	pop dx
	pop cx
endm


;it draw column on the graphical pixel form x to y
DColumn macro sy,ey,x,color
	local label2
	push cx
	push dx
	mov cx,x
	mov dx,sy
label2:
	mov ah,0ch
	mov bh,0
	mov al,color
	inc dx
	cmp dx,ey
	int 10h
	jnz label2
	pop dx
	pop cx
endm

drawball macro x,y,color
	DRow x,x+7,y,color
	DRow x-1,x+8,y+1,color
	DRow x-2,x+9,y+2,color
	DRow x-3,x+10,y+3,color
	;.DRow x+4,x+5,y+3,04h		;eye with black color
	DRow x-3,x+8,y+4,color
	DRow x-3,x+9,y+5,color
	DRow x-3,x+10,y+6,color
	DRow x-3,x+10,y+7,color
	DRow x-2,x+9,y+8,color
	DRow x-1,x+9,y+9,color
	DRow x,x+9,y+10,color
endm


drawsquare macro x,y,color
	DRow x,x+5,y,color
	DRow x,x+5,y+1,color
	DRow x,x+5,y+2,color
	DRow x,x+5,y+3,color
	DRow x,x+5,y+4,color

endm



SETCURSOR MACRO ROW,COL
MOV AH,02		;FUNCTION
MOV BH,0H		;PAGE NUMBER
MOV DH,ROW		;ROW TO SET CURSOR
MOV DL,COL		;COLUMN TO  SET CURSOR
INT 10H
ENDM


printstring  macro n
lea dx,n
mov ah,09
int 21h

endm


;draw the A on the graphics
;Draw Right
;drawA macro x,y,color
	
;endm


;main starts from there
.model small
.STACK 100H
.DATA
;main starts from there
.model small
.STACK 100H
.DATA
ballx dw 30h			;it draw the ball at x position
bally dw 20h			;it draw the ball at y position
ballcolor db 01Eh	;it draw the color of the pacman
backcolor db 10h	;its color is blue in 16 color
a1 db '  Press Space to Continue....$'


.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
;to clear screen
    mov ah,06
	mov al,0
	mov bh,20h
	mov cx,0
	mov dx,184fh
	int 10h
	
;for read pixel in G.mode	
	mov ah,00h
	mov al,0dh ; for read 
	int 10h
	
	
;to change background color 
	mov ah,0bh ;for set back ground color in G.mode put ah=obh
	mov bh,00h ;pg number
	mov bl,11h ;color light cyan
	int 10h
	

	
	
	
	
	SETCURSOR 16,6	;SETTING CURSOR FOR 1ST STRING BY MACRO
    printstring a1
	
	
	
	;draw a baorder		
	DRow 5h,139h,5h,04h 		;for upper line
	DRow 5h,139h,3h,04h
	DRow 5h,139h,90h+32h,04h	 ;for lower line 
	DRow 5h,139h,90h+34h,04h
	DColumn 5h,90h+32h,5h,04h	;left line
	DColumn 5h,90h+32h,3h,04h
	DColumn 5h,90h+32h,130h+9h,04h  ;right line
	DColumn 5h,90h+32h,132h+9h,04h

	
	;draw A for a line
	
	DRow 29h,3fh,10h,03h
	DRow 29h,3fh,11h,03h
	DRow 29h,3fh,13h,03h ;3d
	DColumn 12h,2eh,29h,03h
	DColumn 12h,2eh,2ah,03h
	DColumn 12h,2eh,27h,03h ;3d
	DColumn 12h,2eh,3fh,03h
	DColumn 12h,2eh,40h,03h
	DColumn 12h,2eh,42h,03h
	DRow 2ch,3dh,1fh,03h  ;center line 
	DRow 2ch,3dh,20h,03h
	DRow 2ch,3dh,1eh,03h
	DRow 2ch,3dh,22h,03h  ;3d
	
	;Draw R  for line
	
	DRow 49h,60h,10h,03h
	DRow 49h,60h,11h,03h
	DRow 49h,60h,13h,03h ;3D
	DColumn 12h,2fh,49h,03h
	DColumn 12h,2fh,4ah,03h
	DColumn 12h,2fh,4Ch,03h
	DRow 49h,5fh,1fh,03h  ;center line 
	DRow 49h,5fh,20h,03h
	DRow 49h,5fh,22h,03h  ;3D
	DColumn 12h,1fh,5fh,03h
	DColumn 12h,1fh,60h,03h
	DColumn 12h,1fh,62h,03h

	;for curve line
	DRow 4bh,4dh,21h,03h
	DRow 4dh,4fh,22h,03h
	DRow 4fh,51h,23h,03h
	DRow 51h,53h,24h,03h
	DRow 53h,55h,25h,03h
	DRow 55h,57h,26h,03h;;
	DRow 57h,59h,27h,03h
	DRow 59h,5bh,28h,03h
	DRow 5bh,5dh,29h,03h
	DRow 5dh,5fh,2ah,03h
	DRow 5eh,5fh,2bh,03h
	DRow 5dh,5fh,2ch,03h
	;;
	DRow 4bh,4dh,22h,03h
	DRow 4dh,4fh,23h,03h
	DRow 4fh,51h,24h,03h
	DRow 51h,53h,25h,03h
	DRow 53h,55h,26h,03h
	DRow 55h,57h,27h,03h;;
	DRow 57h,59h,28h,03h
	DRow 59h,5bh,29h,03h
	DRow 5bh,5dh,2ah,03h
	DRow 5dh,5fh,2bh,03h
	DRow 5eh,5fh,2ch,03h
	DRow 5dh,5fh,2dh,03h
	
	; 3D
	
	DRow 4bh,4dh,24h,03h
	DRow 4dh,4fh,26h,03h
	DRow 4fh,51h,28h,03h
	DRow 51h,53h,2Ah,03h
	DRow 53h,55h,2Ch,03h
	
	DColumn 2dh,2fh,60h,03h
	DColumn 2dh,2fh,61h,03h 
	DColumn 2dh,2fh,62h,03h
	;DColumn 2dh,30h,61h,03h 
	
	;DRAW 2nd R FOR LINE
	
	DRow 69h,80h,10h,03h
	DRow 69h,80h,11h,03h
	DRow 69h,80h,13h,03h ;3D
	DColumn 12h,2fh,69h,03h
	DColumn 12h,2fh,6ah,03h
	DColumn 12h,2fh,6Ch,03h
	
	DRow 69h,7fh,1fh,03h  ;center line 
	DRow 69h,7fh,20h,03h
	DRow 69h,7fh,22h,03h ;3D
	DColumn 12h,1fh,7fh,03h
	DColumn 12h,1fh,80h,03h
	DColumn 12h,1fh,82h,03h
	
	;for Curve Line
	
	DRow 6bh,6dh,21h,03h
	DRow 6dh,6fh,22h,03h
	DRow 6fh,71h,23h,03h
	DRow 71h,73h,24h,03h
	DRow 73h,75h,25h,03h
	DRow 75h,77h,26h,03h;;
	DRow 77h,79h,27h,03h
	DRow 79h,7bh,28h,03h
	DRow 7bh,7dh,29h,03h
	DRow 7dh,7fh,2ah,03h
	DRow 7eh,7fh,2bh,03h
	DRow 7dh,7fh,2ch,03h
	;;
	DRow 6bh,6dh,22h,03h
	DRow 6dh,6fh,23h,03h
	DRow 6fh,71h,24h,03h
	DRow 71h,73h,25h,03h
	DRow 73h,75h,26h,03h
	DRow 75h,77h,27h,03h;;
	DRow 77h,79h,28h,03h
	DRow 79h,7bh,29h,03h
	DRow 7bh,7dh,2ah,03h
	DRow 7dh,7fh,2bh,03h
	DRow 7eh,7fh,2ch,03h
	DRow 7dh,7fh,2dh,03h
	
	; 3D
	
	DRow 6bh,6dh,24h,03h
	DRow 6dh,6fh,26h,03h
	DRow 6fh,71h,28h,03h
	DRow 71h,73h,2Ah,03h
	DRow 73h,75h,2Ch,03h
	DRow 75h,77h,2Eh,03h;;
	
	DColumn 2dh,2fh,7fh,03h
	DColumn 2dh,2fh,80h,03h 
	DColumn 2dh,2fh,81h,03h 

	; Draw an O for line
	
	DRow 89h,9fh,10h,03h
	DRow 89h,9fh,11h,03h
	DRow 89h,9fh,13h,03h  ;3D
	DColumn 12h,2fh,89h,03h
	DColumn 12h,30h,8ah,03h
	DColumn 12h,30h,8Ch,03h  ;3D
	DRow 8dh,9bh,1fh,11h  ;center line 
	DRow 8dh,9bh,20h,11h
	DRow 8dh,9bh,22h,11h  ;3D
	DColumn 12h,2fh,9fh,03h
	DColumn 12h,30h,9fh+01h,03h
	DColumn 12h,30h,9fh+03h,03h  ;3D
	DRow 89h,9fh,2fh,03h  ;end line 
	DRow 89h,9fh,30h,03h
	DRow 89h,9fh,32h,03h

	; Draw Arrow revolver
	
	; Draw an O e
	
	DRow 0F9h,10Fh,10h,03h
	DRow 0F9h,10Fh,11h,03h
	DColumn 12h,2fh,0F9h,03h
	DColumn 12h,30h,0F9h,03h
	DRow 0F9h,10Fh,12h,11h  ;center line 
	DRow 0FFh,11Fh,20h,11h
	DRow 0FFh,11Fh,22h,11h
	; FOR ARROW HEAD
	;Column 14H,15H,10FH,11H
	;DColumn 14H,16H,110H,11H
;	DColumn 14H,17H,111H,11H
	;DColumn 14H,18H,112H,11H
	;DColumn 14H,19H,113H,11H
	;DColumn 14H,1AH,114H,11H
	;DColumn 14H,1BH,116H,11H
	
	DColumn 1AH,27H,119H,11H
	DColumn 1BH,27H,119H,11H
	DColumn 1CH,26H,11AH,11H
	DColumn 1DH,25H,11BH,11H
	DColumn 1EH,24H,11CH,11H
	DColumn 1FH,23H,11DH,11H
	DColumn 20H,22H,11EH,11H
	DColumn 20H,21H,11FH,11H
	DColumn 12h,2fh,9fh,03h
	DColumn 12h,30h,9fh+01h,03h
	DColumn 12h,30h,9fh+03h,03h
	DColumn 12h,30h,0F9h-02h,03h
	
	DRow 0F9h,10Fh,12h,03h  ;end line 
	DRow 0F9h,10Fh,1Fh,03h
	DRow 0F9h,10Fh,1Ah,03h
	DRow 0F9h,10Fh,2Fh,03h
	DRow 0F9h,10Fh,30h,03h
	DRow 0F9h,10Fh,32h,03h
	DRow 0F9h,10Fh,22h,03h
	DRow 0F9h,10Fh,24h,03h
	DRow 0F9h,10Fh,2Ah,03h
	DRow 0F9h,10Fh,2Ch,03h
	
	; Draw W for a line
	DColumn 10h,31h,0A9h,03h
	DColumn 10h,31h,0Aah,03h
	DColumn 10h,31h,0ACh,03h  ;3D
	
	;DRow 0Aah,0C9h,1fh,11h  ;center line 
	;DRow 0Aah,0Cah,31h,11h   ; end line
	
	DColumn 10h,31h,0C9h,03h
	DColumn 10h,31h,0Cah,03h
	DColumn 10h,31h,0CCh,03h  ;3D
;;
	;for left Curve Line
	
	DRow 0Aah,0Ach,31h,03h ;
	DRow 0Ach,0Aeh,30h,03h
	DRow 0Aeh,0B0h,2fh,03h
	DRow 0B0h,0B2h,2eh,03h
	DRow 0B2h,0B4h,2dh,03h
	DRow 0B4h,0B6h,2ch,03h
	DRow 0B6h,0B8h,2bh,03h
	DRow 0B8h,0B9h,2ah,03h
	DRow 0B9h,0Bbh,29h,03h
	DRow 0Bbh,0Bdh,28h,03h
	DRow 0Bdh,0Bfh,27h,03h
	DRow 0Bdh,0Bfh,26h,03h
	DRow 0Bah,0Bfh,25h,03h

	;; 3D
	
	DRow 0Aah,0Ach,30h,03h ;
	DRow 0Ach,0Aeh,3Eh,03h
	DRow 0Aeh,0B0h,2Ch,03h
	DRow 0B0h,0B2h,2Ah,03h
	DRow 0B2h,0B4h,28h,03h
	
	;;
	DRow 0Aah,0Ach,30h,11h ;
	DRow 0Ach,0Aeh,2fh,11h
	DRow 0Aeh,0B0h,2eh,11h
	DRow 0B0h,0B2h,2dh,11h
	DRow 0B2h,0B4h,2ch,11h
	DRow 0B4h,0B6h,2bh,11h
	DRow 0B6h,0B8h,2ah,11h
	DRow 0B8h,0B9h,29h,11h
	DRow 0B9h,0Bbh,28h,11h
	DRow 0Bbh,0Bdh,27h,11h
	DRow 0Bdh,0Bfh,26h,11h 
	DRow 0Bdh,0Bfh,25h,11h
	DRow 0Bah,0Bfh,24h,03h
	
	DRow 0B3h,0B6h,24h,03h
	DRow 0B3h,0B6h,25h,03h
	DRow 0B3h,0B6h,24h,03h
	
	; For Right curve
	;DColumn 2dh,2fh,80h,03h 
	;DColumn 2dh,2fh,81h,03h
	
	DRow 0C8h,0Cah,31h,03h ;
	DRow 0C6h,0C8h,30h,03h
	DRow 0C4h,0C6h,2fh,03h
	DRow 0C2h,0C4h,2eh,03h
	DRow 0C0h,0C2h,2dh,03h
	DRow 0Bfh,0C0h,2ch,03h
	DRow 0Bdh,0Bfh,2bh,03h
	DRow 0Bbh,0Bdh,2ah,03h
	DRow 0B9h,0Bbh,29h,03h
	DRow 0B7h,0B9h,28h,03h
	DRow 0B5h,0B7h,27h,03h
	DRow 0B3h,0B5h,26h,03h
	DRow 0B3h,0B4h,25h,03h
	
	DRow 0C8h,0Cah,30h,11h ;
	DRow 0C6h,0C8h,2fh,11h
	DRow 0C4h,0C6h,2eh,11h
	DRow 0C2h,0C4h,2dh,11h
	DRow 0C0h,0C2h,2ch,11h
	DRow 0Bfh,0C0h,2bh,11h
	DRow 0Bdh,0Bfh,2ah,11h
	DRow 0Bbh,0Bdh,29h,11h
	DRow 0B9h,0Bbh,28h,11h
	DRow 0B7h,0B9h,27h,11h
	DRow 0B5h,0B7h,26h,11h
	DRow 0B3h,0B5h,25h,11h
	DRow 0B3h,0B4h,24h,11h	
	
	; 3D
	DRow 0C8h,0Cah,30h,03h ;
	DRow 0C6h,0C8h,2Eh,03h
	DRow 0C4h,0C6h,2Ch,03h
	DRow 0C2h,0C4h,2Bh,03h
	DRow 0C0h,0C2h,29h,03h
	
	
	; S IN NEW LINE 
	
	DRow 39h,50h,43h,03h  ;for 3d
	DRow 39h,50h,40h,03h
	DRow 39h,50h,41h,03h
	DColumn 42h,4Eh,39h,03h
	DColumn 42h,4fh,3ah,03h
	DColumn 42h,4fh,3ch,03h  ; 3d
	DRow 39h,4fh,4fh,03h  ;center line 
	DRow 39h,4fh,50h,03h
	DRow 39h,4fh,52h,03h  ;3d
;DColumn 51h,5fh,4eh,03h
;DColumn 52h,60h,4fh,03h
	;
	DColumn 51h,5fh,4fh,03h
	DColumn 51h,60h,50h,03h
	DColumn 51h,60h,52h,03h  ;3d
	
	DRow 39h,4fh,5fh,03h  ;center line 
	DRow 39h,4fh,60h,03h
	DRow 39h,4fh,62h,03h

	; fOR H
	
	DColumn 40h,61h,59h,03h
	DColumn 40h,61h,5ah,03h
	DColumn 40h,61h,5ch,03h
	
	DRow 59h,70h,50h,03h  ;Cen line 
	DRow 59h,70h,51h,03h 
	DRow 59h,70h,53h,03h
	
	DColumn 40h,61h,70h,03h
	DColumn 40h,61h,71h,03h
	DColumn 40h,61h,73h,03h
	
	; Draw an O for line
	
	DRow 79h,8fh,40h,03h
	DRow 79h,8fh,41h,03h
	DRow 79h,8fh,43h,03h
	DColumn 42h,5fh,79h,03h
	DColumn 42h,60h,7ah,03h
	DColumn 42h,60h,7ch,03h
	DRow 7dh,8bh,4fh,11h  ;center line 
	DRow 7dh,8bh,50h,11h
	DRow 7dh,8bh,4dh,11h
	DColumn 42h,5fh,8fh,03h
	DColumn 42h,60h,8fh+01h,03h
	DColumn 42h,60h,8fh+03h,03h
	DRow 79h,8fh,5fh,03h  ;end line 
	DRow 79h,8fh,60h,03h  
	DRow 79h,8fh,62h,03h  ;for 3d

	
		; Draw 	2nd O for line 0afh
	
	DRow 99h,0afh,40h,03h
	DRow 99h,0afh,41h,03h
	DRow 99h,0afh,43h,03h
	DColumn 42h,5fh,99h,03h
	DColumn 42h,60h,9ah,03h
	DColumn 42h,60h,9ch,03h ;for 3d
	DRow 9dh,0abh,4fh,11h  ;center line 
	DRow 9dh,0abh,50h,11h
	DRow 9dh,0abh,4dh,11h
	DColumn 42h,5fh,0afh,03h
	DColumn 42h,60h,0afh+01h,03h
	DColumn 42h,60h,0afh+03h,03h
	DRow 99h,0afh,5fh,03h  ;end line 
	DRow 99h,0afh,60h,03h
	DRow 99h,0afh,62h,03h
	
	; for T 
	
	DRow 0b9h,0cfh,40h,03h
	DRow 0b9h,0cfh,41h,03h
	DRow 0b9h,0cfh,43h,03h
	DColumn 42h,60h,0c3h,03h
	DColumn 42h,60h,0c4h,03h
	DColumn 42h,60h,0c6h,03h
	
	; for E 
	
	DRow 0D9h,0Efh,40h,03h
	DRow 0D9h,0Efh,41h,03h
	DRow 0D9h,0Efh,42h,03h
	DColumn 42h,60h,0DAh,03h
	DColumn 42h,60h,0DBh,03h
	DColumn 42h,60h,0DEh,03h
	
	DRow 0D9h,0Efh,4Fh,03h  ; FOR CENTER
	DRow 0D9h,0Efh,4Fh,03h
	DRow 0D9h,0Efh,52h,03h
	
	DRow 0D9h,0Efh,5fh,03h
	DRow 0D9h,0Efh,60h,03h
	
	
	;DRAW  R FOR LINE
	
	DRow 0F9h,10Fh,40h,03h
	DRow 0F9h,10Fh,41h,03h
	DRow 0F9h,10Fh,42h,03h
	DColumn 42h,60h,0Fah,03h
	DColumn 42h,60h,0Fbh,03h
	DColumn 42h,60h,0Fdh,03h
	DRow 0F9h,10Fh,50h,03h  ;center line 
	DRow 0F9h,10Fh,51h,03h
	DColumn 42h,50h,10Fh,03h
	DColumn 42h,51h,101h,03h
	
	;for Curve Line
	
	DRow 0F9h,0Fbh,51h,03h
	DRow 0Fbh,0Fdh,52h,03h
	DRow 0Fdh,0Ffh,53h,03h
	DRow 0Ffh,101h,54h,03h
	DRow 101h,103h,55h,03h
	DRow 104h,106h,56h,03h;;
	DRow 105h,108h,57h,03h
	DRow 107h,109h,58h,03h
	DRow 109h,10bh,59h,03h
	DRow 10bh,10ch,5ah,03h
	DRow 10ch,10eh,5bh,03h
	DRow 10eh,10fh,5ch,03h
	DRow 10dh,10fh,5dh,03h
	DRow 10eh,10fh,5eh,03h
	DRow 10dh,10fh,5fh,03h
	;Row 10fh,110h,5fh,03h
	
	;;
	
	DRow 0F9h,0Fbh,52h,03h
	DRow 0Fbh,0Fdh,53h,03h
	DRow 0Fdh,0Ffh,54h,03h
	DRow 0Ffh,101h,55h,03h
	DRow 101h,104h,56h,03h
	DRow 104h,106h,57h,03h;;
	DRow 105h,108h,58h,03h
	DRow 107h,109h,59h,03h
	DRow 109h,10bh,5ah,03h
	DRow 10bh,10ch,5bh,03h
	DRow 10ch,10eh,5ch,03h
	DRow 10eh,10fh,5dh,03h
	DRow 10dh,10fh,5eh,03h
	DRow 10eh,10fh,5fh,03h
	DRow 10dh,10fh,5fh,03h
;DRow 10fh,110h,5fh,03h
	
	; 3d

	DRow 0Fah,0Fbh,54h,03h
	DRow 0Fbh,0Fdh,56h,03h
	DRow 0Fdh,0Ffh,58h,03h
	DRow 0Ffh,101h,5ah,03h
	DRow 101h,104h,5ch,03h
	DRow 104h,106h,5eh,03h;;
	
	; for up line

	DRow 5h,139h,90h,05h	;for lower line
	
	
	
	
	
	
	
	
    
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; p for present to ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DRow 10h,20h,92h,03h
	DRow 10h,20h,94h,03h
	DRow 10h,20h,95h,03h ;3D
	
	DColumn 96h,0b2h,11h,03h
	DColumn 96h,0b2h,12h,03h
	DColumn 96h,0b2h,10h,03h
	DColumn 96h,0b2h,10h-2,03h
	
	DRow 11h,20h,0a1h,03h  ;center line
	DRow 11h,21h,0a2h,03h  ;center line
	DRow 11h,20h,0a4h,03h  ;center line
	
	DColumn 96h,0a2h,21h,03h
	DColumn 96h,0a2h,22h,03h
	DColumn 96h,0a2h,24h,03h
	
	DRow 2Bh,2Fh,0a1h,03h  ;center line
	DRow 2ch,2Fh,0a2h,03h
	DRow 2ch,2Fh,0a3h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOR T ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DRow 35h,4ah,92h,03h 
	DRow 35h,4ah,94h,03h
	DRow 35h,4ah,95h,03h
	DRow 35h,4ah,96h,03h
	
	DColumn 96h,0b2h,40h,03h
	DColumn 96h,0b2h,41h,03h
	DColumn 96h,0b2h,42h,03h
	DColumn 98h,0b2h,42h+2,03h
	
	DRow 2Bh,2Fh,0a1h,03h
	
	DRow 4fh,54h,9ah,03h
	DRow 4fh,54h,9bh,03h
	DRow 4fh,54h,9ch,03h
	
	DRow 4Fh,54h,0aah,03h
	DRow 4Fh,54h,0abh,03h
	DRow 4Fh,54h,0ach,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for S of Sir  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 59h,6fh,92h,03h  ;for 3d
	DRow 59h,6fh,94h,03h
	DRow 59h,6fh,95h,03h
	
	
	
	DColumn 92h,9Eh,59h,03h
	DColumn 92h,9fh,5ah,03h
	DColumn 92h,9fh,5ch,03h  ; 3d
	
	
	
	
	DRow 59h,6fh,9fh,03h  ;center line 
	DRow 59h,6fh,0ah,03h
	DRow 59h,6fh,0ch,03h  ;3d
	;DColumn 51h,5fh,4eh,03h
	;DColumn 52h,60h,4fh,03h
	
	
	
	
	
	DColumn 0a1h,0afh,6fh,03h
	DColumn 0a1h,0afh,70h,03h
	DColumn 0a1h,0afh,72h,03h  ;3d
	
	
	
	
	
	DRow 59h,6fh,0b1h,03h  ;center line 
	DRow 59h,6fh,0b2h,03h
	DRow 59h,6fh,0b4h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for I of Sir  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DRow 7eh-7,93h-7,93h,03h 
	DRow 7eh-7,93h-7,94h,03h
	DRow 7eh-7,93h-7,96h,03h  ; 3d
	
	;DColumn 96h,0b2h,8ah,03h
	DColumn 96h,0b2h,89h-5,03h
	DColumn 96h,0b2h,88h-5,03h
	DColumn 96h,0b2h,86h-5,03h ;3d
	
	DRow 7eh-7,93h-7,0b0h,03h 
	DRow 7eh-7,93h-7,0b1h,03h
	DRow 7eh-7,93h-7,0b3h,03h       ; 3d	
	
	
	
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;; for R of Sir ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	
	DRow 9bh-2,0a9h-2,93h,03h
	DRow 9bh-2,0a9h-2,94h,03h
	DRow 9bh-2,0a9h-2,96h,03h ;3D
	
	DColumn 94h,0b2h,9bh-5,03h
	DColumn 94h,0b2h,9ah-5,03h
	DColumn 94h,0b2h,9ch-5,03h
	DColumn 94h,0b2h,9eh-5,03h     ;3d
	
	DRow 9bh-2,0a9h-2,9eh,03h  ;center line
	DRow 9bh-2,0a9h-2,9fh,03h  ;center line
	DRow 9bh-2,0a9h-2,0a1h,03h  ;center line
	
	DColumn 94h,0a1h,0a9h,03h
	DColumn 94h,0a1h,0aah,03h
	DColumn 94h,0a1h,0a8h,03h
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; curve of R ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 9bh,9ch,0a1h,03h 
	DRow 9ch,9dh,0a2h,03h 
	DRow 9dh,9eh,0a3h,03h 
	DRow 9eh,9fh,0a4h,03h  
	DRow 9fh,0a0h,0a5h,03h
    DRow 0a0h,0a1h,0a6h,03h
    DRow 0a1h,0a2h,0a7h,03h	
    DRow 0a2h,0a3h,0a8h,03h 
	DRow 0a3h,0a4h,0a9h,03h 
	DRow 0a4h,0a5h,0aah,03h 
	DRow 0a5h,0a6h,0abh,03h  
	DRow 0a6h,0a7h,0ach,03h
    DRow 0a7h,0a8h,0adh,03h
    DRow 0a8h,0a9h,0aeh,03h	 
	DRow 0a9h,0aah,0afh,03h 
	DRow 0aah,0abh,0b0h,03h 
	DRow 0abh,0ach,0b1h,03h 
	DRow 0ach,0adh,0b2h,03h  
	;DRow 0adh,0aeh,0b3h,03h
    ;DRow 0aeh,0afh,0b4h,03h
    ;DRow 0afh,0b0h,0b5h,03h	
	
	DRow 9bh,9ch,0a0h,03h 
	DRow 9ch,9dh,0a1h,03h 
	DRow 9dh,9eh,0a2h,03h 
	DRow 9eh,9fh,0a3h,03h  
	DRow 9fh,0a0h,0a4h,03h
    DRow 0a0h,0a1h,0a5h,03h
    DRow 0a1h,0a2h,0a6h,03h	
    DRow 0a2h,0a3h,0a7h,03h 
	DRow 0a3h,0a4h,0a8h,03h 
	DRow 0a4h,0a5h,0a9h,03h 
	DRow 0a5h,0a6h,0aah,03h  
	DRow 0a6h,0a7h,0abh,03h
    DRow 0a7h,0a8h,0ach,03h
    DRow 0a8h,0a9h,0adh,03h	 
	DRow 0a9h,0aah,0aeh,03h 
	DRow 0aah,0abh,0afh,03h 
	DRow 0abh,0ach,0b0h,03h 
	DRow 0ach,0adh,0b1h,03h 
	
	
	
	
	DRow 9bh,9ch,9fh,03h 
	DRow 9ch,9dh,0a0h,03h 
	DRow 9dh,9eh,0a1h,03h 
	DRow 9eh,9fh,0a2h,03h  
	DRow 9fh,0a0h,0a3h,03h
    DRow 0a0h,0a1h,0a4h,03h
    DRow 0a1h,0a2h,0a5h,03h	
    DRow 0a2h,0a3h,0a6h,03h 
	DRow 0a3h,0a4h,0a7h,03h 
	DRow 0a4h,0a5h,0a8h,03h 
	DRow 0a5h,0a6h,0a9h,03h  
	DRow 0a6h,0a7h,0aah,03h
    DRow 0a7h,0a8h,0abh,03h
    DRow 0a8h,0a9h,0ach,03h	 
	DRow 0a9h,0aah,0adh,03h 
	DRow 0aah,0abh,0aeh,03h 
	DRow 0abh,0ach,0afh,03h 
	DRow 0ach,0adh,0b0h,03h
	
	
	
	DRow 9bh,9ch,9eh,03h 
	DRow 9ch,9dh,09fh,03h 
	DRow 9dh,9eh,0a0h,03h 
	DRow 9eh,9fh,0a1h,03h  
	DRow 9fh,0a0h,0a2h,03h
    DRow 0a0h,0a1h,0a3h,03h
    DRow 0a1h,0a2h,0a4h,03h	
    DRow 0a2h,0a3h,0a5h,03h 
	DRow 0a3h,0a4h,0a6h,03h 
	DRow 0a4h,0a5h,0a7h,03h 
	DRow 0a5h,0a6h,0a8h,03h  
	DRow 0a6h,0a7h,0a9h,03h
    DRow 0a7h,0a8h,0aah,03h
    DRow 0a8h,0a9h,0abh,03h	 
	DRow 0a9h,0aah,0ach,03h 
	DRow 0aah,0abh,0adh,03h 
	DRow 0abh,0ach,0aeh,03h 
	DRow 0ach,0adh,0afh,03h
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; H of Hafeez ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	
	DColumn 93h,0b2h,0b0h,03h          ;left cloumn of h
	DColumn 93h,0b2h,0b1h,03h
	DColumn 93h,0b2h,0b2h,03h
	DColumn 93h,0b2h,0b3h,03h
	DColumn 93h,0b2h,0b5h,03h
	
	
	
	DColumn 93h,0b2h,0c0h,03h          ;right columm of h
	DColumn 93h,0b2h,0c1h,03h
	DColumn 93h,0b2h,0c2h,03h
	DColumn 93h,0b2h,0c3h,03h
	DColumn 93h,0b2h,0c5h,03h	
	
	

	
	DRow 0b1h,0c0h,0a1h,03h
	DRow 0b1h,0c0h,0a2h,03h
	DRow 0b1h,0c0h,0a3h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0b1h,0c0h,0a5h,03h ;3D
	
	
	

	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; A for Hafeez ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DColumn 94h,0b2h,0cdh,03h
	DColumn 94h,0b2h,0ceh,03h
	DColumn 94h,0b2h,0cfh,03h
	DColumn 94h,0b2h,0d0h,03h
	DColumn 94h,0b2h,0d3h,03h   ;3d	
	
	
	
	
	DColumn 94h,0b2h,0dfh,03h
	DColumn 94h,0b2h,0e0h,03h
	DColumn 94h,0b2h,0e1h,03h
	DColumn 94h,0b2h,0e2h,03h
	DColumn 94h,0b2h,0e5h,03h	
		
	
	
	
	DRow 0cdh,0dfh,0a1h,03h                   ;center line for a
	DRow 0cdh,0dfh,0a2h,03h
	DRow 0cdh,0dfh,0a3h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0cdh,0dfh,0a5h,03h ;3D
	
	
	
	
	DRow 0cdh,0dfh,092h,03h                   ;upper line for a
	DRow 0cdh,0dfh,093h,03h
	DRow 0cdh,0dfh,094h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0cdh,0dfh,096h,03h ;3D
	
	
	
	

	
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; f for hafeez ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	

	DColumn 96h,0b2h,0eah,03h
	DColumn 96h,0b2h,0ebh,03h
	DColumn 96h,0b2h,0ech,03h
	DColumn 96h,0b2h,0edh,03h
	DColumn 96h,0b2h,0f0h,03h                   ;3d	
	
	
	
	
	
	
	
	DRow 0eah,0fch,0a1h,03h                   ;center line for f
	DRow 0eah,0fch,0a2h,03h
	DRow 0eah,0fch,0a3h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0eah,0fch,0a5h,03h                      ;3D
	
	
	
	
	
	DRow 0eah,0fch,092h,03h                   ;upper line for f
	DRow 0eah,0fch,093h,03h
	DRow 0eah,0fch,094h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0eah,0fch,096h,03h                      ;3D
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; E For hafeez ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DColumn 96h,0b2h,0ffh,03h
	DColumn 96h,0b2h,0100h,03h
	DColumn 96h,0b2h,0101h,03h
	DColumn 96h,0b2h,0102h,03h
	DColumn 96h,0b2h,0105h,03h                   ;3d	
	
	
	
	
	
	
	
	DRow 0ffh,010ah,092h,03h                   ;upper line for E
	DRow 0ffh,010ah,093h,03h
	DRow 0ffh,010ah,094h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0ffh,010ah,096h,03h                      ;3D
	
	
	
	
	
	DRow 0ffh,010ah,0a1h,03h                   ;center line for E
	DRow 0ffh,010ah,0a2h,03h
	DRow 0ffh,010ah,0a3h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0ffh,010ah,0a5h,03h                      ;3D
	
	
	
	
	
	DRow 0ffh,010ah,0b1h,03h 
	DRow 0ffh,010ah,0b2h,03h
	DRow 0ffh,010ah,0b3h,03h
	DRow 0ffh,010ah,0b5h,03h
	
	
	
	
	
	
	
	
	
	
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; E for hafeez again ;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	
	
	DColumn 96h,0b2h,010fh,03h
	DColumn 96h,0b2h,0110h,03h
	DColumn 96h,0b2h,0111h,03h
	DColumn 96h,0b2h,0112h,03h
	DColumn 96h,0b2h,0115h,03h                   ;3d	
	
	
	
	
	
	
	
	DRow 010fh,011ah,092h,03h                   ;upper line for E
	DRow 010fh,011ah,093h,03h
	DRow 010fh,011ah,094h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 010fh,011ah,096h,03h                      ;3D
	
	
	
	
	
	DRow 010fh,011ah,0a1h,03h                   ;center line for E
	DRow 010fh,011ah,0a2h,03h
	DRow 010fh,011ah,0a3h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 010fh,011ah,0a5h,03h                      ;3D
	
	
	
	
	
	DRow 010fh,011ah,0b1h,03h                    ;lower line for E
	DRow 010fh,011ah,0b2h,03h
	DRow 010fh,011ah,0b3h,03h
	DRow 010fh,011ah,0b5h,03h
	
	
	
	
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Z for hafeez ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DRow 0120h,0137h,092h,03h                   ;upper line for Z
	DRow 0120h,0137h,093h,03h
	DRow 0120h,0137h,094h,03h
	;DRow 9bh,0a9h,0c3h,03h
	DRow 0120h,0137h,096h,03h   
	
	
	
	DRow 0120h,0137h,0b1h,03h                    ;lower line for Z
	DRow 0120h,0137h,0b2h,03h
	DRow 0120h,0137h,0b3h,03h
	DRow 0120h,0137h,0b5h,03h
	
	

	DRow 0120h,0121h,0b0h,03h                   ;curve line for Z 
	DRow 0121h,0122h,0afh,03h
	DRow 0122h,0123h,0aeh,03h
	DRow 0123h,0124h,0adh,03h   
	DRow 0124h,0125h,0ach,03h
	DRow 0125h,0126h,0abh,03h
	DRow 0126h,0127h,0aah,03h
	DRow 0127h,0128h,0a9h,03h
	DRow 0128h,0129h,0a8h,03h                   ;curve line for Z 
	DRow 0129h,012ah,0a7h,03h
	DRow 012ah,012bh,0a6h,03h
	DRow 012bh,012ch,0a5h,03h   
	DRow 012ch,012dh,0a4h,03h
	DRow 012dh,012eh,0a3h,03h
	DRow 012eh,012fh,0a2h,03h
	DRow 012fh,0130h,0a1h,03h
	DRow 0130h,0131h,0a0h,03h
	DRow 0131h,0132h,9fh,03h
	DRow 0132h,0133h,9eh,03h
	DRow 0133h,0134h,9dh,03h
	DRow 0134h,0135h,9ch,03h
	DRow 0135h,0136h,9bh,03h
	DRow 0136h,0137h,9ah,03h
	DRow 0137h,0138h,99h,03h
	
	
	
	
	DRow 0120h,0121h,0afh,03h                   ;curve line for Z 
	DRow 0121h,0122h,0aeh,03h
	DRow 0122h,0123h,0adh,03h
	DRow 0123h,0124h,0ach,03h   
	DRow 0124h,0125h,0abh,03h
	DRow 0125h,0126h,0aah,03h
	DRow 0126h,0127h,0a9h,03h
	DRow 0127h,0128h,0a8h,03h
	DRow 0128h,0129h,0a7h,03h                   ;curve line for Z 
	DRow 0129h,012ah,0a6h,03h
	DRow 012ah,012bh,0a5h,03h
	DRow 012bh,012ch,0a4h,03h   
	DRow 012ch,012dh,0a3h,03h
	DRow 012ch,012dh,0a2h,03h
	DRow 012ch,012dh,0a1h,03h
	DRow 012ch,012dh,0a0h,03h
	DRow 012ch,012dh,9fh,03h
	DRow 012ch,012dh,9eh,03h
	DRow 012dh,012eh,9dh,03h
	DRow 012eh,012fh,9ch,03h
	DRow 012fh,0130h,9bh,03h
	DRow 0130h,0131h,9ah,03h
	DRow 0131h,0132h,99h,03h
	DRow 0132h,0133h,98h,03h
	DRow 0133h,0134h,97h,03h
	DRow 0134h,0135h,96h,03h
	DRow 0135h,0136h,95h,03h	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;drawsquare 0b4h,7fh,0h   
	
	;Drawpic    77h,8ah,0afh,04h
	
	
	
	drawsquare2 0fh,73h,03h
	
	drawball 20h,71h,04h               ;first
	
	
	drawsquare2 30h,73h,03h
	
	drawball 45h,71h,04h               ;second
	
	
	drawsquare2 59h,73h,03h
	
	drawball 69h,71h,04h                ;third
	
	
	
	
	
	
	
	
	
	drawsquare2 7ch,73h,03h
	
	
	
	
	
	
	drawball 8fh,71h,04h
	
	drawsquare2 0a5h,73h,03h
	
	drawball 0b9h,71h,04h	
		
	drawsquare2 0c9h,73h,03h
	
	
	drawball 0e0h,71h,04h	
		
	drawsquare2 0f5h,73h,03h
	
	
	drawball 10ah,71h,04h	
		
	drawsquare2 120h,73h,03h
	
	
	
	mov ah,01
    int 21h
	
	
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
