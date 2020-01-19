;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; MAIN CODE STARTS HERE ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL large
.STACK 100H
If1 
include mn1.mac
endif
.DATA
MSG1 DB 'GAME DEVELOPED BY: $'
MSG2 DB 'GAME PRESENTED TO: $'
MSG3 DB '    Sir_Hafeez     $'
MSG4 DB ' press space to continue.... $'
MSG  DB ' 1: Fahad Ashiq   $'
MS   DB ' 2: Laeeq Asghar  $'

a1 db '  Press Space to Continue....$'
e1 db ' ******** Thankyou ******** $'
hit db '  HIT:  $'
miss db '  MISS:  $'

COL DW 146              ;ball position
ROW DW 138              ;ball position

CNT1 DW 100   ; LOOP COUNTR

CNT DW 100    ; LOOP COUNTR

ballx dw 30h			;it draw the ball at x position
bally dw 1fh			;it draw the ball at y position
ballcolor db 01Eh	    ;it draw the color of the
backcolor db 10h	    ;its color is blue in 16 color
;row2 DW 6              ;car position
;colum dw 14            ;car position
X dw 16                 ;arrow position
Y DW 26                 ;arrow position
DelayTime dw 5
can_move  dw ?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX


SETRESOLUTION 0,0,24,79,030H	;CLEARING THE SCREEN

SETRESOLUTION 2,5,10,35,060H    ;SETTING POSITION FOR MSG1 BOX

SETRESOLUTION 8,25,10,35,060H

SETCURSOR 3,6				;SETTING CURSOR FOR STRING BY MACRO
PRINT MSG2						;PRINTING STRING, Display GAME PRESENTED TO: 

SETCURSOR 4,8				;SETTING CURSOR FOR STRING BY MACRO
PRINT MSG3						;PRINTING STRING, Sir_Hafeez 

SETRESOLUTION 14,1,14,77,080H	;PRINTING STRAIGHT LINE BLACK LINE

;.........................................................;
;.........................................................;

SETRESOLUTION 16,15,23,65,020H	;PRINTING MSG2 BOX SETTING POSITION FOR MSG2 BOX

SETCURSOR 17,29					;SETTING CURSOR FOR 1ST STRING BY MACRO
PRINT MSG1						;PRINTING STRING BY MACRO					

SETRESOLUTION 16,15,18,65,040H

SETRESOLUTION 16,15,18,65,040H	;PRINTING GREEN INSIDE MSG2 BOX

SETCURSOR 15,28					;SETTING CURSOR FOR STRING BY MACRO
PRINT MSG4						;PRINTING STRING BY MACRO	press space to continue.... 				


SETCURSOR 20,33					;SETTING CURSOR FOR 2ND STRING BY MACRO
PRINT MSG						;;PRINTING 2ND STRING BY MACRO1: Fahad Ashiq   


SETCURSOR 21,33					;SETTING CURSOR FOR 3RD STRING BY MACRO
PRINT MS						;PRINTING 3RD STRING BY MACRO 2: Laeeq Asghar  


SETCURSOR 22,33					;SETTING CURSOR FOR 4TH STRING BY MACRO
PRINT M			    			;PRINTING 4TH STRING BY MACRO 3: Arqum Farooq  

                                ;030=light blue  ,010H	=BLUE ,020h= green 
								
MOV AH,01
INT 21H


; Shift one mode to other mode


;key press
mov ah,0
int 16h


;for space_key
cmp al,20h        
jE NEXT_PAGE
jmp EXIST

NEXT_PAGE:


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
	DRow 5h,139h,5h,04h 		        ;for upper line
	DRow 5h,139h,3h,04h
	DRow 5h,139h,90h+32h,04h	        ;for lower line 
	DRow 5h,139h,90h+34h,04h
	DColumn 5h,90h+32h,5h,04h	        ;left line
	DColumn 5h,90h+32h,3h,04h
	DColumn 5h,90h+32h,130h+9h,04h       ;right line
	DColumn 5h,90h+32h,132h+9h,04h
	
	
	
	

	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  draw A for a line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 29h,3fh,10h,03h
	DRow 29h,3fh,11h,03h
	DRow 29h,3fh,13h,03h                 ;3d
	DColumn 12h,2eh,29h,03h
	DColumn 12h,2eh,2ah,03h
	DColumn 12h,2eh,27h,03h              ;3d
	DColumn 12h,2eh,3fh,03h
	DColumn 12h,2eh,40h,03h
	DColumn 12h,2eh,42h,03h
	DRow 2ch,3dh,1fh,03h                 ;center line 
	DRow 2ch,3dh,20h,03h
	DRow 2ch,3dh,1eh,03h
	DRow 2ch,3dh,22h,03h                  ;3d
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Draw R  for line  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 49h,60h,10h,03h
	DRow 49h,60h,11h,03h
	DRow 49h,60h,13h,03h                  ;3D
	DColumn 12h,2fh,49h,03h
	DColumn 12h,2fh,4ah,03h
	DColumn 12h,2fh,4Ch,03h
	DRow 49h,5fh,1fh,03h                   ;center line 
	DRow 49h,5fh,20h,03h
	DRow 49h,5fh,22h,03h                   ;3D
	DColumn 12h,1fh,5fh,03h
	DColumn 12h,1fh,60h,03h
	DColumn 12h,1fh,62h,03h

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   for curve line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	DRow 4bh,4dh,21h,03h
	DRow 4dh,4fh,22h,03h
	DRow 4fh,51h,23h,03h
	DRow 51h,53h,24h,03h
	DRow 53h,55h,25h,03h
	DRow 55h,57h,26h,03h
	DRow 57h,59h,27h,03h
	DRow 59h,5bh,28h,03h
	DRow 5bh,5dh,29h,03h
	DRow 5dh,5fh,2ah,03h
	DRow 5eh,5fh,2bh,03h
	DRow 5dh,5fh,2ch,03h
	
	DRow 4bh,4dh,22h,03h
	DRow 4dh,4fh,23h,03h
	DRow 4fh,51h,24h,03h
	DRow 51h,53h,25h,03h
	DRow 53h,55h,26h,03h
	DRow 55h,57h,27h,03h
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
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DRAW 2nd R FOR LINE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 69h,80h,10h,03h
	DRow 69h,80h,11h,03h
	DRow 69h,80h,13h,03h                        ;3D
	DColumn 12h,2fh,69h,03h
	DColumn 12h,2fh,6ah,03h
	DColumn 12h,2fh,6Ch,03h
	
	DRow 69h,7fh,1fh,03h                        ;center line 
	DRow 69h,7fh,20h,03h
	DRow 69h,7fh,22h,03h                         ;3D
	DColumn 12h,1fh,7fh,03h
	DColumn 12h,1fh,80h,03h
	DColumn 12h,1fh,82h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for Curve Line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
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

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Draw an O for line  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 89h,9fh,10h,03h
	DRow 89h,9fh,11h,03h
	DRow 89h,9fh,13h,03h                  ;3D
	DColumn 12h,2fh,89h,03h
	DColumn 12h,30h,8ah,03h
	DColumn 12h,30h,8Ch,03h               ;3D
	DRow 8dh,9bh,1fh,11h                  ;center line
	DRow 8dh,9bh,20h,11h
	DRow 8dh,9bh,22h,11h                   ;3D
	DColumn 12h,2fh,9fh,03h
	DColumn 12h,30h,9fh+01h,03h
	DColumn 12h,30h,9fh+03h,03h            ;3D
	DRow 89h,9fh,2fh,03h                   ;end line 
	DRow 89h,9fh,30h,03h
	DRow 89h,9fh,32h,03h

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Draw Arrow revolver ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;;;;;;;;;;;;; Draw an Arrow e
	
	DRow 0F9h,10Fh,10h,03h
	DRow 0F9h,10Fh,11h,03h
	DColumn 12h,2fh,0F9h,03h
	DColumn 12h,30h,0F9h,03h
	DRow 0F9h,10Fh,12h,11h                 ;center line 
	DRow 0FFh,11Fh,20h,11h
	DRow 0FFh,11Fh,22h,11h

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
	DRow 0F9h,10Fh,12h,03h                   ;end line 
	DRow 0F9h,10Fh,1Fh,03h
	DRow 0F9h,10Fh,1Ah,03h
	DRow 0F9h,10Fh,2Fh,03h
	DRow 0F9h,10Fh,30h,03h
	DRow 0F9h,10Fh,32h,03h
	DRow 0F9h,10Fh,22h,03h
	DRow 0F9h,10Fh,24h,03h
	DRow 0F9h,10Fh,2Ah,03h
	DRow 0F9h,10Fh,2Ch,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Draw W for a line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DColumn 10h,31h,0A9h,03h
	DColumn 10h,31h,0Aah,03h
	DColumn 10h,31h,0ACh,03h  ;3D
	DColumn 10h,31h,0C9h,03h
	DColumn 10h,31h,0Cah,03h
	DColumn 10h,31h,0CCh,03h  ;3D

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for left Curve Line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
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
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; S IN NEW LINE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 39h,50h,43h,03h                    ;for 3d
	DRow 39h,50h,40h,03h
	DRow 39h,50h,41h,03h
	DColumn 42h,4Eh,39h,03h
	DColumn 42h,4fh,3ah,03h
	DColumn 42h,4fh,3ch,03h                  ;3d
	DRow 39h,4fh,4fh,03h                     ;center line 
	DRow 39h,4fh,50h,03h
	DRow 39h,4fh,52h,03h                      ;3d
	;
	DColumn 51h,5fh,4fh,03h
	DColumn 51h,60h,50h,03h
	DColumn 51h,60h,52h,03h                   ;3d
	
	DRow 39h,4fh,5fh,03h                      ;center line 
	DRow 39h,4fh,60h,03h
	DRow 39h,4fh,62h,03h

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; fOR H  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DColumn 40h,61h,59h,03h
	DColumn 40h,61h,5ah,03h
	DColumn 40h,61h,5ch,03h
	
	DRow 59h,70h,50h,03h                      ;Centre line 
	DRow 59h,70h,51h,03h 
	DRow 59h,70h,53h,03h
	
	DColumn 40h,61h,70h,03h
	DColumn 40h,61h,71h,03h
	DColumn 40h,61h,73h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Draw an O for line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 79h,8fh,40h,03h
	DRow 79h,8fh,41h,03h
	DRow 79h,8fh,43h,03h
	DColumn 42h,5fh,79h,03h
	DColumn 42h,60h,7ah,03h
	DColumn 42h,60h,7ch,03h
	DRow 7dh,8bh,4fh,11h                      ;center line 
	DRow 7dh,8bh,50h,11h
	DRow 7dh,8bh,4dh,11h
	DColumn 42h,5fh,8fh,03h
	DColumn 42h,60h,8fh+01h,03h
	DColumn 42h,60h,8fh+03h,03h
	DRow 79h,8fh,5fh,03h                      ;end line 
	DRow 79h,8fh,60h,03h  
	DRow 79h,8fh,62h,03h                      ;for 3d

	
    ; ;;;;;;;;;;;;;;;;;;;;;;;;;; Draw 	2nd O for line 0afh ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 99h,0afh,40h,03h
	DRow 99h,0afh,41h,03h
	DRow 99h,0afh,43h,03h
	DColumn 42h,5fh,99h,03h
	DColumn 42h,60h,9ah,03h
	DColumn 42h,60h,9ch,03h                        ;for 3d
	DRow 9dh,0abh,4fh,11h                          ;center line 
	DRow 9dh,0abh,50h,11h
	DRow 9dh,0abh,4dh,11h
	DColumn 42h,5fh,0afh,03h
	DColumn 42h,60h,0afh+01h,03h
	DColumn 42h,60h,0afh+03h,03h
	DRow 99h,0afh,5fh,03h                           ;end line 
	DRow 99h,0afh,60h,03h
	DRow 99h,0afh,62h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for T  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 0b9h,0cfh,40h,03h
	DRow 0b9h,0cfh,41h,03h
	DRow 0b9h,0cfh,43h,03h
	DColumn 42h,60h,0c3h,03h
	DColumn 42h,60h,0c4h,03h
	DColumn 42h,60h,0c6h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for E ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 0D9h,0Efh,40h,03h
	DRow 0D9h,0Efh,41h,03h
	DRow 0D9h,0Efh,42h,03h
	DColumn 42h,60h,0DAh,03h
	DColumn 42h,60h,0DBh,03h
	DColumn 42h,60h,0DEh,03h
	
	DRow 0D9h,0Efh,4Fh,03h                       ; FOR CENTER 
	DRow 0D9h,0Efh,4Fh,03h
	DRow 0D9h,0Efh,52h,03h
	
	DRow 0D9h,0Efh,5fh,03h
	DRow 0D9h,0Efh,60h,03h
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  DRAW  R FOR LINE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 0F9h,10Fh,40h,03h
	DRow 0F9h,10Fh,41h,03h
	DRow 0F9h,10Fh,42h,03h
	DColumn 42h,60h,0Fah,03h
	DColumn 42h,60h,0Fbh,03h
	DColumn 42h,60h,0Fdh,03h
	DRow 0F9h,10Fh,50h,03h                         ;center line  
	DRow 0F9h,10Fh,51h,03h
	DColumn 42h,50h,10Fh,03h
	DColumn 42h,51h,101h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for Curve Line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
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
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for up line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




	DRow 5h,139h,8eh,04h	;for lower line
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; p of present to ::::::::::::::::::::::::;;;;;;;;;;;;;;;;;;;;;;;;;

	DRow 10h,20h,92h,03h
	DRow 10h,20h,94h,03h
	DRow 10h,20h,95h,03h ;3D
	
	DColumn 96h,0b2h,11h,03h
	DColumn 96h,0b2h,12h,03h
	DColumn 96h,0b2h,10h,03h
	DColumn 96h,0b2h,10h-2,03h
	
	DRow 11h,20h,0a1h,03h                         ;center line
	DRow 11h,21h,0a2h,03h                         ;center line
	DRow 11h,20h,0a4h,03h                         ;center line
	
	DColumn 96h,0a2h,21h,03h
	DColumn 96h,0a2h,22h,03h
	DColumn 96h,0a2h,24h,03h
	
	DRow 2Bh,2Fh,0a1h,03h                         ;center line
	DRow 2ch,2Fh,0a2h,03h
	DRow 2ch,2Fh,0a3h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOR T of sir ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	
	DRow 59h,6fh,92h,03h                                  ;for 3d
	DRow 59h,6fh,94h,03h
	DRow 59h,6fh,95h,03h
	DColumn 92h,9Eh,59h,03h
	DColumn 92h,9fh,5ah,03h
	DColumn 92h,9fh,5ch,03h                                ; 3d	
	DRow 59h,6fh,9fh,03h                                   ;center line 
	DRow 59h,6fh,0ah,03h
	DRow 59h,6fh,0ch,03h                                    ;3d
	;DColumn 51h,5fh,4eh,03h
	;DColumn 52h,60h,4fh,03h
	
	DColumn 0a1h,0afh,6fh,03h
	DColumn 0a1h,0afh,70h,03h
	DColumn 0a1h,0afh,72h,03h                             ;3d 
	DRow 59h,6fh,0b1h,03h                                  ;center line 
	DRow 59h,6fh,0b2h,03h
	DRow 59h,6fh,0b4h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for I of Sir  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DRow 7eh,93h,93h,03h 
	DRow 7eh,93h,94h,03h
	DRow 7eh,93h,96h,03h  ; 3d
	
	;DColumn 96h,0b2h,8ah,03h
	DColumn 96h,0b2h,89h,03h
	DColumn 96h,0b2h,88h,03h
	DColumn 96h,0b2h,86h,03h ;3d
	
	DRow 7eh,93h,0b0h,03h 
	DRow 7eh,93h,0b1h,03h
	DRow 7eh,93h,0b3h,03h       ; 3d	
	

	;;;;;;;;;;;;;;;;;;;;;;;;;; for R of Sir ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 9bh,0a9h,93h,03h
	DRow 9bh,0a9h,94h,03h
	DRow 9bh,0a9h,96h,03h ;3D
	
	DColumn 94h,0b2h,9bh,03h
	DColumn 94h,0b2h,9ah,03h
	DColumn 94h,0b2h,9ch,03h
	DColumn 94h,0b2h,9eh,03h     ;3d
	
	DRow 9bh,0a9h,0a0h,03h  ;center line
	DRow 9bh,0a9h,0a1h,03h  ;center line
	DRow 9bh,0a9h,0a3h,03h  ;center line
	
	DColumn 96h,0a2h,0a9h,03h
	DColumn 96h,0a2h,0aah,03h
	DColumn 96h,0a2h,0a8h,03h
	
		
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

	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; For Squares and Square ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
    drawsquare2 0fh,73h,03h
	
	drawball 20h,71h,04h               ;first
	
	
	drawsquare2 30h,73h,03h
	
	drawball 45h,71h,04h               ;second
	
	
	drawsquare2 59h,73h,03h
	
	drawball 69h,71h,04h                ;third
	
	
	drawsquare2 7ch,73h,03h
	
	
	
	drawball 8fh,71h,04h               ;forth
	
	drawsquare2 0a5h,73h,03h
	
	drawball 0b9h,71h,04h	           ;fifth
		
	drawsquare2 0c9h,73h,03h
	
	
	drawball 0e0h,71h,04h	           ;sixth
		
	drawsquare2 0f5h,73h,03h
	
	
	drawball 10ah,71h,04h	            ;seventh
		
	drawsquare2 120h,73h,03h
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     call sound  997        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	call far ptr sound1
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOR GAME PAGE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	 ;key press
     mov ah,0
     int 16h

     ;for space_key
     cmp al,20h       
     jE  gm
     jmp EXIST
	
	gm:
	
	call far ptr gamepage
	
	
	 ;key press
     mov ah,0
     int 16h

     ;for space_key
     cmp al,20h       
     jE  en
     jmp EXIST
	
	
	en:
	
	call far ptr endpage1
	
	
	
	mov ah,01
    int 21h
	

EXIST:

    MOV AH,4CH
    INT 21H

MAIN ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FOR PROC   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    

SOUND proc far
PUSH    AX
  PUSH    BX
  PUSH    CX
  PUSH    DX
  PUSH    DI
  MOV AL, 0B6H
  OUT 43H, AL
  MOV DX, 14H
  MOV AX, 4F38H
  DIV DI
  OUT 42H, AL
  MOV AL, AH
  OUT 42H, AL
  IN  AL, 61H
  MOV AH, AL
  OR  AL, 3
  OUT 61H, AL
L1: MOV CX, 6801
L2: LOOP    L2
  DEC BX
  JNZ L1
  MOV AL, AH
  OUT 61H, AL
  POP DI
  POP DX
  POP CX
  POP BX
  POP AX
  RET
SOUND   ENDP

sound1 proc far

jmp MEL

MOV BX, 50
L3: MOV AH, 0
  INT 16H
  
 CMP Ah, 50h  ;dw
  JE  FA
  CMP Ah,4bh
  JE  SOL
  CMP Ah,4dh
  JE  LA
  CMP Ah,48h ;up
  JE  CI
  CMP Al,20h                   ;dw infinite music
  JE  MEL
  JNZ L3
DO: MOV DI, 131
  CALL    SOUND
  JMP L3
RE: MOV DI, 147
  CALL    SOUND
  JMP L3
MI: MOV DI, 165
  CALL    SOUND
  JMP L3
FA: MOV DI, 175
  CALL    SOUND
  JMP L3
SOL:    MOV DI, 196
  CALL    SOUND
  JMP L3
LA: MOV DI, 220
  CALL    SOUND
  JMP L3
CI: MOV DI, 247
  CALL    SOUND
  JMP L3
EXIT:   MOV AH, 00H
  MOV AL, 03H
  INT 10H
  MOV AX, 4C00H
  INT 21H
  RET

MEL:    
L4: LOOP L4
  MOV DI, 510
  CALL    SOUND
  MOV DI, 420 
  CALL    SOUND
  MOV DI, 300
  CALL    SOUND
  MOV DI, 230
  CALL    SOUND
  MOV DI, 170
  CALL    SOUND
  MOV DI, 560
  CALL    SOUND
  MOV DI, 450
  CALL    SOUND
  MOV DI, 370
  CALL    SOUND
  MOV DI, 900
  CALL    SOUND
  MOV DI, 830
  CALL    SOUND
  MOV DI, 250
  CALL    SOUND
  MOV DI, 470
  CALL    SOUND
  MOV DI, 480
  CALL    SOUND
  MOV DI, 290
  CALL    SOUND
  MOV DI, 230
  CALL    SOUND
  MOV DI, 520
  CALL    SOUND
  MOV DI, 410
  CALL    SOUND
  MOV DI, 970
  CALL    SOUND
  MOV DI, 480
  CALL    SOUND
  MOV DI, 390
  CALL    SOUND
  MOV DI, 730
  CALL    SOUND
  MOV DI, 420
  CALL    SOUND
  MOV DI, 620
  CALL    SOUND
  MOV DI, 210
  CALL    SOUND
  MOV DI, 330
  CALL    SOUND
  MOV DI, 560
  CALL    SOUND
  MOV DI, 970
  CALL    SOUND
  MOV DI, 380
  CALL    SOUND
  MOV DI, 850
  CALL    SOUND
  MOV DI, 120
  CALL    SOUND
  MOV DI, 530
  CALL    SOUND
  MOV DI, 620
  CALL    SOUND
  MOV DI, 310
  CALL    SOUND
  MOV DI, 680
  CALL    SOUND
  MOV DI, 190
  CALL    SOUND
  MOV DI, 510
  CALL    SOUND
  MOV DI, 420
  CALL    SOUND
  MOV DI, 140
  CALL    SOUND
  mov ah,0
  int 16h
  cmp al , 'b' 
  Je  exit1

  jmp  exit1
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;
  exit1:
  
  ;to clear screen
    mov ah,06
	mov al,0
	mov bh,20h
	mov cx,0
	mov dx,184fh
	int 10h
  ;;;;;;;;;;;;;
  MOV AH, 00H
   int 16h
  cmp al,20h
  je last2
  MOV AX, 4C00H
  INT 21H
  
  pop dx
  pop cx
  
  ret

   
  
sound1 endp

last2:
 call far ptr gamepage




	endpage1 proc far

push cx
push dx


;to clear screen
    mov ah,06
	mov al,0
	mov bh,20h
	mov cx,0
	mov dx,184fh
	int 10h


	
;for read pixel in G.mode	

	mov ah,00h
	mov al,0dh                           ; for read 
	int 10h

	
;to change background color 

	mov ah,0bh ;for set back ground color in G.mode put ah=obh
	mov bh,00h ;pg number
	mov bl,10h ;color light cyan
	int 10h
		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    Shift one mode to other mode  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; ;key press
; mov ah,0
; int 16h

; cmp al,20h        ;for space_key
; jE  EndPage
; jmp EXIST

;EndPage1: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Last Pag  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   
 	SETCURSOR 16,6	                        ;SETTING CURSOR FOR STRING BY MACRO
    printstring e1

	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   draw a baorder  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
	DRow 5h,139h,5h,04h 		             ;for upper line
	DRow 5h,139h,3h,04h
	DRow 5h,139h,90h+32h,04h	             ;for lower line 
	DRow 5h,139h,90h+34h,04h
	DColumn 5h,90h+32h,5h,04h	             ;left line
	DColumn 5h,90h+32h,3h,04h
	DColumn 5h,90h+32h,130h+9h,04h           ;right line
	DColumn 5h,90h+32h,132h+9h,04h
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for G  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 29h,3fh,10h,03h
	DRow 29h,3fh,11h,03h
	DRow 29h,3fh,13h,03h               ;3d
	DColumn 12h,2eh,29h,03h
	DColumn 12h,2eh,2ah,03h
	DColumn 12h,2eh,27h,03h            ;3d
	
	
	DRow 32h,3dh,1fh,03h               ;center line 
	DRow 32h,3dh,20h,03h
	DRow 32h,3dh,1eh,03h
	DRow 32h,3dh,22h,03h	             ;3d
	
	DColumn 1fh,2eh,3dh,03h
	DColumn 1fh,2eh,3eh,03h
	DColumn 1fh,2eh,3fh,03h
	DColumn 1fh,2eh,41h,03h
	DRow 2ah,3fh,2eh,03h
	DRow 2ah,3fh,2fh,03h
	DRow 2ah,3fh,30h,03h
	DRow 2ch,3fh,32h,03h

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  draw A for a line  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 47h,61h,20h,03h
	DRow 47h,61h,21h,03h
	DRow 47h,61h,22h,03h  	
	DRow 47h,61h,25h,03h                   ;3d
	
	
	
	DColumn 14h,31h,47h,03h
	DColumn 14h,31h,48h,03h
	DColumn 14h,31h,49h,03h
	DColumn 14h,31h,4bh,03h
	
	
	DColumn 14h,31h,61h,03h
	DColumn 14h,31h,62h,03h
	DColumn 14h,31h,63h,03h
	DColumn 14h,31h,65h,03h
	DRow 47h,61h,11h,03h                   ;upper line 
    DRow 47h,61h,12h,03h
	DRow 47h,61h,13h,03h
	DRow 47h,61h,14h,03h        
	DRow 47h,61h,17h,03h                    ;3d
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   for M  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DColumn 14h,31h,6fh,03h                 ;m left column
	DColumn 14h,31h,70h,03h
	DColumn 14h,31h,71h,03h 
	DColumn 14h,31h,72h,03h 
	DColumn 17h,31h,75h,03h 
	
	
	
	
	DColumn 14h,31h,90h,03h                 ;m right column
	DColumn 14h,31h,91h,03h
	DColumn 14h,31h,92h,03h 
	DColumn 14h,31h,93h,03h 
	DColumn 14h,31h,94h,03h 
    DColumn 14h,31h,97h,03h
	

    ;DRow 6fh,71h,15h,03h                     ;m left upper curve
	DRow 71h,73h,16h,03h
	DRow 73h,75h,17h,03h        
	DRow 75h,77h,18h,03h
    DRow 77h,79h,19h,03h
    DRow 79h,7bh,1ah,03h	
	DRow 7bh,7dh,1bh,03h
	DRow 7dh,7fh,1ch,03h
	DRow 7fh,81h,1dh,03h
	
	DRow 71h,73h,17h,03h
	DRow 73h,75h,18h,03h        
	DRow 75h,77h,19h,03h
    DRow 77h,79h,1ah,03h
    DRow 79h,7bh,1bh,03h	
	DRow 7bh,7dh,1ch,03h
	DRow 7dh,7fh,1dh,03h
	DRow 7fh,81h,1eh,03h
	
	DRow 71h,73h,18h,03h
	DRow 73h,75h,19h,03h        
	DRow 75h,77h,1ah,03h
    DRow 77h,79h,1bh,03h
    DRow 79h,7bh,1ch,03h	
	DRow 7bh,7dh,1dh,03h
	DRow 7dh,7fh,1eh,03h
	DRow 7fh,81h,1fh,03h
	
	
	DRow 7ch,7eh,1eh,03h                         ;m right upper curve
	DRow 7eh,80h,1dh,03h
	DRow 80h,82h,1ch,03h       
    DRow 82h,84h,1bh,03h
	DRow 84h,86h,1ah,03h
	DRow 86h,88h,19h,03h        
	DRow 88h,8ah,18h,03h
	DRow 8ah,8ch,17h,03h
    DRow 8ch,8eh,16h,03h
	DRow 8eh,90h,15h,03h
	
	
	DRow 7ch,7eh,1fh,03h        
	DRow 7eh,80h,1eh,03h
	DRow 80h,82h,1dh,03h       
    DRow 82h,84h,1ch,03h
	DRow 84h,86h,1bh,03h
	DRow 86h,88h,1ah,03h        
	DRow 88h,8ah,19h,03h
	DRow 8ah,8ch,18h,03h
	DRow 8ch,8eh,17h,03h
	DRow 8eh,90h,16h,03h

	
	DRow 7ch,7eh,20h,03h        
	DRow 7eh,80h,1fh,03h
	DRow 80h,82h,1eh,03h       
    DRow 82h,84h,1dh,03h
	DRow 84h,86h,1ch,03h
	DRow 86h,88h,1bh,03h        
	DRow 88h,8ah,1ah,03h
	DRow 8ah,8ch,19h,03h
	DRow 8ch,8eh,18h,03h
	DRow 8eh,90h,17h,03h
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for E  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DColumn 14h,31h,9dh,03h
	DColumn 14h,31h,9eh,03h
	DColumn 14h,31h,9fh,03h
 	DColumn 14h,31h,9fh+02h,03h                      ;3d
	DRow 9dh,9fh+20h,14h,03h
	DRow 9dh,9fh+20h,15h,03h
	DRow 9dh,9fh+20h,16h,03h
	DRow  9dh,9fh+20h,18h,03h
	DRow 9dh,9fh+20h,22h,03h
	DRow 9dh,9fh+20h,23h,03h
	DRow 9dh,9fh+20h,24h,03h
	DRow 9dh,9fh+20h,26h,03h                          ;3d	
	DRow 9dh,9fh+20h,31h,03h 
	DRow 9dh,9fh+20h,32h,03h 
	DRow 9dh,9fh+20h,33h,03h 
	DRow 9dh,9fh+20h,34h,03h 
	DRow 9dh,9fh+20h,36h,03h 
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for O ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	DColumn 40h,5eh,47h,03h        ;left column of o
	DColumn 40h,5eh,48h,03h
	DColumn 40h,5eh,49h,03h
	DColumn 40h,5eh,4ah,03h
	DColumn 40h,5eh,4dh,03h          ;3d
    DRow 47h,61h,40h,03h            ;upper row of o
	DRow 47h,61h,41h,03h
	DRow 47h,61h,42h,03h
	DRow 47h,61h,44h,03h             ;3d
	DColumn 40h,5eh,61h,03h           ;right column of 0
	DColumn 40h,5eh,62h,03h
	DColumn 40h,5eh,63h,03h
	DColumn 40h,5eh,65h,03h           ;3d  	
	DRow 47h,61h,5eh,03h               ;loxwer row of O
	DRow 47h,61h,5fh,03h
	DRow 47h,61h,60h,03h
	DRow 47h,61h,63h,03h              ;3d

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for V ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




	DRow 67h,68h,41h,03h            ;left curve of V
	DRow 68h,69h,42h,03h
	DRow 69h,6ah,43h,03h
	DRow 6ah,6bh,44h,03h          
    DRow 6bh,6ch,45h,03h
	DRow 6ch,6dh,46h,03h
	DRow 6dh,6eh,47h,03h
	DRow 6eh,6fh,48h,03h
	DRow 6fh,70h,49h,03h
	DRow 70h,71h,4ah,03h
	DRow 71h,72h,4bh,03h
	DRow 72h,73h,4ch,03h          
    DRow 73h,74h,4dh,03h
	DRow 74h,75h,4eh,03h
	DRow 75h,76h,4fh,03h
	DRow 76h,77h,50h,03h
	DRow 77h,78h,51h,03h
	DRow 78h,79h,52h,03h
	DRow 79h,7ah,53h,03h
	DRow 7ah,7bh,54h,03h          
    DRow 7bh,7ch,55h,03h
	DRow 7ch,7dh,56h,03h
	DRow 7dh,7eh,57h,03h
	DRow 7eh,7fh,58h,03h


	
	DRow 67h,68h,42h,03h            ;left curve of V
	DRow 68h,69h,43h,03h
	DRow 69h,6ah,44h,03h
	DRow 6ah,6bh,45h,03h          
    DRow 6bh,6ch,46h,03h
	DRow 6ch,6dh,47h,03h
	DRow 6dh,6eh,48h,03h
	DRow 6eh,6fh,49h,03h
	DRow 6fh,70h,4ah,03h
	DRow 70h,71h,4bh,03h
	DRow 71h,72h,4ch,03h
	DRow 72h,73h,4dh,03h          
    DRow 73h,74h,4eh,03h
	DRow 74h,75h,4fh,03h
	DRow 75h,76h,50h,03h
	DRow 76h,77h,51h,03h
	DRow 77h,78h,52h,03h
	DRow 78h,79h,53h,03h
	DRow 79h,7ah,54h,03h
	DRow 7ah,7bh,55h,03h          
    DRow 7bh,7ch,56h,03h
	DRow 7ch,7dh,57h,03h
	DRow 7dh,7eh,58h,03h
	DRow 7eh,7fh,59h,03h
	
	
	
	
    DRow 67h,68h,43h,03h
	DRow 68h,69h,44h,03h
	DRow 69h,6ah,45h,03h
	DRow 6ah,6bh,46h,03h          
    DRow 6bh,6ch,47h,03h
	DRow 6ch,6dh,48h,03h
	DRow 6dh,6eh,49h,03h
	DRow 6eh,6fh,4ah,03h
	DRow 6fh,70h,4bh,03h
	DRow 70h,71h,4ch,03h
	DRow 71h,72h,4dh,03h
	DRow 72h,73h,4eh,03h          
    DRow 73h,74h,4fh,03h
	DRow 74h,75h,50h,03h
	DRow 75h,76h,51h,03h
	DRow 76h,77h,52h,03h
	DRow 77h,78h,53h,03h
	DRow 78h,79h,54h,03h
	DRow 79h,7ah,55h,03h
	DRow 7ah,7bh,56h,03h          
    DRow 7bh,7ch,57h,03h
	DRow 7ch,7dh,58h,03h
	DRow 7dh,7eh,59h,03h
	DRow 7eh,7fh,5ah,03h
	
	
	
    DRow 67h,68h,44h,03h
	DRow 68h,69h,45h,03h
	DRow 69h,6ah,46h,03h
	DRow 6ah,6bh,47h,03h          
    DRow 6bh,6ch,48h,03h
	DRow 6ch,6dh,49h,03h
	DRow 6dh,6eh,4ah,03h
	DRow 6eh,6fh,4bh,03h
	DRow 6fh,70h,4ch,03h
	DRow 70h,71h,4dh,03h
	DRow 71h,72h,4eh,03h
	DRow 72h,73h,4fh,03h          
    DRow 73h,74h,50h,03h
	DRow 74h,75h,51h,03h
	DRow 75h,76h,52h,03h
	DRow 76h,77h,53h,03h
	DRow 77h,78h,54h,03h
	DRow 78h,79h,55h,03h
	DRow 79h,7ah,56h,03h
	DRow 7ah,7bh,57h,03h          
    DRow 7bh,7ch,58h,03h
	DRow 7ch,7dh,59h,03h
	DRow 7dh,7eh,5ah,03h
	DRow 7eh,7fh,5bh,03h	
	 
    DRow 68h,69h,45h,03h
	DRow 69h,6ah,46h,03h
	DRow 6ah,6bh,47h,03h          
    DRow 6bh,6ch,48h,03h
	DRow 6ch,6dh,49h,03h
	DRow 6dh,6eh,4ah,03h
	DRow 6eh,6fh,4bh,03h
	DRow 6fh,70h,4ch,03h
	DRow 70h,71h,4dh,03h
	DRow 71h,72h,4eh,03h
	DRow 72h,73h,4fh,03h          
    DRow 73h,74h,50h,03h
	DRow 74h,75h,51h,03h
	DRow 75h,76h,52h,03h
	DRow 76h,77h,53h,03h
	DRow 77h,78h,54h,03h
	DRow 78h,79h,55h,03h
	DRow 79h,7ah,56h,03h
	DRow 7ah,7bh,57h,03h          
    DRow 7bh,7ch,58h,03h
	DRow 7ch,7dh,59h,03h
	DRow 7dh,7eh,5ah,03h
	DRow 7eh,7fh,5bh,03h
    DRow 7eh,7fh,5ch,03h	
	


	;;;;;;;;;;;;;;l;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; right curve ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DRow 7eh,7fh,59h,03h
	DRow 7fh,80h,58h,03h
	DRow 80h,81h,57h,03h
	DRow 81h,82h,56h,03h          
    DRow 82h,83h,55h,03h
	DRow 83h,84h,54h,03h
	DRow 84h,85h,53h,03h
	DRow 85h,86h,52h,03h
	DRow 86h,87h,51h,03h
	DRow 87h,88h,50h,03h
	DRow 88h,89h,4fh,03h
	DRow 89h,8ah,4eh,03h          
    DRow 8ah,8bh,4dh,03h
	DRow 8bh,8ch,4ch,03h
	DRow 8ch,8dh,4bh,03h
	DRow 8dh,8eh,4ah,03h
	DRow 8eh,8fh,49h,03h
	DRow 8fh,90h,48h,03h
	DRow 90h,91h,47h,03h
	DRow 91h,92h,46h,03h          
    DRow 92h,93h,45h,03h
	DRow 93h,94h,44h,03h
	DRow 94h,95h,43h,03h
	DRow 95h,96h,42h,03h
	
	
	DRow 7eh,7fh,5ah,03h
	DRow 7fh,80h,59h,03h
	DRow 80h,81h,58h,03h
	DRow 81h,82h,57h,03h          
    DRow 82h,83h,56h,03h
	DRow 83h,84h,55h,03h
	DRow 84h,85h,54h,03h
	DRow 85h,86h,53h,03h
	DRow 86h,87h,52h,03h
	DRow 87h,88h,51h,03h
	DRow 88h,89h,50h,03h
	DRow 89h,8ah,4fh,03h          
    DRow 8ah,8bh,4eh,03h
	DRow 8bh,8ch,4dh,03h
	DRow 8ch,8dh,4ch,03h
	DRow 8dh,8eh,4bh,03h
	DRow 8eh,8fh,4ah,03h
	DRow 8fh,90h,49h,03h
	DRow 90h,91h,48h,03h
	DRow 91h,92h,47h,03h          
    DRow 92h,93h,46h,03h
	DRow 93h,94h,45h,03h
	DRow 94h,95h,44h,03h
	DRow 95h,96h,43h,03h
	
	
	
	DRow 7eh,7fh,5bh,03h
	DRow 7fh,80h,5ah,03h
	DRow 80h,81h,59h,03h
	DRow 81h,82h,58h,03h          
    DRow 82h,83h,57h,03h
	DRow 83h,84h,56h,03h
	DRow 84h,85h,55h,03h
	DRow 85h,86h,54h,03h
	DRow 86h,87h,53h,03h
	DRow 87h,88h,52h,03h
	DRow 88h,89h,51h,03h
	DRow 89h,8ah,50h,03h          
    DRow 8ah,8bh,4fh,03h
	DRow 8bh,8ch,4eh,03h
	DRow 8ch,8dh,4dh,03h
	DRow 8dh,8eh,4ch,03h
	DRow 8eh,8fh,4bh,03h
	DRow 8fh,90h,4ah,03h
	DRow 90h,91h,49h,03h
	DRow 91h,92h,48h,03h          
    DRow 92h,93h,47h,03h
	DRow 93h,94h,46h,03h
	DRow 94h,95h,45h,03h
	DRow 95h,96h,44h,03h
    DRow 7eh,7fh,5ch,03h
	DRow 7fh,80h,5bh,03h
	DRow 80h,81h,5ah,03h
	DRow 81h,82h,59h,03h          
    DRow 82h,83h,58h,03h
	DRow 83h,84h,57h,03h
	DRow 84h,85h,56h,03h
	DRow 85h,86h,55h,03h
	DRow 86h,87h,54h,03h
	DRow 87h,88h,53h,03h
	DRow 88h,89h,52h,03h
	DRow 89h,8ah,51h,03h          
    DRow 8ah,8bh,50h,03h
	DRow 8bh,8ch,4fh,03h
	DRow 8ch,8dh,4eh,03h
	DRow 8dh,8eh,4dh,03h
	DRow 8eh,8fh,4ch,03h
	DRow 8fh,90h,4bh,03h
	DRow 90h,91h,4ah,03h
	DRow 91h,92h,49h,03h          
    DRow 92h,93h,48h,03h
	DRow 93h,94h,47h,03h
	DRow 94h,95h,46h,03h
	DRow 95h,96h,45h,03h   
    DRow 7eh,7fh,5dh,03h
	DRow 7fh,80h,5ch,03h
	DRow 80h,81h,5bh,03h
	DRow 81h,82h,5ah,03h          
    DRow 82h,83h,59h,03h
	DRow 83h,84h,58h,03h
	DRow 84h,85h,57h,03h
	DRow 85h,86h,56h,03h
	DRow 86h,87h,55h,03h
	DRow 87h,88h,54h,03h
	DRow 88h,89h,53h,03h
	DRow 89h,8ah,52h,03h          
    DRow 8ah,8bh,51h,03h
	DRow 8bh,8ch,50h,03h
	DRow 8ch,8dh,4fh,03h
	DRow 8dh,8eh,4eh,03h
	DRow 8eh,8fh,4dh,03h
	DRow 8fh,90h,4ch,03h
	DRow 90h,91h,4bh,03h
	DRow 91h,92h,4ah,03h          
    DRow 92h,93h,49h,03h
	DRow 93h,94h,48h,03h
	DRow 94h,95h,47h,03h
	DRow 95h,96h,46h,03h

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for E again ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DColumn 40h,5fh,9dh,03h
	DColumn 40h,5fh,9eh,03h
	DColumn 40h,5fh,9fh,03h
 	DColumn 40h,5fh,9fh+02h,03h      ;3d
	DRow 9dh,9fh+20h,40h,03h
	DRow 9dh,9fh+20h,41h,03h
	DRow 9dh,9fh+20h,42h,03h
	DRow  9dh,9fh+20h,45h,03h        ;3d
	DRow 9dh,9fh+20h,4eh,03h
	DRow 9dh,9fh+20h,4fh,03h
	DRow 9dh,9fh+20h,50h,03h
	DRow 9dh,9fh+20h,53h,03h         ;3d	
	DRow 9dh,9fh+20h,5fh,03h 
	DRow 9dh,9fh+20h,60h,03h 
	DRow 9dh,9fh+20h,61h,03h 
	DRow 9dh,9fh+20h,62h,03h 
	DRow 9dh,9fh+20h,65h,03h         ;3d
	
	

	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;for R;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 9dh+3ch,9dh+53h,40h,03h      
	DRow 9dh+3ch,9dh+53h,41h,03h
	DRow 9dh+3ch,9dh+53h,42h,03h
	DRow 9dh+3ch,9dh+53h,45h,03h
	DColumn 40h,63h,9dh+3ch,03h
	DColumn 40h,63h,9dh+3dh,03h
	DColumn 40h,63h,9dh+3eh,03h
 	DColumn 40h,63h,9dh+40h,03h 
	DColumn 40h,4eh,9dh+53h,03h
	DColumn 40h,4eh,9dh+54h,03h
	DColumn 40h,4eh,9dh+55h,03h
	DColumn 40h,4eh,9dh+57h,03h                     ;3d	
	DRow 9dh+3ch,9dh+53h,4ah,03h
	DRow 9dh+3ch,9dh+53h,4bh,03h
	DRow 9dh+3ch,9dh+53h,4ch,03h
 	DRow 9dh+3ch,9dh+53h,4eh,03h                   ;3d

	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for curve line  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DRow 9dh+3ch,9dh+3dh,4fh,03h
	DRow 9dh+3dh,9dh+3eh,50h,03h
	DRow 9dh+3eh,9dh+3fh,51h,03h
 	DRow 9dh+3fh,9dh+40h,52h,03h
    DRow 9dh+40h,9dh+41h,53h,03h	
	DRow 9dh+41h,9dh+42h,54h,03h
	DRow 9dh+42h,9dh+43h,55h,03h
	DRow 9dh+43h,9dh+44h,56h,03h
 	DRow 9dh+44h,9dh+45h,57h,03h
    DRow 9dh+45h,9dh+46h,58h,03h	
	DRow 9dh+46h,9dh+47h,59h,03h
	DRow 9dh+47h,9dh+48h,5ah,03h
	DRow 9dh+48h,9dh+49h,5bh,03h
 	DRow 9dh+49h,9dh+4ah,5ch,03h
    DRow 9dh+4ah,9dh+4bh,5dh,03h	
	DRow 9dh+4bh,9dh+4ch,5eh,03h
	DRow 9dh+4ch,9dh+4dh,5fh,03h
	DRow 9dh+4dh,9dh+4eh,60h,03h
	DRow 9dh+4eh,9dh+4fh,61h,03h
	DRow 9dh+4fh,9dh+50h,62h,03h
	DRow 9dh+50h,9dh+51h,63h,03h
	DRow 9dh+51h,9dh+52h,64h,03h
	
	;;
	
	DRow 9dh+3ch,9dh+3dh,50h,03h
	DRow 9dh+3dh,9dh+3eh,51h,03h
	DRow 9dh+3eh,9dh+3fh,52h,03h
 	DRow 9dh+3fh,9dh+40h,53h,03h
    DRow 9dh+40h,9dh+41h,54h,03h	
	DRow 9dh+41h,9dh+42h,55h,03h
	DRow 9dh+42h,9dh+43h,56h,03h
	DRow 9dh+43h,9dh+44h,57h,03h
 	DRow 9dh+44h,9dh+45h,58h,03h
    DRow 9dh+45h,9dh+46h,59h,03h	
	DRow 9dh+46h,9dh+47h,5ah,03h
	DRow 9dh+47h,9dh+48h,5bh,03h
	DRow 9dh+48h,9dh+49h,5ch,03h
 	DRow 9dh+49h,9dh+4ah,5dh,03h
    DRow 9dh+4ah,9dh+4bh,5eh,03h	
	DRow 9dh+4bh,9dh+4ch,5fh,03h
	DRow 9dh+4ch,9dh+4dh,60h,03h
	DRow 9dh+4dh,9dh+4eh,61h,03h
	DRow 9dh+4eh,9dh+4fh,62h,03h
	DRow 9dh+4fh,9dh+50h,63h,03h
	DRow 9dh+50h,9dh+51h,64h,03h
	DRow 9dh+51h,9dh+52h,65h,03h
	DRow 9dh+3ch,9dh+3dh,51h,03h
	DRow 9dh+3dh,9dh+3eh,52h,03h
	DRow 9dh+3eh,9dh+3fh,53h,03h
 	DRow 9dh+3fh,9dh+40h,54h,03h
    DRow 9dh+40h,9dh+41h,55h,03h	
	DRow 9dh+41h,9dh+42h,56h,03h
	DRow 9dh+42h,9dh+43h,57h,03h
	DRow 9dh+43h,9dh+44h,58h,03h
 	DRow 9dh+44h,9dh+45h,59h,03h
    DRow 9dh+45h,9dh+46h,5ah,03h	
	DRow 9dh+46h,9dh+47h,5bh,03h
	DRow 9dh+47h,9dh+48h,5ch,03h
	DRow 9dh+48h,9dh+49h,5dh,03h
 	DRow 9dh+49h,9dh+4ah,5eh,03h
    DRow 9dh+4ah,9dh+4bh,5fh,03h	
	DRow 9dh+4bh,9dh+4ch,60h,03h
	DRow 9dh+4ch,9dh+4dh,61h,03h
	DRow 9dh+4dh,9dh+4eh,62h,03h
	DRow 9dh+4eh,9dh+4fh,63h,03h
	DRow 9dh+4fh,9dh+50h,64h,03h
	DRow 9dh+50h,9dh+51h,65h,03h
	DRow 9dh+51h,9dh+52h,65h,03h


	
	
	drawsquare2 0fh,73h,03h
	
	;drawball 20h,71h,04h               ;first
	
	drawsquare2 0fh,8fh,04h
	
	
	drawsquare2 30h,73h,03h
	
	;drawball 45h,71h,04h               ;second
	
    drawsquare2 30h,8fh,04h
	
	
	drawsquare2 59h,73h,03h
	
	;drawball 69h,71h,04h                ;third
	
	drawsquare2 59h,8fh,04h
	
	
	
	drawsquare2 7ch,73h,03h
	drawsquare2 7ch,8fh,04h

	
	
	
	;drawball 8fh,71h,04h               ;forth
	
	drawsquare2 0a5h,73h,03h
    drawsquare2 0a5h,8fh,04h
	
	
	;drawball 0b9h,71h,04h	           ;fifth
		
	drawsquare2 0c9h,73h,03h
	
	drawsquare2 0c9h,8fh,04h
	
	;drawball 0e0h,71h,04h              ;sixth
	
	drawsquare2 0f5h,73h,03h
	drawsquare2 0f5h,8fh,04h
	
	;drawball 10ah,71h,04h	           ;seventh
	
	drawsquare2 120h,73h,03h
	drawsquare2 120h,8fh,04h
	
	
   call far ptr sound112

pop cx 
pop dx

RET

endpage1 endp	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DRAW BALL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;procedure to draw ball
Draw_Ball PROC
MOV AH,0CH
MOV BH,0
MOV AL,12
MOV CX,COL
MOV DX,ROW
;FIRST ROW OF BUBBLE
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
;SECOND
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4

INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H

;THIRD
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H

;FOURTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;FIFTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;SIXTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;SEVENTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;EIGHTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;NINTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;TENTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;ELEVENTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;TWELVETH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;13
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;14
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;15
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2

;16
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2

;17
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7

RET
Draw_Ball ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Remove BALL  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Remove_ball PROC
MOV AH,0CH
MOV BH,0
MOV AL,00H
MOV CX,COL
MOV DX,ROW
;FIRST ROW OF BUBBLE
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
;SECOND
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H

;THIRD
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H

;FOURTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;FIFTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;SIXTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;SEVENTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;EIGHTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;NINTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;TENTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;ELEVENTH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;TWELVETH
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4
DEC CX
INT 10H ;-5
DEC CX
INT 10H ;-6

;13
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;14
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2
DEC CX
INT 10H ;-3
DEC CX
INT 10H ;-4

;15
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2

;16
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
MOV CX,COL
DEC CX 
INT 10H ;-1
DEC CX
INT 10H ;-2

;17
MOV CX,COL
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7

RET
Remove_ball ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;; 2nd Sound ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

sound2 proc FAR
PUSH    AX
  PUSH    BX
  PUSH    CX
  PUSH    DX
  PUSH    DI
  MOV AL, 0B6H
  OUT 43H, AL
  MOV DX, 14H
  MOV AX, 4F38H
  DIV DI
  OUT 42H, AL
  MOV AL, AH
  OUT 42H, AL
  IN  AL, 61H
  MOV AH, AL
  OR  AL, 3
  OUT 61H, AL
L1A: MOV CX, 6801
L2A: LOOP    L2A
  DEC BX
  JNZ L1A
  MOV AL, AH
  OUT 61H, AL
  POP DI
  POP DX
  POP CX
  POP BX
  POP AX
  RET
sound2   ENDP

sound112 proc FAr

PUSH CX
PUSH DX

jmp MELL

MOV BX, 50
g3: MOV AH, 0
  INT 16H
  
  CMP Ah, 50h  ;dw
  JE  FFA
  CMP Ah,4bh
  JE  SOLL
  CMP Ah,4dh
  JE  LLA
  CMP Ah,48h ;up
  JE  CII
  CMP Al,20h                   ;dw infinite music
  JE  MELL
  JNZ g3
DOO: MOV DI, 131
  CALL    sound2
  JMP g3
REE: MOV DI, 147
  CALL    sound2
  JMP g3
MII: MOV DI, 165
  CALL    sound2
  JMP g3
FFA: MOV DI, 175
  CALL    sound2
  JMP g3
SOLL:    MOV DI, 196
  CALL    sound2
  JMP g3
LLA: MOV DI, 220
  CALL    sound2
  JMP g3
CII: MOV DI, 247
  CALL    sound2
  JMP g3
EXITR:   MOV AH, 00H
  MOV AL, 03H
  INT 10H
  MOV AX, 4C00H
  INT 21H
  RET

MELL:    
LL5: LOOP LL5
  MOV DI, 510
  CALL    sound2
  MOV DI, 420 
  CALL    sound2
  MOV DI, 300
  CALL    sound2
  MOV DI, 230
  CALL    sound2
  MOV DI, 170
  CALL    sound2
  MOV DI, 560
  CALL    sound2
  MOV DI, 450
  CALL    sound2
  MOV DI, 370
  CALL    sound2
  MOV DI, 900
  CALL    sound2
  MOV DI, 830
  CALL    sound2
  MOV DI, 250
  CALL    sound2
  MOV DI, 470
  CALL    sound2
  MOV DI, 480
  CALL    sound2
  MOV DI, 290
  CALL    sound2
  MOV DI, 230
  CALL    sound2
  MOV DI, 520
  CALL    sound2
  MOV DI, 410
  CALL    sound2
  MOV DI, 970
  CALL    sound2
  MOV DI, 480
  CALL    sound2
  MOV DI, 390
  CALL    sound2
  MOV DI, 730
  CALL    sound2
  MOV DI, 420
  CALL    sound2
  MOV DI, 620
  CALL    sound2
  MOV DI, 210
  CALL    sound2
  MOV DI, 330
  CALL    sound2
  MOV DI, 560
  CALL    sound2
  MOV DI, 970
  CALL    sound2
  MOV DI, 380
  CALL    sound2
  MOV DI, 850
  CALL    sound2
  MOV DI, 120
  CALL    sound2
  MOV DI, 530
  CALL    sound2
  MOV DI, 620
  CALL    sound2
  MOV DI, 310
  CALL    sound2
  MOV DI, 680
  CALL    sound2
  MOV DI, 190
  CALL    sound2
  MOV DI, 510
  CALL    sound2
  MOV DI, 420
  CALL    sound2
  MOV DI, 140
  CALL    sound2
  mov ah,0
  int 16h
  cmp al , 'b' 
  Je  exit121

  jmp  exit121
  
  exit121:
  MOV AH, 00H
  MOV AL, 03H
  INT 10H
  MOV AX, 4C00H
  INT 21H
  
  pop dx
  pop cx
  
  ret

sound112 endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DARW ARROW;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dRAW ARROW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Draw_Arrow proc
push cx
push dx

MOV AH,0CH
MOV BH,0
MOV AL,04
MOV CX,Y
MOV DX,X
;FIRST ROW OF ARS
; EIGHTH   
; used for arrow
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX

; NINTH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
INT 10H ;11
INC CX
INT 10H ;12

; TENTH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12

; ELEVENTH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12

; TWELVETH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12

; 13
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX 
INT 10H ;12

; 14
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13

; 1 FOR ARROW for coln 
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX 
INT 10H ;11
INC DX
INT 10H ;12
INC DX
INT 10H ;13
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX
INT 10H ;-3
DEC DX

;; 2 FOR ARROW for coln 
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX 
INT 10H ;11
INC DX 
INT 10H ;11
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX

;3 for col 
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX 
INT 10H ;11
INC DX 
INT 10H ;11
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX

; 4
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX

;5
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX
INT 10H ;10

;6
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX

;7
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8

;8
MOV DX,X
Dec CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5

;9
MOV DX,X
Dec CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX

pop cx
pop dx
ret
Draw_Arrow endp

Remove_Arrow proc

push cx
push dx

MOV AH,0CH
MOV BH,0
MOV AL,00h
MOV CX,Y
MOV DX,X
;FIRST ROW OF ARS

; EIGHTH   
; used for arrow
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX

; NINTH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13
INT 10H ;11
INC CX
INT 10H ;12

; TENTH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12

; ELEVENTH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12

; TWELVETH
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12

; 13
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX 
INT 10H ;12

; 14
MOV CX,Y
INC DX
INT 10H ;1
INC CX
INT 10H ;2
INC CX
INT 10H ;3
INC CX
INT 10H ;4
INC CX
INT 10H ;5
INC CX
INT 10H ;6
INC CX
INT 10H ;7
INC CX
INT 10H ;8
INC CX
INT 10H ;9
INC CX
INT 10H ;10
INC CX 
INT 10H ;11
INC CX
INT 10H ;12
INC CX
INT 10H ;13

; 1 FOR ARROW for coln 
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX 
INT 10H ;11
INC DX
INT 10H ;12
INC DX
INT 10H ;13
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX
INT 10H ;-3
DEC DX

;; 2 FOR ARROW for coln 
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX 
INT 10H ;11
INC DX 
INT 10H ;11
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX

;3 for col 
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX 
INT 10H ;11
INC DX 
INT 10H ;11
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX

; 4
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
MOV DX,X
INT 10H ;-1
DEC DX
INT 10H ;-2
DEC DX

;5
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX
INT 10H ;9
INC DX
INT 10H ;10
INC DX
INT 10H ;10

;6
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8
INC DX

;7
MOV DX,X
INC CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5
INC DX
INT 10H ;6
INC DX
INT 10H ;7
INC DX
INT 10H ;8

;8
MOV DX,X
Dec CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX
INT 10H ;4
INC DX
INT 10H ;5

;9
MOV DX,X
Dec CX
INT 10
INC DX
INT 10H ;2
INC DX
INT 10H ;3
INC DX

pop cx
pop dx
ret
Remove_Arrow endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DLAY PROC  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Delayproc proc 
  mov cx,DelayTime
  mov dx,3dah
  loop11:
    push cx
    bbb:
      in al,dx
      and al,08h
      jnz bbb
    l21:
      in al,dx
      and al,08h
      jz l21
   pop cx
   loop loop11
   ret
Delayproc endp



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MOV ARROW DOWN  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov_Arrow_down proc

push cx
push dx



call Remove_Arrow

;call DelayProc  			   
inc X
call Draw_Arrow

cmp X,70+20h
 
jge ex


ex:

pop dx
pop cx

ret

mov_Arrow_down endp

mov_Arrow_up PROC
push cx
push dx
call Remove_Arrow

;call DelayProc  			   
dec X
call Draw_Arrow

cmp X,7fh
 
jbe ex1


ex1:

pop dx
pop cx

ret

mov_Arrow_up endp

MOVE_Arrow proc
	push cx
	push dx


    ;space scan code
 gg:
call Draw_Arrow
call Delayproc
call Remove_Arrow
inc Y

cmp Y,130h+7h
               
jge Ex2 
jmp gg
;cmp col1,0h
;JNZ gg

 Ex2:
	;push cx
	;push dx
	 
	 call Remove_Arrow
	 jmp d3
	d3:
	;mov cx,10
	call DelayProc
	call DelayProc
	;dec cx
	;cmp cx,0
	;jnz d2
	 mov X,26
	 mov Y,16
	 call Draw_Arrow  
	 ;call MOVE_Arrow

	 
pop dx
 pop cx


ret


	MOVE_Arrow endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov_Ball_up proc

push cx
push dx

call Remove_ball

call DelayProc  			   
dec ROW
call Draw_Ball

cmp ROW,7fh
 
jbe exx

exx:
pop dx
pop cx

ret
mov_Ball_up endp

can_arrow_mov proc
	push cx
	push dx
	
	mov can_move,1
	call far ptr checkingarrow
	cmp can_move,0
	jne exit12
	inc hit
	call far ptr Display_score
	call Remove_Arrow
	call Remove_ball
	mov Y,26
	mov X,16
	call Draw_Arrow
	mov COL,146
	mov ROW,138
	call Draw_Ball
	
	
exit12:
	pop dx
	pop cx
	ret
can_arrow_mov endp


;===================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; hit miss ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Display_score proc far
push bx
push cx

	SETCURSOR 18,29	;SETTING CURSOR FOR 1ST STRING BY MACRO
    printstring hit


    SETCURSOR 20,29
    printstring miss
	
pop cx
pop bx	
	ret
Display_score endp
;==================================================
checkingarrow proc far
	push cx
	push dx
	mov cx,X
	mov dx,Y
	add cx,147
	add dx,139
	cmp cx,x
	jne exit2
	cmp dx,Y
	jne exit2
	mov ah,0dh
	mov bh,0
	int 10h
	cmp al,12
	jne exit2
	mov can_move,0
exit2:
	pop dx
	pop cx
	ret
checkingarrow endp
; hitchk proc

; mov ah,0dh
; MOV bh,0
; mov cx,26+1
; mov dx, 16

; MOV al,12
; cmp al,12

 

; hitchk endp

 MOVE_Ball proc
 
 
 
dddd:
		;call draw_border
		call Draw_Ball
        mov ah,0
		int 16h
		JE dddd
		cmp ah,1ch
		jne scroup
		call far ptr HIT_score
scroup:
		cmp ah,50h
		je movedown1
		cmp ah,39h
		je shoot1
		cmp ah,48h
		je moveup1
		call Draw_Ball
		cmp al,1CH
		
		cmp al,7aH
		jE last21
last21: 

 call far ptr endpage1		
		
ddddd:
	call Draw_Ball
call Delayproc
call Remove_ball
dec ROW
dec CNT1

cmp ROW,7h                
jbe Exx1 

cmp CNT1,0
JNZ dddd

 Exx1:
	 push cx
	 push dx 
	 call Remove_ball
	 jmp d2
	d2:		
	mov ROW,138
	mov COL,146
	call Draw_Ball
	call MOVE_Ball  
	 
movedown1:
		call Draw_Ball
		call mov_Arrow_down
		call can_arrow_mov
		
		jmp ddddd
shoot1:
		call Draw_Ball
		call MOVE_Arrow
		call can_arrow_mov
		call far ptr draw_border
		jmp ddddd
		
moveup1:

		call Draw_Ball
		call mov_Arrow_up
		call can_arrow_mov
		jmp ddddd
		
bmoveup1:
		call Draw_Ball
		call mov_Ball_up
		call can_arrow_mov
		jmp ddddd
; go:    ;to clear screen
    ; mov ah,06
	; mov al,0
	; mov bh,20h
	; mov cx,0
	; mov dx,184fh
	; int 10h
  ; ;;;;;;;;;;;;
  ; MOV AH, 00H
   ; int 16h
  ; cmp al,20h
  ; je last21
  ; MOV AX, 4C00H
  ; INT 21H


		
  rexe:
mov ah,01
int 21h

pop dx
pop cx


ret
MOVE_Ball endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; BORDER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

draw_border proc far
push cx 
push dx 


 DRow 5h,130h+9h,5h,09h 		;for upper line
	DRow 5h,130h+9h,90h+32h,09h
	DColumn 5h,90h+32h,5h,09h
	DColumn 5h,90h+32h,130h+9h,09h
	DRow 5h,130h+8h,6h,09h	 ;for lower line 
	DRow 5h,130h+9h,90h+31h,09h
	DColumn 5h,90h+31h,4h,09h	;left line
	DColumn 5h,90h+31h,130h+8h,09h
	DRow 5h,130h+8h,7h,0ch
	DRow 5h,130h+9h,90h+30h,0ch
	DColumn 5h,90h+30h,130h+7h,0ch  ;right line
	DColumn 5h,90h+30h,3h,0ch
	;another boder
	DRow 5h,139h,5h,04h 		;for upper line
	DRow 5h,139h,3h,04h
	DRow 5h,139h,90h+32h,04h	 ;for lower line 
	DRow 5h,139h,90h+34h,04h
	DColumn 5h,90h+32h,5h,04h	;left line
	DColumn 5h,90h+32h,3h,04h
	DColumn 5h,90h+32h,130h+9h,04h  ;right line
	DColumn 5h,90h+32h,132h+9h,04h

pop dx
pop cx
ret
draw_border endp

HIT_score proc far
	push cx 
	push dx 

bra:
	inc hit
	SETCURSOR 20,37
	mov ah,2
	mov dl,'0'

	int 21h
	
	SETCURSOR 18,37
	mov ah,2
	mov dl,'1'

	int 21h
	
	mov ah,0
	int 16h
	cmp al,97
	je bre
	jmp rrr
bre:	
	inc hit
	SETCURSOR 20,37
	mov ah,2
	mov dl,'1'

	int 21h
	
	SETCURSOR 18,37
	mov ah,2
	mov dl,'0'

	int 21h	
rrr:	
	pop dx
	pop cx
ret
HIT_score endp


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GAM PAG  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gamepage proc far
push cx
push dx


;to clear screen
mov ah,06
mov al,0
mov bh,1fh
mov cx,0
mov dx,184fh
int 10h
	
;for read pixel in G.mode	
mov ah,0h
mov al,0dh
mov bh,0h
mov bl,10h
mov ch,0h
mov cl,0h
mov dh,24
mov dl,79
int 10h

; to change background colour
mov ah,0bh
mov bh,00h
mov bl,83h
int 10h
	
	;draw a border		
 
    DRow 5h,130h+9h,5h,09h 		;for upper line
	DRow 5h,130h+9h,90h+32h,09h
	DColumn 5h,90h+32h,5h,09h
	DColumn 5h,90h+32h,130h+9h,09h
	DRow 5h,130h+8h,6h,09h	 ;for lower line 
	DRow 5h,130h+9h,90h+31h,09h
	DColumn 5h,90h+31h,4h,09h	;left line
	DColumn 5h,90h+31h,130h+8h,09h
	DRow 5h,130h+8h,7h,0ch
	DRow 5h,130h+9h,90h+30h,0ch
	DColumn 5h,90h+30h,130h+7h,0ch  ;right line
	DColumn 5h,90h+30h,3h,0ch
	;another boder
	DRow 5h,139h,5h,04h 		;for upper line
	DRow 5h,139h,3h,04h
	DRow 5h,139h,90h+32h,04h	 ;for lower line 
	DRow 5h,139h,90h+34h,04h
	DColumn 5h,90h+32h,5h,04h	;left line
	DColumn 5h,90h+32h,3h,04h
	DColumn 5h,90h+32h,130h+9h,04h  ;right line
	DColumn 5h,90h+32h,132h+9h,04h
	
    ;drawsbox 08dh,9bh,08h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; hit miss ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	drawsbox 8dh,9bh,08h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   base line     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 5h,137h,70h+3ah,04h
	DRow 5h,137h,70h+3bh,04h
	DRow 5h,137h,70h+3ch,04h
	DRow 5h,137h,70h+3dh,04h
	DRow 5h,137h,70h+3eh,04h
	DRow 5h,137h,70h+3fh,04h
	DRow 5h,137h,70h+40h,04h	
	DRow 5h,137h,70h+41h,04h
	DRow 5h,137h,70h+42h,04h
	DRow 5h,137h,70h+43h,04h
	DRow 5h,137h,70h+44h,04h
	DRow 5h,137h,70h+45h,04h
	DRow 5h,137h,70h+46h,04h	
	DRow 5h,137h,70h+47h,04h
	DRow 5h,137h,70h+48h,04h
	DRow 5h,137h,70h+49h,04h
	DRow 5h,137h,70h+4ah,04h
	DRow 5h,137h,70h+4bh,04h
	DRow 5h,137h,70h+4ch,04h	
	DRow 5h,137h,70h+4dh,04h	
	DRow 5h,137h,70h+4eh,04h
	DRow 5h,137h,70h+4fh,04h
	DRow 5h,137h,70h+50h,04h
	DRow 5h,137h,70h+51h,06h
	DRow 5h,137h,70h+52h,06h
	DRow 5h,137h,70h+53h,06h	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 1st  buildings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 5h,1fh,70h+27h,04h
	DRow 5h,1fh,70h+28h,03h
	DRow 5h,1fh,70h+29h,03h
	DRow 5h,1fh,70h+2ah,03h
	DRow 5h,1fh,70h+2bh,03h
	DRow 5h,1fh,70h+2ch,03h
	DRow 5h,1fh,70h+2dh,03h     
	DRow 5h,1fh,70h+2eh,03h
	DRow 5h,1fh,70h+2fh,03h
	DRow 5h,1fh,70h+30h,03h
	DRow 5h,1fh,70h+31h,03h
	DRow 5h,1fh,70h+32h,03h     
	DRow 5h,1fh,70h+33h,03h
	DRow 5h,1fh,70h+34h,03h
	DRow 5h,1fh,70h+35h,03h
	DRow 5h,1fh,70h+36h,03h
	DRow 5h,1fh,70h+37h,03h
	DRow 5h,1fh,70h+38h,03h
	DRow 5h,1fh,70h+39h,03h
	DRow 5h,1fh,70h+3ah,03h
	DRow 5h,1fh,70h+3bh,03h
	DRow 5h,1fh,70h+3ch,03h
	DRow 5h,1fh,70h+3dh,03h
	DRow 5h,1fh,70h+3eh,03h
	DRow 5h,1fh,70h+3fh,03h
	DRow 5h,1fh,70h+40h,03h
	DRow 5h,1fh,70h+41h,03h
	DRow 5h,1fh,70h+42h,03h
	DRow 5h,1fh,70h+43h,03h
	DRow 5h,1fh,70h+44h,03h
	DRow 5h,1fh,70h+45h,03h
	DRow 5h,1fh,70h+46h,03h
	DRow 5h,1fh,70h+47h,03h
	DRow 5h,1fh,70h+48h,03h
	DRow 5h,1fh,70h+49h,03h
	DRow 5h,1fh,70h+4ah,03h
	DRow 5h,1fh,70h+4bh,03h
	DRow 5h,1fh,70h+4ch,03h
	DRow 5h,1fh,70h+4dh,03h
	DRow 5h,1fh,70h+4eh,03h
	DRow 5h,1fh,70h+4fh,03h
	DRow 5h,1fh,70h+50h,03h

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 2nd building .;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 1fh,2fh,70h+2ch,04h
	DRow 1fh,2fh,70h+2dh,0eh
	DRow 1fh,2fh,70h+2eh,0eh
	DRow 1fh,2fh,70h+2fh,0eh
	DRow 1fh,2fh,70h+30h,0eh	
	DRow 1fh,2fh,70h+31h,0eh
	DRow 1fh,2fh,70h+32h,0eh
	DRow 1fh,2fh,70h+33h,0eh
	DRow 1fh,2fh,70h+34h,0eh
	DRow 1fh,2fh,70h+35h,0eh
	DRow 1fh,2fh,70h+36h,0eh
	DRow 1fh,2fh,70h+37h,0eh
	DRow 1fh,2fh,70h+38h,0eh
	DRow 1fh,2fh,70h+39h,0eh
	DRow 1fh,2fh,70h+3ah,0eh
	DRow 1fh,2fh,70h+3bh,0eh
	DRow 1fh,2fh,70h+3ch,0eh
	DRow 1fh,2fh,70h+3dh,0eh
	DRow 1fh,2fh,70h+3eh,0eh
	DRow 1fh,2fh,70h+3fh,0eh
	DRow 1fh,2fh,70h+40h,0eh
	DRow 1fh,2fh,70h+41h,0eh
	DRow 1fh,2fh,70h+42h,0eh
	DRow 1fh,2fh,70h+43h,0eh
	DRow 1fh,2fh,70h+44h,0eh
	DRow 1fh,2fh,70h+45h,0eh
	DRow 1fh,2fh,70h+46h,0eh
	DRow 1fh,2fh,70h+47h,0eh
	DRow 1fh,2fh,70h+48h,0eh
	DRow 1fh,2fh,70h+49h,0eh
	DRow 1fh,2fh,70h+4ah,0eh
	DRow 1fh,2fh,70h+4bh,0eh
	DRow 1fh,2fh,70h+4ch,0eh
	DRow 1fh,2fh,70h+4dh,0eh
	DRow 1fh,2fh,70h+4eh,0eh
	DRow 1fh,2fh,70h+4fh,0eh
	DRow 1fh,2fh,70h+50h,0eh

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 3rd building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 2fh,3fh,70h+1fh,04h
    DRow 2fh,3fh,70h+20h,09h
	DRow 2fh,3fh,70h+21h,09h
	DRow 2fh,3fh,70h+22h,09h
	DRow 2fh,3fh,70h+23h,09h
	DRow 2fh,3fh,70h+24h,09h
	DRow 2fh,3fh,70h+25h,09h
	DRow 2fh,3fh,70h+26h,09h
	DRow 2fh,3fh,70h+27h,09h
	DRow 2fh,3fh,70h+28h,09h
	DRow 2fh,3fh,70h+29h,09h
	DRow 2fh,3fh,70h+2ah,09h
	DRow 2fh,3fh,70h+2bh,09h
	DRow 2fh,3fh,70h+2ch,09h
	DRow 2fh,3fh,70h+2dh,09h
	DRow 2fh,3fh,70h+2eh,09h
	DRow 2fh,3fh,70h+2fh,09h
	DRow 2fh,3fh,70h+30h,09h
	DRow 2fh,3fh,70h+31h,09h
	DRow 2fh,3fh,70h+32h,09h
	DRow 2fh,3fh,70h+33h,09h
	DRow 2fh,3fh,70h+34h,09h
	DRow 2fh,3fh,70h+35h,09h
	DRow 2fh,3fh,70h+36h,09h
	DRow 2fh,3fh,70h+37h,09h
	DRow 2fh,3fh,70h+38h,09h
	DRow 2fh,3fh,70h+39h,09h
	DRow 2fh,3fh,70h+3ah,09h
	DRow 2fh,3fh,70h+3bh,09h
	DRow 2fh,3fh,70h+3ch,09h
	DRow 2fh,3fh,70h+3dh,09h
	DRow 2fh,3fh,70h+3eh,09h
	DRow 2fh,3fh,70h+3fh,09h
	DRow 2fh,3fh,70h+40h,09h
	DRow 2fh,3fh,70h+41h,09h
	DRow 2fh,3fh,70h+42h,09h
	DRow 2fh,3fh,70h+43h,09h
	DRow 2fh,3fh,70h+44h,09h
	DRow 2fh,3fh,70h+45h,09h
	DRow 2fh,3fh,70h+46h,09h
	DRow 2fh,3fh,70h+47h,09h
	DRow 2fh,3fh,70h+48h,09h
	DRow 2fh,3fh,70h+49h,09h
	DRow 2fh,3fh,70h+4ah,09h
	DRow 2fh,3fh,70h+4bh,09h
	DRow 2fh,3fh,70h+4ch,09h
	DRow 2fh,3fh,70h+4dh,09h
	DRow 2fh,3fh,70h+4eh,09h
	DRow 2fh,3fh,70h+4fh,09h
    DRow 2fh,3fh,70h+50h,09h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for 4th building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 3fh,4fh,70h+31h,04h
	DRow 3fh,4fh,70h+32h,0fh
	DRow 3fh,4fh,70h+33h,0fh
	DRow 3fh,4fh,70h+34h,0fh
	DRow 3fh,4fh,70h+35h,0fh
	DRow 3fh,4fh,70h+36h,0fh
	DRow 3fh,4fh,70h+37h,0fh
	DRow 3fh,4fh,70h+38h,0fh
    DRow 3fh,4fh,70h+39h,0fh
	DRow 3fh,4fh,70h+3ah,0fh
	DRow 3fh,4fh,70h+3bh,0fh
	DRow 3fh,4fh,70h+3ch,0fh
	DRow 3fh,4fh,70h+3dh,0fh
	DRow 3fh,4fh,70h+3eh,0fh
	DRow 3fh,4fh,70h+3fh,0fh
	DRow 3fh,4fh,70h+40h,0fh
	DRow 3fh,4fh,70h+41h,0fh
	DRow 3fh,4fh,70h+42h,0fh
	DRow 3fh,4fh,70h+43h,0fh
	DRow 3fh,4fh,70h+44h,0fh
	DRow 3fh,4fh,70h+45h,0fh
	DRow 3fh,4fh,70h+46h,0fh
	DRow 3fh,4fh,70h+47h,0fh
	DRow 3fh,4fh,70h+48h,0fh
	DRow 3fh,4fh,70h+49h,0fh
	DRow 3fh,4fh,70h+4ah,0fh
	DRow 3fh,4fh,70h+4bh,0fh
	DRow 3fh,4fh,70h+4ch,0fh
	DRow 3fh,4fh,70h+4dh,0fh
	DRow 3fh,4fh,70h+4eh,0fh
	DRow 3fh,4fh,70h+4fh,0fh
    DRow 3fh,4fh,70h+50h,0fh
	
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for 5th Building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DRow 4fh,5fh,70h+19h,04
	DRow 4fh,5fh,70h+1ah,0ch
	DRow 4fh,5fh,70h+1bh,0ch
	DRow 4fh,5fh,70h+1ch,0ch
	DRow 4fh,5fh,70h+1dh,0ch
	DRow 4fh,5fh,70h+1eh,0ch
	DRow 4fh,5fh,70h+1fh,0ch
	DRow 4fh,5fh,70h+20h,0ch
	DRow 4fh,5fh,70h+21h,0ch
	DRow 4fh,5fh,70h+22h,0ch
	DRow 4fh,5fh,70h+23h,0ch
	DRow 4fh,5fh,70h+24h,0ch
	DRow 4fh,5fh,70h+25h,0ch
	DRow 4fh,5fh,70h+26h,0ch
	DRow 4fh,5fh,70h+27h,0ch
	DRow 4fh,5fh,70h+28h,0ch
	DRow 4fh,5fh,70h+29h,0ch
	DRow 4fh,5fh,70h+2ah,0ch
	DRow 4fh,5fh,70h+2bh,0ch
	DRow 4fh,5fh,70h+2ch,0ch
	DRow 4fh,5fh,70h+2dh,0ch
	DRow 4fh,5fh,70h+2eh,0ch
	DRow 4fh,5fh,70h+2fh,0ch
	DRow 4fh,5fh,70h+30h,0ch
	DRow 4fh,5fh,70h+31h,0ch
	DRow 4fh,5fh,70h+32h,0ch
	DRow 4fh,5fh,70h+33h,0ch
	DRow 4fh,5fh,70h+34h,0ch
	DRow 4fh,5fh,70h+35h,0ch
	DRow 4fh,5fh,70h+36h,0ch
	DRow 4fh,5fh,70h+37h,0ch
	DRow 4fh,5fh,70h+38h,0ch
	DRow 4fh,5fh,70h+39h,0ch
	DRow 4fh,5fh,70h+3ah,0ch
	DRow 4fh,5fh,70h+3bh,0ch
	DRow 4fh,5fh,70h+3ch,0ch
	DRow 4fh,5fh,70h+3dh,0ch
	DRow 4fh,5fh,70h+3eh,0ch
	DRow 4fh,5fh,70h+3fh,0ch
	DRow 4fh,5fh,70h+40h,0ch
	DRow 4fh,5fh,70h+41h,0ch
	DRow 4fh,5fh,70h+42h,0ch
	DRow 4fh,5fh,70h+43h,0ch
	DRow 4fh,5fh,70h+44h,0ch
	DRow 4fh,5fh,70h+45h,0ch
	DRow 4fh,5fh,70h+46h,0ch
	DRow 4fh,5fh,70h+47h,0ch
	DRow 4fh,5fh,70h+48h,0ch
	DRow 4fh,5fh,70h+49h,0ch
	DRow 4fh,5fh,70h+4ah,0ch
	DRow 4fh,5fh,70h+4bh,0ch
	DRow 4fh,5fh,70h+4ch,0ch
	DRow 4fh,5fh,70h+4dh,0ch
	DRow 4fh,5fh,70h+4eh,0ch
	DRow 4fh,5fh,70h+4fh,0ch
    DRow 4fh,5fh,70h+50h,0ch
	drawsquare  65h,9fh,00h 
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for 6 building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;DColumn 70h+0fh,70h+1fh,60h,04h
	DColumn 70h+0fh,70h+37h,80h,04h
	Drow 5fh,7fh,70h+0fh,04h
	;Drow 5fh,7fh,70h+1fh,04h
    ;Drow 5fh,7fh,70h+0eh,05h
	;Drow 5fh,7fh,70h+0fh,05h
	Drow 5fh,7fh,70h+11h,05h
	Drow 5fh,7fh,70h+10h,05h
	Drow 5fh,7fh,70h+12h,05h
	Drow 5fh,7fh,70h+13h,05h
	Drow 5fh,7fh,70h+14h,05h
	Drow 5fh,7fh,70h+15h,05h
	Drow 5fh,7fh,70h+16h,05h
	Drow 5fh,7fh,70h+17h,05h	
	Drow 5fh,7fh,70h+18h,05h
	Drow 5fh,7fh,70h+19h,05h
	Drow 5fh,7fh,70h+1ah,05h
	Drow 5fh,7fh,70h+1bh,05h
	Drow 5fh,7fh,70h+1ch,05h
	Drow 5fh,7fh,70h+1dh,05h
    Drow 5fh,7fh,70h+1eh,05h
	Drow 5fh,7fh,70h+1fh,05h
	Drow 5fh,7fh,70h+20h,05h
	Drow 5fh,7fh,70h+21h,05h
	Drow 5fh,7fh,70h+22h,05h
	Drow 5fh,7fh,70h+23h,05h
	Drow 5fh,7fh,70h+24h,05h
	Drow 5fh,7fh,70h+25h,05h
	Drow 5fh,7fh,70h+26h,05h
	Drow 5fh,7fh,70h+27h,05h
    Drow 5fh,7fh,70h+28h,05h
	Drow 5fh,7fh,70h+29h,05h	
	Drow 5fh,7fh,70h+2ah,05h
	Drow 5fh,7fh,70h+2bh,05h
	Drow 5fh,7fh,70h+2ch,05h
	Drow 5fh,7fh,70h+2dh,05h
	Drow 5fh,7fh,70h+2eh,05h
	Drow 5fh,7fh,70h+2fh,05h
	Drow 5fh,7fh,70h+30h,05h
	Drow 5fh,7fh,70h+31h,05h
	Drow 5fh,7fh,70h+32h,05h
	Drow 5fh,7fh,70h+33h,05h
	Drow 5fh,7fh,70h+34h,05h
	Drow 5fh,7fh,70h+35h,05h
	Drow 5fh,7fh,70h+36h,05h
	Drow 5fh,7fh,70h+37h,05h
	Drow 5fh,7fh,70h+38h,05h
	Drow 5fh,7fh,70h+39h,05h
	Drow 5fh,7fh,70h+3ah,05h
	Drow 5fh,7fh,70h+3bh,05h
	Drow 5fh,7fh,70h+3ch,05h
	Drow 5fh,7fh,70h+3dh,05h
	Drow 5fh,7fh,70h+3eh,05h
	Drow 5fh,7fh,70h+3fh,05h
	Drow 5fh,7fh,70h+40h,05h
	Drow 5fh,7fh,70h+41h,05h
	Drow 5fh,7fh,70h+42h,05h
	Drow 5fh,7fh,70h+43h,05h
	Drow 5fh,7fh,70h+44h,05h
	Drow 5fh,7fh,70h+45h,05h
	Drow 5fh,7fh,70h+46h,05h
	Drow 5fh,7fh,70h+47h,05h
	Drow 5fh,7fh,70h+48h,05h
	Drow 5fh,7fh,70h+49h,05h
	Drow 5fh,7fh,70h+4ah,05h
	Drow 5fh,7fh,70h+4bh,05h
	Drow 5fh,7fh,70h+4ch,05h
	Drow 5fh,7fh,70h+4dh,05h
	Drow 5fh,7fh,70h+4eh,05h
	Drow 5fh,7fh,70h+4fh,05h
	Drow 5fh,7fh,70h+50h,05h
	
	
    drawsquare  065h,89h,00h   ;for 6
	drawsquare  073h,89h,00h   ;for 6
	drawsquare  055h,90h,00h   ;for 5
	drawsquare  044h,0a7h,00h  ;for 4
    drawsquare  034h,97h,00h   ;for 3
	drawsquare  024h,0a1h,00h   ;for 2
    drawsquare  014h,0a0h,00h   ;for 1
	drawsquare  08h,0a0h,00h   ;for 1
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    for 7 building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	Drow 0aah,0b5h,70h+2fh,04h
    Drow 0aah,0b5h,70h+30h,0ah
	Drow 0aah,0b5h,70h+31h,0ah
	Drow 0aah,0b5h,70h+32h,0ah
	Drow 0aah,0b5h,70h+33h,0ah
	Drow 0aah,0b5h,70h+34h,0ah
	Drow 0aah,0b5h,70h+35h,0ah
	Drow 0aah,0b5h,70h+36h,0ah
	Drow 0aah,0b5h,70h+37h,0ah
	Drow 0aah,0b5h,70h+38h,0ah
	Drow 0aah,0b5h,70h+39h,0ah
	Drow 0aah,0b5h,70h+3ah,0ah
	Drow 0aah,0b5h,70h+3bh,0ah
	Drow 0aah,0b5h,70h+3ch,0ah
	Drow 0aah,0b5h,70h+3dh,0ah
	Drow 0aah,0b5h,70h+3eh,0ah
	Drow 0aah,0b5h,70h+3fh,0ah
	Drow 0aah,0b5h,70h+40h,0ah
	Drow 0aah,0b5h,70h+41h,0ah
	Drow 0aah,0b5h,70h+42h,0ah
	Drow 0aah,0b5h,70h+43h,0ah
	Drow 0aah,0b5h,70h+44h,0ah
	Drow 0aah,0b5h,70h+45h,0ah
	Drow 0aah,0b5h,70h+46h,0ah
	Drow 0aah,0b5h,70h+47h,0ah
	Drow 0aah,0b5h,70h+48h,0ah
	Drow 0aah,0b5h,70h+49h,0ah
	Drow 0aah,0b5h,70h+4ah,0ah
	Drow 0aah,0b5h,70h+4bh,0ah
	Drow 0aah,0b5h,70h+4ch,0ah
	Drow 0aah,0b5h,70h+4dh,0ah
	Drow 0aah,0b5h,70h+4eh,0ah
	Drow 0aah,0b5h,70h+4fh,0ah
	Drow 0aah,0b5h,70h+50h,0ah
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 8th building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
   ;DRow 0b5h,0cfh,70h+3ah,04h
	DRow 0b5h,0cfh,70h+3ah,04h
	DRow 0b5h,0cfh,70h+3bh,07h
	DRow 0b5h,0cfh,70h+3ch,07h
	DRow 0b5h,0cfh,70h+3dh,03h
	DRow 0b5h,0cfh,70h+3eh,07h
	DRow 0b5h,0cfh,70h+3fh,03h
	DRow 0b5h,0cfh,70h+40h,07h
	DRow 0b5h,0cfh,70h+41h,03h
	DRow 0b5h,0cfh,70h+42h,03h	
    DRow 0b5h,0cfh,70h+43h,03h
	DRow 0b5h,0cfh,70h+44h,03h	
	DRow 0b5h,0cfh,70h+45h,03h
	DRow 0b5h,0cfh,70h+46h,03h
	DRow 0b5h,0cfh,70h+47h,03h	
    DRow 0b5h,0cfh,70h+48h,03h
	DRow 0b5h,0cfh,70h+49h,03h
	DRow 0b5h,0cfh,70h+4ah,03h
	DRow 0b5h,0cfh,70h+4bh,03h
	DRow 0b5h,0cfh,70h+4ch,03h	
    DRow 0b5h,0cfh,70h+4dh,03h
	DRow 0b5h,0cfh,70h+4eh,03h
	DRow 0b5h,0cfh,70h+4fh,03h
	DRow 0b5h,0cfh,70h+50h,03h
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 9 building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 0cfh,0e0h,70h+2dh,04h
	DRow 0cfh,0e0h,70h+2dh,04h
    DRow 0cfh,0e0h,70h+2eh,0dh	
	DRow 0cfh,0e0h,70h+2fh,0dh
	DRow 0cfh,0e0h,70h+30h,0dh
    DRow 0cfh,0e0h,70h+31h,0dh	
	DRow 0cfh,0e0h,70h+32h,0dh
	DRow 0cfh,0e0h,70h+33h,0dh
    DRow 0cfh,0e0h,70h+34h,0dh	
	DRow 0cfh,0e0h,70h+35h,0dh
	DRow 0cfh,0e0h,70h+36h,0dh
    DRow 0cfh,0e0h,70h+37h,0dh	
	DRow 0cfh,0e0h,70h+38h,0dh
	DRow 0cfh,0e0h,70h+39h,0dh
    DRow 0cfh,0e0h,70h+3ah,0dh	
	DRow 0cfh,0e0h,70h+3bh,0dh
	DRow 0cfh,0e0h,70h+3ch,0dh
    DRow 0cfh,0e0h,70h+3dh,0dh	
	DRow 0cfh,0e0h,70h+3eh,0dh	
	DRow 0cfh,0e0h,70h+3fh,0dh
    DRow 0cfh,0e0h,70h+40h,0dh	
	DRow 0cfh,0e0h,70h+41h,0dh
	DRow 0cfh,0e0h,70h+42h,0dh
    DRow 0cfh,0e0h,70h+43h,0dh	
	DRow 0cfh,0e0h,70h+44h,0dh
	DRow 0cfh,0e0h,70h+45h,0dh
    DRow 0cfh,0e0h,70h+46h,0dh	
	DRow 0cfh,0e0h,70h+47h,0dh
	DRow 0cfh,0e0h,70h+48h,0dh
    DRow 0cfh,0e0h,70h+49h,0dh	
	DRow 0cfh,0e0h,70h+4ah,0dh
	DRow 0cfh,0e0h,70h+4bh,0dh
    DRow 0cfh,0e0h,70h+4ch,0dh	
	DRow 0cfh,0e0h,70h+4dh,0dh
	DRow 0cfh,0e0h,70h+4eh,0dh
    DRow 0cfh,0e0h,70h+4fh,0dh	
	DRow 0cfh,0e0h,70h+50h,0dh

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 10 building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
	Drow 0efh,0ffh,70h+35h,04h
	Drow 0efh,0ffh,70h+36h,04h
	Drow 0efh,0ffh,70h+37h,07h
	Drow 0efh,0ffh,70h+38h,07h
	Drow 0efh,0ffh,70h+39h,02h
	Drow 0efh,0ffh,70h+3ah,02h
	Drow 0efh,0ffh,70h+3bh,02h
	Drow 0efh,0ffh,70h+3ch,02h
	Drow 0efh,0ffh,70h+3dh,02h
	Drow 0efh,0ffh,70h+3eh,02h
	Drow 0efh,0ffh,70h+3fh,02h
	Drow 0efh,0ffh,70h+40h,02h
	Drow 0efh,0ffh,70h+41h,02h
	DRow 0efh,0ffh,70h+42h,02h
    DRow 0efh,0ffh,70h+43h,02h	
	DRow 0efh,0ffh,70h+44h,02h
	DRow 0efh,0ffh,70h+45h,02h
    DRow 0efh,0ffh,70h+46h,02h	
	DRow 0efh,0ffh,70h+47h,02h
	DRow 0efh,0ffh,70h+48h,02h
    DRow 0efh,0ffh,70h+49h,02h	
	DRow 0efh,0ffh,70h+4ah,02h
	DRow 0efh,0ffh,70h+4bh,02h
    DRow 0efh,0ffh,70h+4ch,02h	
	DRow 0efh,0ffh,70h+4dh,02h
	DRow 0efh,0ffh,70h+4eh,02h
    DRow 0efh,0ffh,70h+4fh,02h	
	DRow 0efh,0ffh,70h+50h,02h

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 11 building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
	DColumn 70h+0fh,70h+2fh,0feh,04h
	DRow 0ffh,110h,70h+0fh,04h
	DRow 0ffh,110h,70h+10h,0eh
    DRow 0ffh,110h,70h+11h,0eh
    DRow 0ffh,110h,70h+12h,0eh
    DRow 0ffh,110h,70h+13h,0eh
    DRow 0ffh,110h,70h+14h,0eh
    DRow 0ffh,110h,70h+15h,0eh
    DRow 0ffh,110h,70h+16h,0eh
    DRow 0ffh,110h,70h+17h,0eh
    DRow 0ffh,110h,70h+18h,0eh
    DRow 0ffh,110h,70h+19h,0eh
    DRow 0ffh,110h,70h+1ah,0eh
    DRow 0ffh,110h,70h+1bh,0eh
    DRow 0ffh,110h,70h+1ch,0eh
    DRow 0ffh,110h,70h+1dh,0eh
    DRow 0ffh,110h,70h+1eh,0eh
    DRow 0ffh,110h,70h+1fh,0eh
    DRow 0ffh,110h,70h+20h,0eh
    DRow 0ffh,110h,70h+21h,0eh
    DRow 0ffh,110h,70h+22h,0eh
    DRow 0ffh,110h,70h+23h,0eh
    DRow 0ffh,110h,70h+24h,0eh
    DRow 0ffh,110h,70h+25h,0eh
    DRow 0ffh,110h,70h+26h,0eh
    DRow 0ffh,110h,70h+27h,0eh
    DRow 0ffh,110h,70h+28h,0eh
    DRow 0ffh,110h,70h+29h,0eh
    DRow 0ffh,110h,70h+2ah,0eh
    DRow 0ffh,110h,70h+2bh,0eh
    DRow 0ffh,110h,70h+2ch,0eh
	DRow 0ffh,110h,70h+2dh,0eh
    DRow 0ffh,110h,70h+2eh,0eh
    DRow 0ffh,110h,70h+2fh,0eh
    DRow 0ffh,110h,70h+30h,0eh
    DRow 0ffh,110h,70h+31h,0eh
    DRow 0ffh,110h,70h+32h,0eh
    DRow 0ffh,110h,70h+33h,0eh
    DRow 0ffh,110h,70h+34h,0eh
    DRow 0ffh,110h,70h+35h,0eh
    DRow 0ffh,110h,70h+36h,0eh
    DRow 0ffh,110h,70h+37h,0eh
    DRow 0ffh,110h,70h+38h,0eh
    DRow 0ffh,110h,70h+39h,0eh
    DRow 0ffh,110h,70h+3ah,0eh
    DRow 0ffh,110h,70h+3bh,0eh
    DRow 0ffh,110h,70h+3ch,0eh
    DRow 0ffh,110h,70h+3dh,0eh
    DRow 0ffh,110h,70h+3eh,0eh
    DRow 0ffh,110h,70h+3fh,0eh
	DRow 0ffh,110h,70h+40h,0eh
    DRow 0ffh,110h,70h+41h,0eh
    DRow 0ffh,110h,70h+42h,0eh
    DRow 0ffh,110h,70h+43h,0eh
    DRow 0ffh,110h,70h+44h,0eh
    DRow 0ffh,110h,70h+45h,0eh
    DRow 0ffh,110h,70h+46h,0eh
    DRow 0ffh,110h,70h+47h,0eh
    DRow 0ffh,110h,70h+48h,0eh
    DRow 0ffh,110h,70h+49h,0eh
    DRow 0ffh,110h,70h+4ah,0eh
    DRow 0ffh,110h,70h+4bh,0eh
    DRow 0ffh,110h,70h+4ch,0eh
    DRow 0ffh,110h,70h+4dh,0eh
    DRow 0ffh,110h,70h+4eh,0eh
    DRow 0ffh,110h,70h+4fh,0eh
	DRow 0ffh,110h,70h+50h,0eh
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  for 12 building ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
	
	DRow 110h,135h,70h+1fh,04h
	DRow 110h,135h,70h+20h,09h
	DRow 110h,135h,70h+21h,09h
    DRow 110h,135h,70h+22h,09h
    DRow 110h,135h,70h+23h,09h
    DRow 110h,135h,70h+24h,09h
    DRow 110h,135h,70h+25h,09h  
	DRow 110h,135h,70h+26h,09h
	DRow 110h,135h,70h+27h,09h
    DRow 110h,135h,70h+28h,09h
    DRow 110h,135h,70h+29h,09h
    DRow 110h,135h,70h+2ah,09h
    DRow 110h,135h,70h+2bh,09h
	DRow 110h,135h,70h+2ch,09h
	DRow 110h,135h,70h+2dh,09h
    DRow 110h,135h,70h+2eh,09h
    DRow 110h,135h,70h+2fh,09h
    DRow 110h,135h,70h+30h,09h
    DRow 110h,135h,70h+31h,09h
	DRow 110h,135h,70h+32h,09h
	DRow 110h,135h,70h+33h,09h
    DRow 110h,135h,70h+34h,09h
    DRow 110h,135h,70h+35h,09h
    DRow 110h,135h,70h+36h,09h
    DRow 110h,135h,70h+37h,09h
	DRow 110h,135h,70h+38h,09h
	DRow 110h,135h,70h+39h,09h
    DRow 110h,135h,70h+3ah,09h
    DRow 110h,135h,70h+3bh,09h
    DRow 110h,135h,70h+3ch,09h
    DRow 110h,135h,70h+3dh,09h
	DRow 110h,135h,70h+3eh,09h
	DRow 110h,135h,70h+3fh,09h
	DRow 110h,135h,70h+40h,09h
    DRow 110h,135h,70h+41h,09h
    DRow 110h,135h,70h+42h,09h
    DRow 110h,135h,70h+43h,09h
    DRow 110h,135h,70h+44h,09h
	DRow 110h,135h,70h+45h,09h
	DRow 110h,135h,70h+46h,09h
    DRow 110h,135h,70h+47h,09h
    DRow 110h,135h,70h+48h,09h
    DRow 110h,135h,70h+49h,09h
    DRow 110h,135h,70h+4ah,09h    
	DRow 110h,135h,70h+4bh,09h
	DRow 110h,135h,70h+4ch,09h
	DRow 110h,135h,70h+4dh,09h
    DRow 110h,135h,70h+4eh,09h
    DRow 110h,135h,70h+4fh,09h
    DRow 110h,135h,70h+50h,09h
    ;DRow 110h,113f,70h+20h,09h
	drawsquare  119h,95h,00h   ;for 12
	drawsquare  128h,95h,00h
	drawsquare  105h,85h,00h   ;for 11
    ;drawsquare  128h,95h,09h
	drawsquare  0f5h,0a9h,00h   ;for 10
	drawsquare  0e5h,0afh,00h   ;for 9
	drawsquare  0d5h,0a1h,00h   ;for 8
	drawsquare  0bfh,0b5h,00h   ;for 7
	drawsquare  0adh,0a3h,00h   ;for 6
	 
    call Display_score
	;drawsbox 8dh,9bh,08h

		call Draw_Arrow
		call Draw_Ball
		rd:
		;call mov_Ball_up
		call MOVE_Ball
		mov ah,0
		int 16h
		JE RD
		cmp ah,50h
		je movedown
		cmp ah,39h
		je shoot
		cmp ah,48h
		je moveup
		jmp rd 
		;cmp al,'b'
		;je bmoveup
		
movedown:
		call mov_Arrow_down
		call can_arrow_mov
		
		jmp rd
shoot:
		call MOVE_Arrow
		call can_arrow_mov
		jmp rd
		
moveup:

		call mov_Arrow_up
		call can_arrow_mov
		jmp rd
		
bmoveup:
		call mov_Ball_up
		call can_arrow_mov
		jmp rd
		

pop cx
pop dx

ret 

gamepage endp


	

END MAIN