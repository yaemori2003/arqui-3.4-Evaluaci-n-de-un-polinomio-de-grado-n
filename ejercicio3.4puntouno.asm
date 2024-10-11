.data
    ms1:    .asciiz "Ingrese el grado del polinomio: "
    ms2:    .asciiz "Ingrese el coeficiente: "
    ms3:    .asciiz "Ingrese el valor de x (float): "
    ms4:    .asciiz "El resultado del polinomio es: "
    ms5:    .asciiz "\n"

.text
    .globl main
main:
    li $v0, 4
    la $a0, ms1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    addi $t3, $t0, 1

    li $v0, 9
    sll $a0, $t3, 2
    syscall
    move $s0, $v0
    move $s1, $s0

    li $t1, 0

ingresarcof:
    li $v0, 4
    la $a0, ms2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    mtc1 $t2, $f0
    cvt.s.w $f0, $f0

    s.s $f0, 0($s0)
    addiu $s0, $s0, 4

    addi $t1, $t1, 1
    blt $t1, $t3, ingresarcof

    li $v0, 4
    la $a0, ms3
    syscall

    li $v0, 6
    syscall
    mov.s $f2, $f0

    move $s0, $s1
    move $t1, $t0

    l.s $f4, 0($s0)
    addiu $s0, $s0, 4
    addi $t1, $t1, -1

operar:
    bltz $t1, imprimir

    mul.s $f4, $f4, $f2

    l.s $f6, 0($s0)
    addiu $s0, $s0, 4

    add.s $f4, $f4, $f6

    addi $t1, $t1, -1
    j operar

imprimir:
    li $v0, 4
    la $a0, ms4
    syscall

    li $v0, 2
    mov.s $f12, $f4
    syscall

    li $v0, 4
    la $a0, ms5
    syscall

    li $v0, 10
    syscall
