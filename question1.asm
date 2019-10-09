#Question 1: find single Digit divisors
.data
  input: .asciiz "\nEnter a number:"
  output: .asciiz "\nThe single digit divisors are:"

.globl main
  la $a0, input
  li $v0, 4
  syscall             #Ask for user input

  li $v0, 5
  syscall             #Receive input from the user

  move $t0, $v0       #temp store the input int
  li $t1, 2

  loop:
    beq, $t1, 10, end
    div $t0, $t1
    mfhi $t3
    bne $t3, $0, increment
    move $a0, $t1
    li $v0, 4
    syscall

  increment:
    addi $t1, $t1, 1
    b loop

  end:
