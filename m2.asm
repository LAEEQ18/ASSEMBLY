
;TITLE Genrate:Sound.


.model medium
.stack 100h
.data
.code
main proc
 
 call far ptr sound1

	main endp
    
s1 proc near

in al,43h
;initialize timer
mov al,0f9h             ;tone
out 43h,al
;load count
mov ax,5000h    ;move frequency
out 42h,al
mov al,ah
out 42h,al
;active speaker
in al,61h
mov ah,al
or al,03h
out 61h,al

;DELAY:  
push di
mov  di,5000
;0ffffh
 mov cx,8
 ;pass31: mov cx,50
 ;pass32: loop pass32
;JNZ pass31
pop di

mov al,ah
out 61h,al
pop si
       ret
s1 endp
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

MOV BX, 50
L3: MOV AH, 0
  INT 16H
  CMP AL, 'x'
  JE  EXIT
  CMP AL, 'q'
  JE  DO 
  CMP AL, 'w'
  JE  RE
  CMP AL, 'e'
  JE  MI
  CMP Ah, 50h  ;dw
  JE  FA
  CMP Ah,4bh
  JE  SOL
  CMP Ah,4dh
  JE  LA
  CMP Ah,48h ;up
  JE  CI
  CMP Al,20h ;dw infinite music
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
  MOV DI, 200
  CALL    SOUND
  MOV DI, 235 
  CALL    SOUND
  MOV DI, 250
  CALL    SOUND
  MOV DI, 275
  CALL    SOUND
  MOV DI, 300
  CALL    SOUND
  MOV DI, 355
  CALL    SOUND
  MOV DI, 400
  CALL    SOUND
  MOV DI, 420
  CALL    SOUND
  MOV DI, 450
  CALL    SOUND
  MOV DI, 500
  CALL    SOUND
  MOV DI, 550
  CALL    SOUND
  MOV DI, 600
  CALL    SOUND
  MOV DI, 650
  CALL    SOUND
  MOV DI, 700
  CALL    SOUND
  MOV DI, 750
  CALL    SOUND
  MOV DI, 800
  CALL    SOUND
  MOV DI, 900
  CALL    SOUND
  MOV DI, 950
  CALL    SOUND
  MOV DI, 900
  
  CALL    SOUND
  MOV DI, 1100
  CALL    SOUND
  MOV DI, 970
  CALL    SOUND
  MOV DI, 900
  CALL    SOUND
  CALL    SOUND
  MOV DI, 980
  CALL    SOUND
  MOV DI, 950
  CALL    SOUND
  MOV DI, 200
  ;CALL    SOUND
  CALL    SOUND
  mov ah,0
  int 16h
  cmp al , 'b' 
  Je  exit1
  jmp  L4
  
  exit1:
  MOV AH, 00H
  MOV AL, 03H
  INT 10H
  MOV AX, 4C00H
  INT 21H
  ret

sound1 endp

end main