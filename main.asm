
include Irvine32.inc
include macros.inc

.data

    walls BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                   |   |                                     |", 0
          BYTE "|                                    ---                                      |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_____________________________________________________________________________|", 0

    instrcutions1 Byte "Use the Q W E A S D Z X C keys to move the cannon FROG and space to shoot", 0

    instrcutions2 Byte "Press 'M' for the main menu ", 0

    gameover BYTE "Game Over ", 0

    player_right BYTE "   ", 0
                 BYTE " O-", 0
                 BYTE "   ", 0

    player_left BYTE "   ", 0
                BYTE "-O ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " O ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " O ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " O ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " O ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " O ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " O ", 0
                    BYTE "/  ", 0

    xPos db 56      ; Column (X)
    yPos db 15      ; Row (Y)
    ran dd ?
    xDir db 0
    yDir db 0

    inputChar db 0
    direction db "d"

    color_red db 4       ; Red
    color_green db 2     ; Green
    color_yellow db 14   ; Yellow (for fire symbol)

    current_color db 4   ; Default player color (red)

    emitter_color1 db 2  ; Green
    emitter_color2 db 4  ; Red

    fire_color db 14     ; Fire symbol color (Yellow)

    emitter_symbol db "#"
    emitter_row db 0    ; Two rows above player (fixed row for emitter)
    emitter_col db 1    ; Starting column of the emitter

    fire_symbol db "*", 0
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic

    score db 0          ; Player's score
    lives db 3          ; Player's lives
    levelInfo db 1
    
    counter1 db 0
    counter2 db 0

    zumaLogo1 BYTE "     ______                           _____ _                 _   _                   _____                      ", 0
	zumaLogo2 BYTE "    |___  /                          / ____| |               | | (_)                 / ____|                     ", 0
	zumaLogo3 BYTE "       / /_   _ _ __ ___   __ _     | (___ | |__   ___   ___ | |_ _ _ __   __ _     | |  __  __ _ _ __ ___   ___ ", 0
	zumaLogo4 BYTE "      / /| | | | '_ ` _ \ / _` |     \___ \| '_ \ / _ \ / _ \| __| | '_ \ / _` |    | | |_ |/ _` | '_ ` _ \ / _ \", 0
	zumaLogo5 BYTE "     / /_| |_| | | | | | | (_| |     ____) | | | | (_) | (_) | |_| | | | | (_| |    | |__| | (_| | | | | | |  __/", 0
	zumaLogo6 BYTE "    /_____\__,_|_| |_| |_|\__,_|    |_____/|_| |_|\___/ \___/ \__|_|_| |_|\__, |     \_____|\__,_|_| |_| |_|\___|", 0
	zumaLogo7 BYTE "                                                                           __/ |                                 ", 0
	zumaLogo8 BYTE "                                                                          |___/                                  ", 0

    startLogo1 BYTE "  _____ ______   ____  ____   ______       ____   ____  ___ ___    ___ ", 0
    startLogo2 BYTE " / ___/|      | /    ||    \ |      |     /    | /    ||   |   |  /  _]", 0
    startLogo3 BYTE "(   \_ |      ||  o  ||  D  )|      |    |   __||  o  || _   _ | /  [_ ", 0
    startLogo4 BYTE " \__  ||_|  |_||     ||    / |_|  |_|    |  |  ||     ||  \_/  ||    _]", 0
    startLogo5 BYTE " /  \ |  |  |  |  _  ||    \   |  |      |  |_ ||  _  ||   |   ||   [_ ", 0
    startLogo6 BYTE " \    |  |  |  |  |  ||  .  \  |  |      |     ||  |  ||   |   ||     |", 0
    startLogo7 BYTE "  \___|  |__|  |__|__||__|\_|  |__|      |___,_||__|__||___|___||_____|", 0

    leaderBlogo1 BYTE " _        ___   ____  ___      ___  ____       ____    ___    ____  ____   ___   ", 0
    leaderBlogo2 BYTE "| |      /  _] /    ||   \    /  _]|    \     |    \  /   \  /    ||    \ |   \  ", 0
    leaderBlogo3 BYTE "| |     /  [_ |  o  ||    \  /  [_ |  D  )    |  o  )|     ||  o  ||  D  )|    \ ", 0
    leaderBlogo4 BYTE "| |___ |    _]|     ||  D  ||    _]|    /     |     ||  O  ||     ||    / |  D  |", 0
    leaderBlogo5 BYTE "|     ||   [_ |  _  ||     ||   [_ |    \     |  O  ||     ||  _  ||    \ |     |", 0
    leaderBlogo6 BYTE "|     ||     ||  |  ||     ||     ||  .  \    |     ||     ||  |  ||  .  \|     |", 0
    leaderBlogo7 BYTE "|_____||_____||__|__||_____||_____||__|\_|    |_____| \___/ |__|__||__|\_||_____|", 0

    instructionLogo1 BYTE " ____  ____    _____ ______  ____   __ __     __  ______  ____   ___   ____    _____", 0
    instructionLogo2 BYTE "|    ||    \  / ___/|      ||    \ |  |  |   /  ]|      ||    | /   \ |    \  / ___/", 0
    instructionLogo3 BYTE " |  | |  _  |(   \_ |      ||  D  )|  |  |  /  / |      | |  | |     ||  _  |(   \_ ", 0
    instructionLogo4 BYTE " |  | |  |  | \__  ||_|  |_||    / |  |  | /  /  |_|  |_| |  | |  O  ||  |  | \__  |", 0
    instructionLogo5 BYTE " |  | |  |  | /  \ |  |  |  |    \ |  :  |/   \_   |  |   |  | |     ||  |  | /  \ |", 0
    instructionLogo6 BYTE " |  | |  |  | \    |  |  |  |  .  \|     |\     |  |  |   |  | |     ||  |  | \    |", 0
    instructionLogo7 BYTE "|____||__|__|  \___|  |__|  |__|\_| \__,_| \____|  |__|  |____| \___/ |__|__|  \___|", 0

    arrowLogo1 BYTE "  ___________________________\  ", 0
    arrowLogo2 BYTE " |                            \ ", 0
    arrowLogo3 BYTE " |                            / ", 0
    arrowLogo4 BYTE " `---------------------------/  ", 0

    name1 db 20 dup(0)  ; Name of the player

    arrowX db 0
    arrowY db 2
    menuOption db 1
    count1 db 0
    count2 db 0
    count3 db 0
    count4 db 0

.code

FireBall PROC

    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    L1:

        ; Ensure fire stays within the bounds of the emitter wall
        cmp dl, 20            ; Left wall boundary
        jle end_fire

        cmp dl, 96            ; Right wall boundary
        jge end_fire

        cmp dh, 5             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ; Print the fire symbol at the current position
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mWrite "*"

        mov eax, 50
        call Delay

        call GoToXY
        mWrite " "

        jmp L1

    end_fire:
        mov dx, 0
        call GoToXY

    ret
FireBall ENDP

DrawWall PROC
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov al, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall ENDP

PrintPlayer PROC
    mov eax, brown + (black * 16)
    call SetTextColor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset player_up
        jmp print

    print_down:
        mov esi, offset player_down
        jmp print

    print_left:
        mov esi, offset player_left
        jmp print

    print_right:
        mov esi, offset player_right
        jmp print

    print_upleft:
        mov esi, offset player_upleft
        jmp print

    print_upright:
        mov esi, offset player_upright
        jmp print

    print_downleft:
        mov esi, offset player_downleft
        jmp print

    print_downright:
        mov esi, offset player_downright
        jmp print

    print:
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
	mov counter2, 4
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow

		movzx ecx, counter1

		mov dl, xPos
		inc dh
		call Gotoxy
	loop printcolumn
    
ret
PrintPlayer ENDP

MovePlayer PROC
    mov dx, 0
    call GoToXY

    checkInput:

    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al
    
    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "o"
    je lq
    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    call ball
    ; if character is invalid, check for a new keypress
    jmp checkInput

    move:
        mov al, inputChar
        mov direction, al
        jmp chosen

    paused:
        ; call your pause menu here... once you make it. for now, this will exit the game.
        ret
        
    shoot:
        call FireBall

    chosen:
        call PrintPlayer
        call MovePlayer

        lq:
        call over
    ret
MovePlayer ENDP

InitialiseScreen PROC
    ; Draw the level layout at the start
    call DrawWall

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen ENDP

main PROC
    call printLogo  ; Prints the logo
    call getName  ; Asks user for their name
    
    mgotoxy 44,15
    mov eax,green
    call SetTextColor
    call WaitMsg
    call clrscr

menuLoop:
    call clrscr
    call displayMenu
    call moveArrow
    call ReadChar
    cmp al,0dh
    je L1
    cmp al,'2'
    je l3
    jmp menuLoop
    l3:
    call instructionss
jmp menuLoop
l1:
    call InitialiseScreen

    call MovePlayer

    exit
main ENDP
printLogo PROC             ; Prints the logo

    mov eax, red
    call SetTextColor
    mwritestring offset zumaLogo1
    call Crlf

    mov eax, blue
    call SetTextColor
    mwritestring offset zumaLogo2
    call Crlf

    mov eax, green
    call SetTextColor
    mwritestring offset zumaLogo3
    call Crlf

    mov eax, yellow
    call SetTextColor
    mwritestring offset zumaLogo4
    call Crlf

    mov eax, cyan
    call SetTextColor
    mwritestring offset zumaLogo5
    call Crlf

    mov eax, magenta
    call SetTextColor
    mwritestring offset zumaLogo6
    call Crlf

    mov eax, magenta
    call SetTextColor
    mwritestring offset zumaLogo7
    call Crlf

    mov eax, magenta
    call SetTextColor
    mwritestring offset zumaLogo8
    call Crlf

    mov eax, white
    call SetTextColor

    ret

printLogo endp

getName PROC          ; Asks player for their name

    call Crlf
    call Crlf
    mov eax, brown
    call SetTextColor
    mwrite "Enter your name : "
    mov eax, black + (lightred * 16)
    call SetTextColor
    mreadString name1
    call Crlf
    ret

getName ENDP


displayMenu PROC

    call displayArrow
    call printStart
    call printInstruction
    call printLeaderboard
    call Crlf
    ret

displayMenu ENDP

over Proc
call clrscr
mov dl,50
mov dh,10
call Gotoxy
mov edx,offset gameover
call WriteString
exit
over endp

printStart PROC
 
    call Crlf
    mov eax, blue
    call SetTextColor

    mgotoxy 40, 0
    mwritestring offset startLogo1
    call Crlf

    mgotoxy 40, 1
    mwritestring offset startLogo2
    call Crlf

    mgotoxy 40, 2
    mwritestring offset startLogo3
    call Crlf

    mgotoxy 40, 3
    mwritestring offset startLogo4
    call Crlf

    mgotoxy 40, 4
    mwritestring offset startLogo5
    call Crlf

    mgotoxy 40, 5
    mwritestring offset startLogo6
    call Crlf

    mgotoxy 40, 6
    mwritestring offset startLogo7
    call Crlf

    mov eax, white
    call SetTextColor
    ret

printStart ENDP

printInstruction PROC

    call Crlf
    mov eax, blue
    call SetTextColor

    mgotoxy 35, 10
    mwritestring offset instructionLogo1
    call Crlf

    mgotoxy 35, 11
    mwritestring offset instructionLogo2
    call Crlf

    mgotoxy 35, 12
    mwritestring offset instructionLogo3
    call Crlf

    mgotoxy 35, 13
    mwritestring offset instructionLogo4
    call Crlf

    mgotoxy 35, 14
    mwritestring offset instructionLogo5
    call Crlf

    mgotoxy 35, 15
    mwritestring offset instructionLogo6
    call Crlf

    mgotoxy 35, 16
    mwritestring offset instructionLogo7
    call Crlf

    mov eax, white
    call SetTextColor
    ret

printInstruction ENDP

printLeaderboard proc

    call Crlf
    mov eax, blue
    call SetTextColor

    mgotoxy 37, 20
    mwritestring offset leaderBlogo1
    call Crlf

    mgotoxy 37, 21
    mwritestring offset leaderBlogo2
    call Crlf

    mgotoxy 37, 22
    mwritestring offset leaderBlogo3
    call Crlf

    mgotoxy 37, 23
    mwritestring offset leaderBlogo4
    call Crlf

    mgotoxy 37, 24
    mwritestring offset leaderBlogo5
    call Crlf

    mgotoxy 37, 25
    mwritestring offset leaderBlogo6
    call Crlf

    mgotoxy 37, 26
    mwritestring offset leaderBlogo7
    call Crlf

    mov eax, white
    call SetTextColor
    ret

printLeaderboard endp

displayArrow PROC uses eax edx

    mov eax, red
    call SetTextColor

    mov dl, arrowY

    mgotoxy [arrowX], dl
    mwritestring offset arrowLogo1
    call Crlf

    inc dl
    mgotoxy [arrowX], dl
    mwritestring offset arrowLogo2
    call Crlf

    inc dl
    mgotoxy [arrowX], dl
    mwritestring offset arrowLogo3
    call Crlf

    inc dl
    mgotoxy [arrowX], dl
    mwritestring offset arrowLogo4
    call Crlf

    mov eax, white
    call SetTextColor

    ret
   displayArrow endp

moveArrow Proc uses eax ebx

    call ReadChar

    cmp al, 73h
    je down

    cmp al, 77h
    je up

    jmp ext
    
down:
    mov bl, arrowY
    add bl, 10
    cmp bl, 23
    jg initialTop
    mov arrowY, bl
jmp ext

up:
    mov bl, arrowY
    sub bl, 10
    cmp bl, 2
    jl initialDown
    mov arrowY, bl
jmp ext

initialTop:
    mov bl, 2
    mov arrowY, bl
jmp ext

initialDown:
    mov bl,22
    mov arrowY, bl
jmp ext

ext:
    call clrscr
    ret
moveArrow endp
ball proc
   
    mov dl, 30
    add dl,count1
    cmp count1,60
    jge l1
     inc count1
    mov dh, 5
    call Gotoxy
    mov eax,5
    call randomize
    call randomrange
    add eax,2
    mov ran,eax
    mov eax,ran+(black*16)
    call SetTextColor
    mWrite "*"
    mov eax,50
    call delay
    
   
    l1:
    ret

    ball endp

    instructionss Proc
    l2:
     call clrscr
     mov edx,offset instrcutions1
     call WriteString
     call Crlf
     mov edx,offset instrcutions2
     call WriteString
     call readchar  
     cmp al,'m'
     je l1
     jmp l2
     l1:
     ret
     instructionss endp
END main

