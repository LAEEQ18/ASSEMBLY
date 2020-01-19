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

.model small
.STACK 100H


If1 
include mn.mac
endif


.DATA
pacx dw 30h			;it draw the pacman at x position
pacy dw 20h			;it draw the pacman at y position
paccolor db 01Eh	;it draw the color of the pacman
backcolor db 09h	;it is color in 16 color
e1 db ' ******** Thankyou ******** $'
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
	mov bl,10h ;color light cyan
	int 10h
	
	
	
	
	SETCURSOR 16,6	                        ;SETTING CURSOR FOR 1ST STRING BY MACRO
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
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; for G  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	DRow 29h,3fh,10h,03h
	DRow 29h,3fh,11h,03h
	DRow 29h,3fh,13h,03h        ;3d
	DColumn 12h,2eh,29h,03h
	DColumn 12h,2eh,2ah,03h
	DColumn 12h,2eh,27h,03h     ;3d
	;DColumn 12h,2eh,3fh,03h
	;DColumn 12h,2eh,40h,03h
	;DColumn 12h,2eh,42h,03h
	
	DRow 32h,3dh,1fh,03h        ;center line 
	DRow 32h,3dh,20h,03h
	DRow 32h,3dh,1eh,03h
	DRow 32h,3dh,22h,03h	;3d
	
	
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
	DRow 47h,61h,25h,03h      ;3d
	
	
	
	DColumn 14h,31h,47h,03h
	DColumn 14h,31h,48h,03h
	DColumn 14h,31h,49h,03h
	DColumn 14h,31h,4bh,03h
	
	
	DColumn 14h,31h,61h,03h
	DColumn 14h,31h,62h,03h
	DColumn 14h,31h,63h,03h
	DColumn 14h,31h,65h,03h
	DRow 47h,61h,11h,03h        ;upper line 
    DRow 47h,61h,12h,03h
	DRow 47h,61h,13h,03h
	DRow 47h,61h,14h,03h        
	DRow 47h,61h,17h,03h        ;3d
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   for M  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	DColumn 14h,31h,6fh,03h   ;m left column
	DColumn 14h,31h,70h,03h
	DColumn 14h,31h,71h,03h 
	DColumn 14h,31h,72h,03h 
	DColumn 17h,31h,75h,03h 
	
	
	
	
	DColumn 14h,31h,90h,03h    ;m right column
	DColumn 14h,31h,91h,03h
	DColumn 14h,31h,92h,03h 
	DColumn 14h,31h,93h,03h 
	DColumn 14h,31h,94h,03h 
    DColumn 14h,31h,97h,03h
	

    ;DRow 6fh,71h,15h,03h     ;m left upper curve
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
	
	
	DRow 7ch,7eh,1eh,03h        ;m right upper curve
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
 	DColumn 14h,31h,9fh+02h,03h     ;3d
	DRow 9dh,9fh+20h,14h,03h
	DRow 9dh,9fh+20h,15h,03h
	DRow 9dh,9fh+20h,16h,03h
	DRow  9dh,9fh+20h,18h,03h
	DRow 9dh,9fh+20h,22h,03h
	DRow 9dh,9fh+20h,23h,03h
	DRow 9dh,9fh+20h,24h,03h
	DRow 9dh,9fh+20h,26h,03h    ;3d	
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
	DColumn 40h,5eh,4dh,03h       ;3d
    DRow 47h,61h,40h,03h            ;upper row of o
	DRow 47h,61h,41h,03h
	DRow 47h,61h,42h,03h
	DRow 47h,61h,44h,03h          ;3d
	DColumn 40h,5eh,61h,03h            ;right column of 0
	DColumn 40h,5eh,62h,03h
	DColumn 40h,5eh,63h,03h
	DColumn 40h,5eh,65h,03h       ;3d  	
	DRow 47h,61h,5eh,03h               ;loxwer row of O
	DRow 47h,61h,5fh,03h
	DRow 47h,61h,60h,03h
	DRow 47h,61h,63h,03h          ;3d

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
 	DColumn 40h,5fh,9fh+02h,03h     ;3d
	DRow 9dh,9fh+20h,40h,03h
	DRow 9dh,9fh+20h,41h,03h
	DRow 9dh,9fh+20h,42h,03h
	DRow  9dh,9fh+20h,45h,03h      ;3d
	DRow 9dh,9fh+20h,4eh,03h
	DRow 9dh,9fh+20h,4fh,03h
	DRow 9dh,9fh+20h,50h,03h
	DRow 9dh,9fh+20h,53h,03h    ;3d	
	DRow 9dh,9fh+20h,5fh,03h 
	DRow 9dh,9fh+20h,60h,03h 
	DRow 9dh,9fh+20h,61h,03h 
	DRow 9dh,9fh+20h,62h,03h 
	DRow 9dh,9fh+20h,65h,03h      ;3d
	
	

	
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
	DColumn 40h,4eh,9dh+57h,03h        ;3d	
	DRow 9dh+3ch,9dh+53h,4ah,03h
	DRow 9dh+3ch,9dh+53h,4bh,03h
	DRow 9dh+3ch,9dh+53h,4ch,03h
 	DRow 9dh+3ch,9dh+53h,4eh,03h      ;3d

	
	;for curve line
	
	
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