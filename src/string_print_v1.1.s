#V1.1
#improvements: compact character encoding
#ONLY UPPERCASE ENGLISH ALPHABET
#13 LETTERS MAX

.data
string_to_print: .string "WELCOME"

LED_ON_COLOUR: .word 0xf6cc4c

A: .byte 0b01111110, 0b00010001, 0b00010001, 0b00010001, 0b01111110
B: .byte 0b01111111, 0b01001001, 0b01001001, 0b01001001, 0b00110110
C: .byte 0b00111110, 0b01000001, 0b01000001, 0b01000001, 0b00100010
D: .byte 0b01111111, 0b01000001, 0b01000001, 0b01000001, 0b00111110
E: .byte 0b01111111, 0b01001001, 0b01001001, 0b01001001, 0b01001001
F: .byte 0b01111111, 0b00001001, 0b00001001, 0b00001001, 0b00001001
G: .byte 0b00111110, 0b01000001, 0b01000001, 0b01001001, 0b01111010
H: .byte 0b01111111, 0b00001000, 0b00001000, 0b00001000, 0b01111111
I: .byte 0b00000000, 0b01000001, 0b01111111, 0b01000001, 0b00000000
J: .byte 0b00100000, 0b01000000, 0b01000001, 0b00111111, 0b00000001
K: .byte 0b01111111, 0b00001000, 0b00010100, 0b00100010, 0b01000001
L: .byte 0b01111111, 0b01000000, 0b01000000, 0b01000000, 0b01000000
M: .byte 0b01111111, 0b00000010, 0b00001100, 0b00000010, 0b01111111
N: .byte 0b01111111, 0b00000100, 0b00001000, 0b00010000, 0b01111111
O: .byte 0b00111110, 0b01000001, 0b01000001, 0b01000001, 0b00111110
P: .byte 0b01111111, 0b00001001, 0b00001001, 0b00001001, 0b00000110
Q: .byte 0b00111110, 0b01000001, 0b01010001, 0b00100001, 0b01011110
R: .byte 0b01111111, 0b00001001, 0b00011001, 0b00101001, 0b01000110
S: .byte 0b00100110, 0b01001001, 0b01001001, 0b01001001, 0b00110010
T: .byte 0b00000001, 0b00000001, 0b01111111, 0b00000001, 0b00000001
U: .byte 0b00111111, 0b01000000, 0b01000000, 0b01000000, 0b00111111
V: .byte 0b00011111, 0b00100000, 0b01000000, 0b00100000, 0b00011111
W: .byte 0b00111111, 0b01000000, 0b00111000, 0b01000000, 0b00111111
X: .byte 0b01100011, 0b00010100, 0b00001000, 0b00010100, 0b01100011
Y: .byte 0b00000111, 0b00001000, 0b01110000, 0b00001000, 0b00000111
Z: .byte 0b01100001, 0b01010001, 0b01001001, 0b01000101, 0b01000011

uppercase_alphabet: .word A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
current_alphabet_index: .byte 0
character_sequence: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
character_sequence_index: .byte 0
character_sequence_length: .byte 0

.text

main:
    la a0, LED_MATRIX_0_BASE
    la a1, LED_MATRIX_0_SIZE 
    add a1, a0, a1
    mv a2, zero
    call clear_matrix
    la a0, string_to_print
    la a1, character_sequence
    call convert_string_to_sequence
    la a0, LED_MATRIX_0_BASE
    la a1, LED_MATRIX_0_SIZE
    add a1, a0, a1
    mv a2, zero
    
    d_loop:    
    call assign_character_index
    call index_alphabet
    call next_character
    li a7, 30
    ecall
    mv t0, a0
    wait:
        ecall
        sub a1, a0, t0
        addi a1, a1, -75
        blt a1, zero, wait
        li s0, 0
        j d_loop
        
convert_string_to_sequence: 
    xor t0, t0, t0 
    convert_loop:
        add a2, a0, t0 
        lb a2, 0(a2) 
        addi a2, a2, -65
        add t1, a1, t0
        sb a2, 0(t1)
        addi a2, a2, 65
        beqz a2, exit_convert_loop
        addi t0, t0, 1
        j convert_loop
    
    exit_convert_loop:
    la t1, character_sequence_length
    sb t0, 0(t1)
    ret
    
next_character:
    la t0, character_sequence_index
    lb t1, 0(t0)
    la t2, character_sequence_length
    lb t2, 0(t2)
    addi t2, t2, -1
    beq t1, t2, exit_program
    addi t1, t1, 1
    sb t1, 0(t0)
    ret
    
assign_character_index:
    la t0, character_sequence_index
    lb t0, 0(t0)
    la t2, character_sequence
    add t2, t2, t0
    lb t0, 0(t2)
    la t1, current_alphabet_index
    sb t0, 0(t1)
    mv a6, t1
    ret
 
index_alphabet:
    addi sp, sp, -4 
    sw ra, 0(sp)
    lb a6, 0(a6)
    slli a6, a6, 2
    
    la t4, uppercase_alphabet
    add t4, t4, a6
    lw t4, 0(t4)
    call draw_character
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    
draw_character:
    addi sp, sp, -4
    sw ra, 0(sp)
    la a0, LED_ON_COLOUR
    lw a0, 0(a0)
    li t3, 4
    li t6, 7
    xor a1, a1, a1
    column_loop:
        xor a2, a2, a2
        add t0, t4, a1
        lb t0, 0(t0)
        row_loop:
            andi t1, t0, 1
            beqz t1, no_light_up
            call setLED
        no_light_up:
            bge a2, t6, exit_row_loop
            srli t0, t0, 1
            addi a2, a2, 1
            j row_loop
        exit_row_loop:
            bge a1, t3, continue
            addi a1, a1, 1
            j column_loop
    continue:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    
setLED: 
    addi sp, sp, -4
    sw t0, 0(sp)
    addi sp, sp, -4
    sw t1, 0(sp)
    li t1, LED_MATRIX_0_WIDTH
    mul t0, a2, t1
    add t0, t0, a1
    li t1, 4
    mul t0, t0, t1
    li t1, LED_MATRIX_0_BASE
    la s5, character_sequence_index
    lb s5, 0(s5)
    li s6, 24
    mul s5, s5, s6
    add t1, t1, s5
    add t0, t1, t0
    sw a0, 0(t0)
    lw t1, 0(sp)
    addi sp, sp, 4
    lw t0, 0(sp)
    addi sp, sp, 4
    jr ra

clear_matrix:
    sw a2, 0(a0)
    addi a0, a0, 4
    sw a2, 0(a0)
    addi a0, a0, 4
    blt a0, a1, clear_matrix
    ret
    
exit_program:
    li a7, 10
    ecall