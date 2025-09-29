INCLUDE Irvine32.inc
includelib winmm.lib

.data

PlaySoundA PROTO,
        pszSound:PTR BYTE,
        hmod:DWORD,
        fdwSound:DWORD

        goBOOM byte "boom.wav",0
        deviceConnect BYTE "DeviceConnect",0
        SND_ALIAS    DWORD 00010000h
        SND_RESOURCE DWORD 00040005h
        SND_FILENAME DWORD 00020000h


;;;;;;;;;; FILE HANDLING FOR RECORD OF NAME AND SCORE ETC


RecordFileHandle dd ?
filename byte "Scores.txt",0

Write1 byte "Name : ",0
Write2 byte "Score : ",0

username byte 256 dup(?)

newline byte 0Dh,0Ah,0




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GAME NAME AND DETAILS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




intro1 byte "###############################################################",0
intro2 byte "##                                                           ##",0
intro3 byte "##      PPPPP   AAAAA   CCCCC    M   M    AAAAA    N   N     ##",0
intro4 byte "##      P   P   A   A   C        MM MM    A   A    NN  N     ##",0
intro5 byte "##      PPPPP   AAAAA   C        M M M    AAAAA    N N N     ##",0
intro6 byte "##      P       A   A   C        M   M    A   A    N  NN     ##",0
intro7 byte "##      P       A   A   CCCCC    M   M    A   A    N   N     ##",0
intro8 byte "##                                                           ##",0
intro9 byte "###############################################################",0
intro10 byte "GAME LANGAUGE: ASSEMBLY",0
intro11 byte "DEVELOPED BY: https://github.com/noumanic",0
intro12 byte "ROLL NUMBER: 21I-0416",0
intro13 byte "SUBJECT: BS(CS)-COAL",0
intro14 byte "CONTRIBUTOR NAME: https://github.com/A-Chughtai",0
intro15 byte "###############################################################",0
intro16 byte "##                                                           ##",0
intro17 byte "##                                                           ##",0
intro18 byte "##                 COURSE SEMESTER FINAL PROJECT             ##",0
intro19 byte "##                                                           ##",0
intro20 byte "##                             PRESS (ENTER) FOR [MAIN MENU] ##",0
intro21 byte "###############################################################",0





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GAME MENU AND DETAILS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





menuscreen1 byte "###############################################################",0
menuscreen2 byte "##                                                           ##",0
menuscreen3 byte "##               M   M  EEEEE  N   N   U   U                 ##",0
menuscreen4 byte "##               MM MM  E      NN  N   U   U                 ##",0
menuscreen5 byte "##               M M M  EEEE   N N N   U   U                 ##",0
menuscreen6 byte "##               M   M  E      N  NN   U   U                 ##",0
menuscreen7 byte "##               M   M  EEEEE  N   N    UUU                  ##",0
menuscreen8 byte "##                                                           ##",0
menuscreen9 byte "###############################################################",0
menuscreen10 byte "GAME LANGAUGE: ASSEMBLY",0
menuscreen11 byte "DEVELOPED BY: https://github.com/noumanic",0
menuscreen12 byte "ROLL NUMBER: 21I-0416",0
menuscreen13 byte "SUBJECT: BS(CS)-COAL",0
menuscreen14 byte "CONTRIBUTOR NAME: https://github.com/A-Chughtai",0
menuscreen15 byte "###############################################################",0
menuscreen16 byte "##                                                           ##",0
menuscreen17 byte "##                                                           ##",0
menuscreen18 byte "##                 COURSE SEMESTER FINAL PROJECT             ##",0
menuscreen19 byte "##                                                           ##",0
menuscreen20 byte "##                               PRESS (ENTER) FOR [OPTIONS] ##",0
menuscreen21 byte "###############################################################",0




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; OPTIONS WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




option1 db "###############################################################",0
option2 db "##                                                           ##",0
option3 db "##         OOO   PPPP   TTTTT  III    OOO    N   N   SSSS    ##",0
option4 db "##        O   O  P   P    T     I    O   O   NN  N   S       ##",0
option5 db "##        O   O  PPPP     T     I    O   O   N N N    SSS    ##",0
option6 db "##        O   O  P        T     I    O   O   N  NN       S   ##",0
option7 db "##         OOO   P        T    III    OOO    N   N    SSSS   ##",0
option8 db "##                                                           ##",0
option9 db "###############################################################",0
option10 db "##                                                           ##",0
option11 db "##           TO START THE GAME---> PRESS  (1) TO PLAY        ##",0
option12 db "##    TO READ THE RULES/INSTRUCTIONS---> PRESS (2) TO READ   ##",0
option13 db "##                                                           ##",0
option14 db "###############################################################",0








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GAME RULES & INSTRUCTIONS WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




rule1  byte "#########################################################################",0
rule2  byte "##                                                                     ##",0
rule3  byte "##              RRRR    U   U   L       EEEEE    SSSS                  ##",0
rule4  byte "##              R   R   U   U   L       E       S                      ##",0
rule5  byte "##              RRRR    U   U   L       EEEE     SSS                   ##",0
rule6  byte "##              R  R    U   U   L       E           S                  ##",0
rule7  byte "##              R   R    UUU    LLLLL   EEEEE   SSSS                   ##",0
rule8  byte "##                                          PRESS (ENTER) FOR [RECORD] ##",0
rule9  byte "#########################################################################",0
rule10 byte "##   (1) YOU HAVE TO ENTER YOUR NAME FOR RECORD                  :-)   ##",0
rule11 byte "##   (2) HIT THE BALLS TO GET SCORE                              :-)   ##",0
rule12 byte "##   (3) BEING FOCUSED WILL GET MORE REWARD(SCORE)               :-)   ##",0
rule13 byte "##   (4) TOTAL LIVES ARE 3                                       :-(   ##",0
rule14 byte "##   (5) TOTAL GAME LEVELS ARE ALSO 3                            :-(   ##",0
rule15 byte "##   (6) FROM LEVEL, GAME STARTS FROM SAFE ZONE                  :-)   ##",0
rule16 byte "##   (7) AVOID THE LATENCY TO SAFE YOUR LIVES AND ENJOY MORE     :-(   ##",0
rule17 byte "##   (8) LEVEL 3 HAS A SURPRISE FOR YOU                          :):   ##",0
rule18 byte "##   (9) ON LOOSING YOUR LIVE DECREASES                          :-(   ##",0
rule19 byte "##   (10)FILE HANDLING OF YOUR PERFORMANCE IS USED FOR RECORD    :):   ##",0
rule20 byte "##   (11)ON PLAYING & ENDING GAME, THANKYOU FOR YOU IN LAST!     :-)   ##",0
rule21 byte "#########################################################################",0





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; HELLO JEE WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




helloJee1 db "#########################################################################",0
helloJee2 db "##                                                                     ##",0
helloJee3 db "##        H   H  EEEEE  L      L      OOO     JJJJJ  EEEEE  EEEEE      ##",0
helloJee4 db "##        H   H  E      L      L     O   O      J    E      E          ##",0
helloJee5 db "##        HHHHH  EEEE   L      L     O   O      J    EEEE   EEEE       ##",0
helloJee6 db "##        H   H  E      L      L     O   O   J  J    E      E          ##",0
helloJee7 db "##        H   H  EEEEE  LLLLL  LLLLL  OOO    JJJ     EEEEE  EEEEE      ##",0
helloJee8 db "##                                                                     ##",0
helloJee9 db "#########################################################################",0
helloJee10 db "##                                                                     ##",0
helloJee11 db "##                                                                     ##",0
helloJee12 db "##                                                                     ##",0
helloJee13 db "              ENTER YOUR NAME FOR OUR RECORD:",0
helloJee14 db "##                                                                     ##",0
helloJee15 db "##                                                                     ##",0
helloJee16 db "##                                       PRESS (ENTER) TO [START GAME] ##",0
helloJee17 db "#########################################################################",0




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GAME OVER AND DETAILS WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





oops1  byte "#########################################################################",0
oops2  byte "##                                                                     ##",0
oops3  byte "##      GGGGG  AAAAA   M   M    EEEEE    OOO    V   V  EEEEE  RRRR     ##",0
oops4  byte "##      G      A   A   MM MM    E       O   O   V   V  E      R   RR   ##",0
oops5  byte "##      G  GG  AAAAA   M M M    EEEE    O   O   V   V  EEEE   RRRRR    ##",0
oops6  byte "##      G   G  A   A   M   M    E       O   O   V   V  E      R  R     ##",0
oops7  byte "##      GGGGG  A   A   M   M    EEEEE    OOO     VVV   EEEEE  R   RR   ##",0
oops8  byte "##                                                                     ##",0
oops9  byte "#########################################################################",0
oops10 byte "*****          GAME LANGAUGE: ASSEMBLY                       *****",0
oops11 byte "*****          DEVELOPED BY: https://github.com/noumanic     *****",0
oops12 byte "*****          ROLL NUMBER: 21I-0416                         *****",0
oops13 byte "*****          SUBJECT: BS(CS)-COAL                          *****",0
oops14 byte "*****          INSTRUCTOR NAME: ---------                    *****",0
oops15 byte "#########################################################################",0
oops16 byte "##                                                                     ##",0
oops17 byte "##                                                                     ##",0
oops18 byte "##                      COURSE SEMESTER FINAL PROJECT                  ##",0
oops19 byte "##                                                                     ##",0
oops20 byte "##                                     PRESS (ENTER) TO GET [THANKYOU] ##",0
oops21 byte "#########################################################################",0





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; THANKYOU WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




thankYou1  byte "###############################################################",0
thankYou2  byte "##                                                           ##",0
thankYou3  byte "##          TTTTT  HH  HH   AAAAA  N   N   K   K             ##",0
thankYou4  byte "##            T    HH  HH   A   A  NN  N   K  K              ##",0
thankYou5  byte "##            T    HHHHHH   AAAAA  N N N   KKK               ##",0
thankYou6  byte "##            T    HH  HH   A   A  N  NN   K  K              ##",0
thankYou7  byte "##            T    HH  HH   A   A  N   N   K   K             ##",0
thankYou8  byte "##                                                           ##",0
thankYou9  byte "###############################################################",0
thankYou10 byte "##                   Y   Y   OOO    U   U                    ##",0
thankYou11 byte "##                    Y Y   O   O   U   U                    ##",0
thankYou12 byte "##       (-:           Y    O   O   U   U          :-)       ##",0
thankYou13 byte "##                     Y    O   O   U   U                    ##",0
thankYou14 byte "##                     Y     OOO     UUU                     ##",0
thankYou15 byte "###############################################################",0









colission byte 0

SuperFood STRUCT
    xK byte ?
    yK byte ?
    value byte 7
SuperFood ENDS

DOT STRUCT
    xDot byte ?
    yDot byte ?
    value byte 1
DOT ENDS

Ghost STRUCT
    xG byte ?
    yG byte ?
    value byte 1
Ghost ENDS

strResult db 16 dup (0)

ground BYTE "########################################################################################################################",0
ground1 BYTE "#",0ah,0
ground2 BYTE "#",0
h1 byte "##########",0
h2 byte "##############################",0

dotLine byte "&*&*&*&*&*&*&*&",0

x_save byte ?
y_save byte ?

iteration byte 1
count word 0
lives byte 3
level byte 1
gamespeed byte 100



strScore BYTE "SCORE : ",0
strLives BYTE "LIVES : ",0
strPause BYTE "PAUSE",0
strLevel BYTE "LEVEL : ",0

score word 1

xPos BYTE 1
yPos BYTE 3

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?


;;;;;;;;;; FOOOD

R1S DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R1E DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R2S DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R2M DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R2E DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R3S DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R3M DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R3E DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R4S DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R4E DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R5M DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R5E DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R5S DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>
R5X DOT <>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>,<>


;;;;;;;;;; ENEMIES
G1 Ghost <>
G2 Ghost <>
G3 Ghost <>
G4 Ghost <>
G5 Ghost <>
G6 Ghost <>
G7 Ghost <>
G8 Ghost <>
G9 Ghost <>
G10 Ghost <>


;;;;;;; SUPER FOOD

T1 SuperFood <>
T2 SuperFood <>

checkportal byte 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END OF DATA SECTION  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  CODE SECTION  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


.code
main PROC

    INVOKE PlaySoundA, OFFSET goBOOM, NULL, 20001H      ; SND_ASYNC | SND_FILENAME

    call INTRODUCTION

    call Walls

    ;;              <----GAME---->



    call DrawPlayer

    ;;call CreateRandomCoin
    ;;call DrawCoin

    ;;call Randomize

    gameLoop:

    .if count == 164
    mov count, 0
    call OpenPortal
    mov checkportal,1
    .endif

    .if checkportal
    .if xPos == 118
    .if yPos == 28
    .if Level == 3
    jmp exitgame
    .else
    inc level
    mov checkportal,0
    call Reset
    jmp gameloop
    .endif
    .endif
    .endif
    .endif

    .if level == 3
    call useTP
    .endif

    mov esi,offset G1
    call GhostMove
    mov esi,offset G2
    call GhostMove
    mov esi,offset G3
    call GhostMove
    mov esi,offset G4
    call GhostMove
    mov esi,offset G5
    call GhostMove
    mov esi,offset G6
    call GhostMove
    mov esi,offset G7
    call GhostMove
    mov esi,offset G8
    call GhostMove
    mov esi,offset G9
    call GhostMove
    mov esi,offset G10
    call GhostMove


    call checkGhost

    .if colission == 1
    dec lives
    mov colission,0
    mov xPos,1
    mov yPos,3
    call UpdatePlayer
    call DrawPlayer
    .endif

    .if lives == 0
    jmp exitGame
    .endif



    .if iteration == 30
    mov iteration,1
    .else
    inc iteration
    .endif

    ;;--------------------------------------------------------------

    call EatTofi

    ;;--------------------------------------------------------------

    .if yPos == 3
    mov esi,offset R1S
    Call EatDots
    mov esi,offset R1E
    Call EatDots
    .endif

    .if yPos == 5
    mov esi,offset R5S
    Call EatDots
    mov esi,offset R5X
    Call EatDots
    .endif




    .if yPos == 15
    mov esi,offset R2S
    Call EatDots
    mov esi,offset R2M
    Call EatDots
    mov esi,offset R2E
    Call EatDots
    .endif

    .if yPos == 17
    mov esi,offset R3S
    Call EatDots
    mov esi,offset R3M
    Call EatDots
    mov esi,offset R3E
    Call EatDots
    .endif



    .if yPos == 26
    mov esi,offset R5M
    Call EatDots
    mov esi,offset R5E
    Call EatDots
    .endif


    .if yPos == 28
    mov esi,offset R4S
    Call EatDots
    mov esi,offset R4E
    Call EatDots
    .endif

    ;;--------------------------------------------------------------




    mov eax,white (black * 16)
    call SetTextColor

    ; draw score:
    mov dl,0
    mov dh,0
    call Gotoxy
    mov edx,OFFSET strScore
    call WriteString
    mov ax,score
    call writeDEC

    ; draw lives:
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET strLives
    call WriteString
    mov eax,0
    mov al,lives
    call writeDEC

    ;;draw LEVEL

    mov dl,100
    mov dh,0
    call Gotoxy
    mov edx,offset strLevel
    call WriteString
    mov eax,0
    mov al,level
    call writeint

    ; get user key input:
    mov eax,0
    mov al,gamespeed
    Call Delay
    call ReadKey
    jz skipinput
    mov inputChar,al

    skipinput:

    mov bl,xPos
    mov bh,yPos

    ; exit game if user types 'x':
    cmp inputChar,"x"
    je exitGame

    cmp inputChar,"w"
    je moveUp

    cmp inputChar,"s"
    je moveDown

    cmp inputChar,"a"
    je moveLeft

    cmp inputChar,"d"
    je moveRight

    cmp inputChar,27
    je PAU

    jmp gameloop
;;;;;;;;;;;;;UP MOVEMENT
    moveUp:

    .if bh == 10
    .if bl <= 10
    jmp gameloop
    .endif
    .if bl >= 109
    jmp gameloop
    .endif

    .if bl == 20
    jmp gameloop
    .endif
    .if bl == 60
    jmp gameloop
    .endif
    .if bl == 100
    jmp gameloop
    .endif
    .endif


    .if bh == 17
    .if bl <= 30
    jmp gameloop
    .endif
    .if bl >= 45
    .if bl <= 54
    jmp gameloop
    .endif
    .endif
    .if bl >= 66
    .if bl <= 75
    jmp gameloop
    .endif
    .endif



    .if bl >= 89
    jmp gameloop
    .endif
    .endif

    .if bh == 23
    .if bl <= 10
    jmp gameloop
    .endif
    .if bl >= 109
    jmp gameloop
    .endif
    .endif

    .if bh == 20
    .if bl == 40
    jmp gameloop
    .endif
    .if bl == 80
    jmp gameloop
    .endif
    .endif



    cmp yPos,3
    jz gameloop
    call UpdatePlayer
    dec yPos
    call DrawPlayer
    jmp gameLoop

;;;;;;;;;;;;;DOWN MOVEMENT
    moveDown:

    .if bh == 8
    .if bl <= 10
    jmp gameloop
    .endif
    .if bl >= 109
    jmp gameloop
    .endif
    .endif

    .if bh == 15
    .if bl <=30
    jmp gameloop
    .endif
    .if bl >= 89
    jmp gameloop
    .endif
    .if bl >= 45
    .if bl <= 54
    jmp gameloop
    .endif
    .endif
    .if bl >= 66
    .if bl <= 75
    jmp gameloop
    .endif
    .endif
    .endif

    .if bh == 11
    .if bl == 40
    jmp gameloop
    .endif
    .if bl == 80
    jmp gameloop
    .endif
    .endif

    .if bh == 21
    .if bl <= 10
    jmp gameloop
    .endif
    .if bl == 20
    jmp gameloop
    .endif
    .if bl == 60
    jmp gameloop
    .endif
    .if bl == 100
    jmp gameloop
    .endif
    .if bl >= 109
    jmp gameloop
    .endif
    .endif

    cmp yPos,28
    jz gameloop
    call UpdatePlayer
    inc yPos
    call DrawPlayer
    jmp gameLoop
    
;;;;;;;;;;LEFT MOVEMENT
    moveLeft:

    .if bl == 21
    .if bh <= 9
    jmp gameloop
    .endif
    .if bh >= 22
    jmp gameloop
    .endif
    .endif

    .if bl == 61
    .if bh <= 9
    jmp gameloop
    .endif
    .if bh >= 22
    jmp gameloop
    .endif
    .endif

    .if bl == 101
    .if bh <= 9
    jmp gameloop
    .endif
    .if bh >= 22
    jmp gameloop
    .endif
    .endif

    .if bh == 16
    .if bl == 31
    jmp gameloop
    .endif
    .if bl == 55
    jmp gameloop
    .endif
    .if bl == 76
    jmp gameloop
    .endif
    .endif

    .if bl == 41
    .if bh >= 12
    .if bh <= 19
    jmp gameloop
    .endif
    .endif
    .endif

    .if bl == 81
    .if bh >= 12
    .if bh <= 19
    jmp gameloop
    .endif
    .endif
    .endif

    .if bl == 11
    .if bh == 9
    jmp gameloop
    .endif
    .if bh == 22
    jmp gameloop
    .endif
    .endif

    cmp xPos,1
    jz gameLoop
    call UpdatePlayer
    dec xPos
    call DrawPlayer
    jmp gameLoop

;;;;;;;;;;;RIGHT MOVEMENT
    moveRight:

    .if bl == 19
    .if bh <= 9
    jmp gameloop
    .endif
    .if bh >= 22
    jmp gameloop
    .endif
    .endif

    .if bl == 59
    .if bh <= 9
    jmp gameloop
    .endif
    .if bh >= 22
    jmp gameloop
    .endif
    .endif

    .if bl == 99
    .if bh <= 9
    jmp gameloop
    .endif
    .if bh >= 22
    jmp gameloop
    .endif
    .endif

    .if bh == 16
    .if bl == 44
    jmp gameloop
    .endif
    .if bl == 65
    jmp gameloop
    .endif
    .if bl == 88
    jmp gameloop
    .endif
    .endif

    .if bl == 39
    .if bh >= 12
    .if bh <= 19
    jmp gameloop
    .endif
    .endif
    .endif

    .if bl == 79
    .if bh >= 12
    .if bh <= 19
    jmp gameloop
    .endif
    .endif
    .endif

    .if bl == 108
    .if bh == 9
    jmp gameloop
    .endif
    .if bh == 22
    jmp gameloop
    .endif
    .endif

    cmp xPos,118
    jz gameLoop
    call UpdatePlayer
    inc xPos
    call DrawPlayer
    jmp gameLoop

    PAU:

    call pausee

    jmp gameloop

    ;;--------------------------------------------------------------

    call checkGhost

    jmp gameLoop

    exitGame:

    CALL GAMEOVER

    exit
    main ENDP

    DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"x"
    call WriteChar
    ret
    DrawPlayer ENDP

    UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
    UpdatePlayer ENDP

    DrawCoin PROC
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"."
    call WriteChar
    ret
    DrawCoin ENDP

    CreateRandomCoin PROC
    mov eax,55
    inc eax
    call RandomRange
    mov xCoinPos,al
    mov yCoinPos,27
    ret
    CreateRandomCoin ENDP

    SetDots1 PROC



    mov esi, offset R1S
    mov x_save,33
    mov y_save,3
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R1E
    mov x_save,73
    mov y_save,3
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R2S
    mov x_save,1
    mov y_save,15
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R2M
    mov x_save,53
    mov y_save,15
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R2E
    mov x_save,104
    mov y_save,15
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R3S
    mov x_save,1
    mov y_save,17
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R3M
    mov x_save,53
    mov y_save,17
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R3E
    mov x_save,104
    mov y_save,17
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    mov esi, offset R4S
    mov x_save,33
    mov y_save,28
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2

    ;    mov esi, offset R4E
    mov x_save,73
    mov y_save,28
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2



    Call SetDots2

    mov esi, offset R5E
    mov x_save,73
    mov y_save,26
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2






    Call SetDots2

    mov esi, offset R5X
    mov x_save,73
    mov y_save,5
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2




    Call SetDots2

    mov esi, offset R5M
    mov x_save,33
    mov y_save,26
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2




    Call SetDots2

    mov esi, offset R5S
    mov x_save,33
    mov y_save,5
    mov dl,x_save
    mov dh,y_save
    call Gotoxy
    mov edx,OFFSET dotLine
    call WriteString

    Call SetDots2






    mov ecx,150

    mov esi,offset R1S
    add esi,2
    mov al,1
    givevalue:

    mov [esi],al
    add esi,3

    loop givevalue

    ret

    SetDots1 ENDP

    SetDots2 PROC

    mov ecx,15

    setinfo:

    mov al,x_save
    mov [esi],al
    inc esi

    mov al,y_save
    mov [esi],al
    inc esi

    inc esi

    inc x_save

    loop setinfo

    ret
    SetDots2 ENDP

    EatDots PROC

    mov ecx,15

    eat:
    mov al,[esi]
    .if al == xPos
    add esi,2
    mov al,[esi]
    .if al == 1
    mov al,0
    mov [esi],al
    inc score
    inc count
    jmp nigga
    .endif
    jmp nigga
    .endif
    add esi,3
    loop eat

    nigga:

    ret

    EatDots ENDP

    SetTofi PROC
    mov eax,green
    call SetTextColor
    mov al,'F'

    mov T1.xK,1
    mov T1.yK,28
    mov T1.value,7

    mov dl, T1.xK
    mov dh, T1.yK

    call Gotoxy
    call WriteChar



    mov T2.xK,118
    mov T2.yK,3
    mov T2.value,7

    mov dl, T2.xK
    mov dh, T2.yK

    call Gotoxy
    call WriteChar

    ret

    SetTofi ENDP



    EatTofi PROC

    mov ah,yPos
    mov al,xPos

    .if ah == T1.yK
    .if al == T1.xK
    .if T1.value == 7
    mov T1.value, 0
    add score,7
    add count,7
    .endif
    .endif
    .endif

    .if ah == T2.yK
    .if al == T2.xK
    .if T2.value == 7
    mov T2.value, 0
    add score,7
    add count,7
    .endif
    .endif
    .endif

    ret

    EatTofi ENDP



    SetGhost PROC

    mov eax,red
    call SetTextColor

    ;;--------------E1--------------

    mov dl,4
    mov dh,8
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G1.xG,dl
    mov G1.yG,dh


    ;;--------------E2--------------

    mov dl,4
    mov dh,23
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G2.xG,dl
    mov G2.yG,dh


    ;;--------------E3--------------

    mov dl,53
    mov dh,14
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G3.xG,dl
    mov G3.yG,dh


    ;;--------------E4--------------

    mov dl,53
    mov dh,18
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G4.xG,dl
    mov G4.yG,dh


    ;;--------------E5--------------

    mov dl,33
    mov dh,4
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G5.xG,dl
    mov G5.yG,dh


    ;;--------------E6--------------

    mov dl,73
    mov dh,4
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G6.xG,dl
    mov G6.yG,dh


    ;;--------------E7--------------

    mov dl,33
    mov dh,27
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G7.xG,dl
    mov G7.yG,dh


    ;;--------------E8--------------

    mov dl,73
    mov dh,27
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G8.xG,dl
    mov G8.yG,dh


    ;;--------------E9--------------

    mov dl,103
    mov dh,8
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G9.xG,dl
    mov G9.yG,dh


    ;;--------------G10--------------

    mov dl,103
    mov dh,23
    call Gotoxy
    mov al,"E"
    call WriteChar
    mov G10.xG,dl
    mov G10.yG,dh

    ret

    SetGhost ENDP

    GhostMove Proc

    .if iteration <= 15

    mov dh,[esi + 1]
    mov dl,[esi]
    mov al," "
    Call Gotoxy
    call WriteChar

    inc dl
    mov [esi],dl

    mov eax,red
    call SetTextColor


    call Gotoxy
    mov al,"E"
    call WriteChar

    .else

    mov dh,[esi + 1]
    mov dl,[esi]
    mov al," "
    Call Gotoxy
    call WriteChar

    dec dl
    mov [esi],dl

    mov eax,red
    call SetTextColor


    call Gotoxy
    mov al,"E"
    call WriteChar

    .endif

    ret

    GhostMove ENDP

    checkGhost PROC

    mov al,xPos
    mov ah,yPos

    .if G1.xG == al
    .if G1.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G2.xG == al
    .if G2.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G3.xG == al
    .if G3.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G4.xG == al
    .if G4.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G5.xG == al
    .if G5.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G6.xG == al
    .if G6.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G7.xG == al
    .if G7.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G8.xG == al
    .if G8.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G9.xG == al
    .if G9.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif


    .if G10.xG == al
    .if G10.yG == ah
    mov colission, 1
    jmp doomed
    .endif
    .endif

    doomed:

    ret

    checkGhost ENDP

    OpenPortal PROC

    mov eax,brown
    mov al,"P"

    mov dh,28
    mov dl,119
    call Gotoxy
    call Writechar

    ret

    OpenPortal ENDP

    Reset Proc

    call Clrscr
    mov InputChar, " "
    mov xPos,1
    mov yPos,3
    call UpdatePlayer
    Call DrawPlayer
    call walls
    call setGhost
    call setDots1
    call SetTofi
    mov iteration,1
    .if level == 2
    mov gamespeed, 75
    .endif
    .if level == 3
    call set_teleport
    mov gamespeed, 50
    .endif

    ret

    Reset ENDP

    pausee PROC

    mov dh,0
    mov dl,50
    call gotoxy
    mov edx, offset strPause
    call WriteString
    call READCHAR
    mov al," "

    mov dh,0
    mov dl,50
    call gotoxy
    call writechar


    mov dh,0
    mov dl,51
    call gotoxy
    call writechar

    mov dh,0
    mov dl,52
    call gotoxy
    call writechar


    mov dh,0
    mov dl,53
    call gotoxy
    call writechar


    mov dh,0
    mov dl,54
    call gotoxy
    call writechar

    ret

    pausee ENDP

    set_teleport PROC

    mov dl,0
    mov dh,27
    mov al,"<"
    call gotoxy
    call writechar

    mov dl,119
    mov dh,4
    mov al,"<"
    call gotoxy
    call writechar


    mov dl,0
    mov dh,5
    mov al,"<"
    call gotoxy
    call writechar

    mov dl,119
    mov dh,25
    mov al,"<"
    call gotoxy
    call writechar


    ret
    set_teleport ENDP

    useTP PROC

    .if yPos == 27
    .if xPos == 1
    call UpdatePlayer
    mov xPos,118
    mov yPos,4
    call DrawPlayer
    .endif
    .endif

    .if yPos == 5
    .if xPos == 1
    call UpdatePlayer
    mov xPos,118
    mov yPos,25
    call DrawPlayer
    .endif
    .endif

    ret
    useTP ENDP


    ;;----------------------------------------------------------------------------------------------------------------------
    ;;----------------------------------------------------------------------------------------------------------------------
    ;;----------------------------------------------------------------------------------------------------------------------
    ;;----------------------------------------------------------------------------------------------------------------------
    ;;----------------------------------------------------------------------------------------------------------------------
    ;;----------------------------------------------------------------------------------------------------------------------
    ;;----------------------------------------------------------------------------------------------------------------------

    WALLS PROC


    ;;              <--------BOUNDARY-------->


        call SetDots1
        call SetGhost
        call SetTofi

        ; draw ground at (0,29):
        mov eax,blue ;(black * 16)
        call SetTextColor

        mov dl,0
        mov dh,29
        call Gotoxy
        mov edx,OFFSET ground
        call WriteString

        mov dl,0
        mov dh,2
        call Gotoxy
        mov edx,OFFSET ground
        call WriteString

        mov x_save,0
        mov y_save,2
        mov ecx,27
        left_verticalB:
        mov dl,x_save
        mov dh,y_save
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc y_save
        loop left_verticalB

        mov x_save,119
        mov y_save,2
        mov ecx,27
        right_verticalB:
        mov dl,x_save
        mov dh,y_save
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc y_save
        loop right_verticalB

        ;;              <-------V_WALLS------->

            ;;-----------------------------------------------------------

            mov x_save,20
            mov y_save,3
            mov ecx,7
            vertical1U:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical1U

            mov x_save,20
            mov y_save,22
            mov ecx,7
            vertical1D:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical1D

            ;;-----------------------------------------------------------

            mov x_save,40
            mov y_save,12
            mov ecx,8
            vertical2C:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical2C

            ;;-----------------------------------------------------------

            mov x_save,60
            mov y_save,3
            mov ecx,7
            vertical3U:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical3U

            mov x_save,60
            mov y_save,22
            mov ecx,7
            vertical3D:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical3D

            ;;-----------------------------------------------------------

            mov x_save,80
            mov y_save,12
            mov ecx,8
            vertical4C:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical4C

            ;;-----------------------------------------------------------

            mov x_save,100
            mov y_save,3
            mov ecx,7
            vertical5U:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical5U

            mov x_save,100
            mov y_save,22
            mov ecx,7
            vertical5D:
            mov dl,x_save
            mov dh,y_save
            call Gotoxy
            mov edx,OFFSET ground2
            call WriteString
            inc y_save
            loop vertical5D

            ;;              <-------H_WALLS------->

                ;;-----------------------------------------------------------

                mov dl,1
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString



                mov dl,16
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                mov dl,36
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString



                mov dl,56
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                mov dl,76
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                mov dl,90
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString



                mov dl,16
                mov dh,21
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString


                mov dl,36
                mov dh,21
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString


                mov dl,56
                mov dh,21
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString


                mov dl,76
                mov dh,21
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                mov dl,96
                mov dh,21
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString



                ;;-----------------------------------------------------------

                mov dl,1
                mov dh,16
                call Gotoxy
                mov edx,OFFSET h2
                call WriteString

                ;;-----------------------------------------------------------

                mov dl,1
                mov dh,22
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                ;;-----------------------------------------------------------

                mov dl,45
                mov dh,16
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                ;;-----------------------------------------------------------

                mov dl,66
                mov dh,16
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                ;;-----------------------------------------------------------

                mov dl,109
                mov dh,9
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                ;;-----------------------------------------------------------

                mov dl,89
                mov dh,16
                call Gotoxy
                mov edx,OFFSET h2
                call WriteString

                ;;-----------------------------------------------------------

                mov dl,109
                mov dh,22
                call Gotoxy
                mov edx,OFFSET h1
                call WriteString

                ;;-----------------------------------------------------------

                ret
                WALLS ENDP


                GAMEOVER PROC

                mov eax,red
                call settextcolor

                call clrScr

                mov dl,10
                mov dx,10
                call Gotoxy
                mov edx, offset Write1
                call writeString
                mov edx, offset username
                call writeString

                mov dl,12
                mov dx,12
                call Gotoxy
                mov edx, offset Write2
                call writeString
                mov eax,0
                mov ax,score
                call writeDEC

                call READCHAR

                call clrScr



                ; GAME OVER (OOPS)

                mov dl,25
                mov dh,2
                call gotoxy
                mov edx,offset oops1
                call writestring

                mov dl,25
                mov dh,3
                call gotoxy
                mov edx,offset oops2
                call writestring

                mov dl,25
                mov dh,4
                call gotoxy
                mov edx,offset oops3
                call writestring

                mov dl,25
                mov dh,5
                call gotoxy
                mov edx,offset oops4
                call writestring

                mov dl,25
                mov dh,6
                call gotoxy
                mov edx,offset oops5
                call writestring

                mov dl,25
                mov dh,7
                call gotoxy
                mov edx,offset oops6
                call writestring


                mov dl,25
                mov dh,8
                call gotoxy
                mov edx,offset oops7
                call writestring


                mov dl,25
                mov dh,9
                call gotoxy
                mov edx,offset oops8
                call writestring


                mov dl,25
                mov dh,10
                call gotoxy
                mov edx,offset oops9
                call writestring


                mov dl,38
                mov dh,11
                call gotoxy
                mov edx,offset oops10
                call writestring


                mov dl,38
                mov dh,12
                call gotoxy
                mov edx,offset oops11
                call writestring



                mov dl,38
                mov dh,13
                call gotoxy
                mov edx,offset oops12
                call writestring



                mov dl,38
                mov dh,14
                call gotoxy
                mov edx,offset oops13
                call writestring



                mov dl,38
                mov dh,15
                call gotoxy
                mov edx,offset oops14
                call writestring



                mov dl,25
                mov dh,16
                call gotoxy
                mov edx,offset oops15
                call writestring

                mov dl,25
                mov dh,17
                call gotoxy
                mov edx,offset oops16
                call writestring



                mov dl,25
                mov dh,18
                call gotoxy
                mov edx,offset oops17
                call writestring



                mov dl,25
                mov dh,19
                call gotoxy
                mov edx,offset oops18
                call writestring


                mov dl,25
                mov dh,20
                call gotoxy
                mov edx,offset oops19
                call writestring



                mov dl,25
                mov dh,21
                call gotoxy
                mov edx,offset oops20
                call writestring


                mov dl,25
                mov dh,22
                call gotoxy
                mov edx,offset oops21
                call writestring





                call readchar

                call clrScr

                call THANKS




                call ALL_RECORD_MANAGE

                call clrScr

                ret

                GAMEOVER ENDP

                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INTRODUTION PROCEDURE IMPLEMENTATION  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; START OF THE PROCEDURE  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                INTRODUCTION PROC
                ; CLEARING SCREEN

                call clrScr

                ; SETTING THE COLOR OF THE TEXT AND BACKGROUND

                mov  eax,red+(cyan*16)
                call SetTextColor


                mov dl,30
                mov dh,2
                call gotoxy
                mov edx,offset intro1
                call writestring

                mov dl,30
                mov dh,3
                call gotoxy
                mov edx,offset intro2
                call writestring

                mov dl,30
                mov dh,4
                call gotoxy
                mov edx,offset intro3
                call writestring

                mov dl,30
                mov dh,5
                call gotoxy
                mov edx,offset intro4
                call writestring

                mov dl,30
                mov dh,6
                call gotoxy
                mov edx,offset intro5
                call writestring

                mov dl,30
                mov dh,7
                call gotoxy
                mov edx,offset intro6
                call writestring


                mov dl,30
                mov dh,8
                call gotoxy
                mov edx,offset intro7
                call writestring


                mov dl,30
                mov dh,9
                call gotoxy
                mov edx,offset intro8
                call writestring

                mov dl,30
                mov dh,10
                call gotoxy
                mov edx,offset intro9
                call writestring


                mov eax,green
                call settextcolor


                mov dl,40
                mov dh,11
                call gotoxy
                mov edx,offset intro10
                call writestring

                mov dl,40
                mov dh,12
                call gotoxy
                mov edx,offset intro11
                call writestring

                mov dl,40
                mov dh,13
                call gotoxy
                mov edx,offset intro12
                call writestring

                mov dl,40
                mov dh,16
                call gotoxy
                mov edx,offset intro13
                call writestring


                mov dl,40
                mov dh,14
                call gotoxy
                mov edx,offset intro14
                call writestring


                mov eax,red
                call settextcolor

                mov dl,30
                mov dh,15
                call gotoxy
                mov edx,offset intro15
                call writestring


                mov dl,30
                mov dh,16
                call gotoxy
                mov edx,offset intro16
                call writestring


                mov dl,30
                mov dh,17
                call gotoxy
                mov edx,offset intro17
                call writestring



                mov dl,30
                mov dh,18
                call gotoxy
                mov edx,offset intro18
                call writestring


                mov dl,30
                mov dh,19
                call gotoxy
                mov edx,offset intro19
                call writestring


                mov dl,30
                mov dh,20
                call gotoxy
                mov edx,offset intro20
                call writestring

                mov dl,30
                mov dh,21
                call gotoxy
                mov edx,offset intro21
                call writestring
                call readchar


                call clrScr

                call MAINMENU

                call USER_NAME_RECORD

                ret

                INTRODUCTION ENDP


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END OF INTRODUCTION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




                USER_NAME_RECORD PROC

                call clrScr

                mov dh, 3
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee1
                call WriteString


                mov dh, 4
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee2
                call WriteString



                mov dh, 5
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee3
                call WriteString



                mov dh, 6
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee4
                call WriteString


                mov dh, 7
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee5
                call WriteString


                mov dh, 8
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee6
                call WriteString


                mov dh, 9
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee7
                call WriteString


                mov dh, 10
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee8
                call WriteString


                mov dh, 11
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee9
                call WriteString


                mov dh, 12
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee10
                call WriteString


                mov dh, 13
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee11
                call WriteString

                mov dh, 14
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee12
                call WriteString



                mov dh, 15
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee13
                call WriteString
                mov dh, 15
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee13
                call WriteString
                mov edx, offset username
                mov ecx, 255
                call ReadString



                mov dh, 16
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee14
                call WriteString


                mov dh, 17
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee15
                call WriteString



                mov dh, 18
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee16
                call WriteString



                mov dh, 19
                mov dl, 27
                call Gotoxy
                mov edx, offset helloJee17
                call WriteString


                call readchar

                call clrScr

                ret

                USER_NAME_RECORD ENDP



                ALL_RECORD_MANAGE PROC

                mov eax,0
                mov ax, score
                mov ecx, 10
                xor bx, bx

                divide:
                xor edx, edx
                div ecx
                push dx
                inc bx
                test eax, eax
                jnz divide


                mov cx, bx
                lea si, strResult
                next_digit:
                pop ax
                add al, '0'
                mov [esi], al
                inc esi
                loop next_digit



                mov  edx,OFFSET filename
                call CreateOutputFile
                mov  RecordFileHandle, EAX


                mov  eax,RecordFileHandle
                mov  edx,OFFSET Write1
                mov  ecx,sizeof Write1
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET username
                mov  ecx,sizeof username
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET newline
                mov  ecx,sizeof newline
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET Write2
                mov  ecx,sizeof Write2
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET strResult
                mov  ecx,sizeof strResult
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET newline
                mov  ecx,sizeof newline
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET strLevel
                mov  ecx,sizeof strLevel
                call WriteToFile

                add level,48

                mov  eax,RecordFileHandle
                mov  edx,OFFSET level
                mov  ecx,sizeof level
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET newline
                mov  ecx,sizeof newline
                call WriteToFile

                mov  eax,RecordFileHandle
                mov  edx,OFFSET newline
                mov  ecx,sizeof newline
                call WriteToFile

                mov  eax,RecordFileHandle

                call CloseFile

                ret

                ALL_RECORD_MANAGE ENDP




                MAINMENU PROC

                ;;;;;;;;;;; CLEARING SCREEN

                call clrScr

                ;;;;;;;;;;; SETTING COLOR OF THE SCREEN(CONSOLE)

                mov eax,red
                call settextcolor


                ;;;;;;;;;;;;;;;;; dl = x-axis
                ;;;;;;;;;;;;;;;;; dh = y-axis
                ;;;;;;;;;;;;;;;;; writestring IS USED TO WRITE THE STRING ON WINDOW


                mov dl,30
                mov dh,2
                call gotoxy
                mov edx,offset menuscreen1
                call writestring


                mov dl,30
                mov dh,3
                call gotoxy
                mov edx,offset menuscreen2
                call writestring



                mov dl,30
                mov dh,4
                call gotoxy
                mov edx,offset menuscreen3
                call writestring


                mov dl,30
                mov dh,5
                call gotoxy
                mov edx,offset menuscreen4
                call writestring


                mov dl,30
                mov dh,6
                call gotoxy
                mov edx,offset menuscreen5
                call writestring

                mov dl,30
                mov dh,7
                call gotoxy
                mov edx,offset menuscreen6
                call writestring


                mov dl,30
                mov dh,8
                call gotoxy
                mov edx,offset menuscreen7
                call writestring


                mov dl,30
                mov dh,9
                call gotoxy
                mov edx,offset menuscreen8
                call writestring


                mov dl,30
                mov dh,10
                call gotoxy
                mov edx,offset menuscreen9
                call writestring


                mov dl,40
                mov dh,11
                call gotoxy
                mov edx,offset menuscreen10
                call writestring


                mov dl,40
                mov dh,12
                call gotoxy
                mov edx,offset menuscreen11
                call writestring



                mov dl,40
                mov dh,13
                call gotoxy
                mov edx,offset menuscreen12
                call writestring



                mov dl,40
                mov dh,14
                call gotoxy
                mov edx,offset menuscreen13
                call writestring



                mov dl,40
                mov dh,15
                call gotoxy
                mov edx,offset menuscreen14
                call writestring



                mov dl,30
                mov dh,16
                call gotoxy
                mov edx,offset menuscreen15
                call writestring



                mov dl,30
                mov dh,17
                call gotoxy
                mov edx,offset menuscreen16
                call writestring


                mov dl,30
                mov dh,18
                call gotoxy
                mov edx,offset menuscreen17
                call writestring


                mov dl,30
                mov dh,19
                call gotoxy
                mov edx,offset menuscreen18
                call writestring


                mov dl,30
                mov dh,20
                call gotoxy
                mov edx,offset menuscreen19
                call writestring


                mov dl,30
                mov dh,21
                call gotoxy
                mov edx,offset menuscreen20
                call writestring


                mov dl,30
                mov dh,22
                call gotoxy
                mov edx,offset menuscreen21
                call writestring

                call ReadChar


                MAINMENU ENDP



                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; IMPLEMENTATION OF OPTIONS WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; START OF THE PROCEDURE  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



                OPTIONS_MENU PROC

                ;;;;;;;;;;; CLEARING SCREEN

                call clrScr

                ;;;;;;;;;;; SETTING COLOR OF THE SCREEN(CONSOLE)

                mov eax,red
                call settextcolor


                ;;;;;;;;;;;;;;;;; dl = x-axis
                ;;;;;;;;;;;;;;;;; dh = y-axis
                ;;;;;;;;;;;;;;;;; writestring IS USED TO WRITE THE STRING ON WINDOW


                mov dl,30
                mov dh,4
                call Gotoxy
                mov edx, offset option1
                call WriteString

                mov dl,30
                mov dh,5
                call Gotoxy
                mov edx, offset option2
                call WriteString


                mov dl,30
                mov dh,6
                call Gotoxy
                mov edx, offset option3
                call WriteString


                mov dl,30
                mov dh,7
                call Gotoxy
                mov edx, offset option4
                call WriteString



                mov dl,30
                mov dh,8
                call Gotoxy
                mov edx, offset option5
                call WriteString


                mov dl,30
                mov dh,9
                call Gotoxy
                mov edx, offset option6
                call WriteString



                mov dl,30
                mov dh,10
                call Gotoxy
                mov edx, offset option7
                call WriteString



                mov dl,30
                mov dh,11
                call Gotoxy
                mov edx, offset option8
                call WriteString


                mov dl,30
                mov dh,12
                call Gotoxy
                mov edx, offset option9
                call WriteString


                mov dl,30
                mov dh,13
                call Gotoxy
                mov edx, offset option10
                call WriteString


                mov dl,30
                mov dh,14
                call Gotoxy
                mov edx, offset option11
                call WriteString


                mov dl,30
                mov dh,15
                call Gotoxy
                mov edx, offset option12
                call WriteString


                mov dl,30
                mov dh,16
                call Gotoxy
                mov edx, offset option14
                call WriteString


                start:
                call ReadChar
                cmp al, '1'
                je  GameStart
                cmp al, '2'
                je  RulesInstructions
                jmp start

                GameStart:
                ; Your game start logic goes here
                call DrawPlayer
                jmp Return

                RulesInstructions:
                call RULES_INSTRUCTIONS
                jmp Return


                ;;;;;;;;;;;;;;;; RETURNING
                Return:

                ret




                OPTIONS_MENU ENDP



                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; IMPLEMENTATION OF RULES/INSTRUCTION WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; START OF THE PROCEDURE  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                RULES_INSTRUCTIONS PROC



                ;;;;;;;;; CLEARING THE SCREEN

                call clrScr

                ;;;;;;;;;;;;;;;;; dl = x-axis
                ;;;;;;;;;;;;;;;;; dh = y-axis
                ;;;;;;;;;;;;;;;;; writestring IS USED TO WRITE THE STRING ON WINDOW



                mov dl,30
                mov dh,3
                Call Gotoxy
                mov edx, offset rule1
                call writestring

                mov dl,30
                mov dh,4
                Call Gotoxy
                mov edx, offset rule2
                call writestring

                mov dl,30
                mov dh,5
                Call Gotoxy
                mov edx, offset rule3
                call writestring

                mov dl,30
                mov dh,6
                Call Gotoxy
                mov edx, offset rule4
                call writestring

                mov dl,30
                mov dh,7
                Call Gotoxy
                mov edx, offset rule5
                call writestring

                mov dl,30
                mov dh,8
                Call Gotoxy
                mov edx, offset rule6
                call writestring


                mov dl,30
                mov dh,9
                Call Gotoxy
                mov edx, offset rule7
                call writestring


                mov dl,30
                mov dh,10
                Call Gotoxy
                mov edx, offset rule8
                call writestring


                mov dl,30
                mov dh,11
                Call Gotoxy
                mov edx, offset rule9
                call writestring


                mov dl,30
                mov dh,12
                Call Gotoxy
                mov edx, offset rule10
                call writestring


                mov dl,30
                mov dh,13
                Call Gotoxy
                mov edx, offset rule11
                call writestring


                mov dl,30
                mov dh,14
                Call Gotoxy
                mov edx, offset rule12
                call writestring


                mov dl,30
                mov dh,15
                Call Gotoxy
                mov edx, offset rule13
                call writestring


                mov dl,30
                mov dh,16
                Call Gotoxy
                mov edx, offset rule14
                call writestring


                mov dl,30
                mov dh,17
                Call Gotoxy
                mov edx, offset rule15
                call writestring


                mov dl,30
                mov dh,17
                Call Gotoxy
                mov edx, offset rule16
                call writestring


                mov dl,30
                mov dh,18
                Call Gotoxy
                mov edx, offset rule17
                call writestring


                mov dl,30
                mov dh,19
                Call Gotoxy
                mov edx, offset rule18
                call writestring


                mov dl,30
                mov dh,20
                Call Gotoxy
                mov edx, offset rule19
                call writestring


                mov dl,30
                mov dh,21
                Call Gotoxy
                mov edx, offset rule20
                call writestring



                mov dl,30
                mov dh,22
                Call Gotoxy
                mov edx, offset rule21
                call writestring



                call READCHAR

                ;;;;;;;;;;;;;; RETURNING
                ret

                RULES_INSTRUCTIONS ENDP



                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END OF THE PROCEDURE  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; IMPLEMENTATION OF THANKYOUUUUU WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; START OF THE PROCEDURE  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                THANKS PROC

                ;;;;;;;;;;;;;;;;;;;; SETTING THE BACKGROUD AND FOREGROUND COLOR

                ;EAX = Bits 0-3 = foreground color
                ;Bits 4-7 = background color
                ;RED COLOR OF TEXT
                ;GREEN BACKGROUND

                mov  eax,red+(green*16)
                call SetTextColor

                ;;;;;;;;;;;;;;;;; dl = x-axis
                ;;;;;;;;;;;;;;;;; dh = y-axis
                ;;;;;;;;;;;;;;;;; writestring IS USED TO WRITE THE STRING ON WINDOW


                mov dl,30
                mov dh,6
                Call Gotoxy
                mov edx, offset thankYou1
                call writestring

                mov dl,30
                mov dh,7
                Call Gotoxy
                mov edx, offset thankYou2
                call writestring

                mov dl,30
                mov dh,8
                Call Gotoxy
                mov edx, offset thankYou3
                call writestring

                mov dl,30
                mov dh,9
                Call Gotoxy
                mov edx, offset thankYou4
                call writestring

                mov dl,30
                mov dh,9
                Call Gotoxy
                mov edx, offset thankYou5
                call writestring

                mov dl,30
                mov dh,10
                Call Gotoxy
                mov edx, offset thankYou6
                call writestring


                mov dl,30
                mov dh,11
                Call Gotoxy
                mov edx, offset thankYou7
                call writestring


                mov dl,30
                mov dh,12
                Call Gotoxy
                mov edx, offset thankYou8
                call writestring



                mov dl,30
                mov dh,13
                Call Gotoxy
                mov edx, offset thankYou9
                call writestring



                mov dl,30
                mov dh,14
                Call Gotoxy
                mov edx, offset thankYou10
                call writestring



                mov dl,30
                mov dh,15
                Call Gotoxy
                mov edx, offset thankYou11
                call writestring



                mov dl,30
                mov dh,16
                Call Gotoxy
                mov edx, offset thankYou12
                call writestring



                mov dl,30
                mov dh,17
                Call Gotoxy
                mov edx, offset thankYou13
                call writestring



                mov dl,30
                mov dh,18
                Call Gotoxy
                mov edx, offset thankYou14
                call writestring


                mov dl,30
                mov dh,19
                Call Gotoxy
                mov edx, offset thankYou15
                call writestring

                ;;;;;;;;;;;; CALLING TO READ CAHR FROM KEYBOARD(ENTER)

                call READCHAR

                ;;;;;;;;;;;; RETURNING

                ret


                THANKS ENDP


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END OF THE THANKS FUNCTION   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                END main


                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END OF THE MAIN FUNCTION   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
