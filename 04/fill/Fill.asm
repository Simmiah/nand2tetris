// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
    @SCREEN
    D=A // D=Screen Memory Address (16384)
    @word
    M=D // RAM[@word]=SCREEN (16384)
    @8192
    D=A
    @i
    M=D // 32*256=8192 words in screen
    @KBD
    D=M // D=Keyboard Memory Address (24576)
    @BLACK
    D;JGT // if KBD>0 (key is pressed) goto BLACK
    @WHITE
    D;JEQ // if KBD=0 (no key pressed) goto WHITE
(BLACK)
    @word
    A=M // RAM[@word]
    M=-1 // sets to all black
    @word
    M=M+1 // add one to @word to select next word on screen
    @i
    M=M-1 // subtract one from i for loop
    D=M // D=i
    @BLACK
    D;JGT // if i>0 goto BLACK
    @LOOP
    D;JEQ // if i==0 goto LOOP
(WHITE)
    @word
    A=M // RAM[@word]
    M=0 // sets to all white
    @word
    M=M+1 // add one to @word to select next word on screen
    @i
    M=M-1 // subtract one from i for loop
    D=M // D=i
    @WHITE
    D;JGT // if i>0 goto WHITE
    @LOOP
    D;JEQ // if i==0 goto LOOP
(END)
    @END
    0;JMP // infinite end loop
