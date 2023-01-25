.data
str: .string "/8 trouvé(s)"

.text
li s11 SWITCHES_0_BASE
li s10, SWITCHES_1_BASE
lb a7, 0(s11)
lb a6, 0(s10)
li a5, 8

li t6, 0b00000001

start:
    and t5, a7, t6
    and t4, a6, t6
    beq t4, t5, match
    j cont

match:
    addi a4, a4, 1

cont:
    slli t6, t6, 1
    addi a5, a5, -1
    bnez a5, start

#end:
    mv a0, a4
    li a7, 1
    ecall
    la a0, str
    li a7, 4
    ecall
    li a0, 0
    li a7, 93
    ecall