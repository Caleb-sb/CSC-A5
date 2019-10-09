#Question 1: find single Digit divisors
.data
  input: .asciiz "Enter a number:\n"
  output: .asciiz "The single digit divisors are:\n"
  nl: .asciiz "\n"
.text
.globl main
main:
  la $a0, input
  li $v0, 4
  syscall             #Ask for user input

  li $v0, 5
  syscall             #Receive input from the user

  move $t0, $v0       #temp store the input int
  li $t1, 2
  
  la $a0, output
  li $v0, 4
  syscall

  loop:
    beq, $t1, 10, end
    div $t0, $t1
    mfhi $t3
    bne $t3, $0, increment
	
	move $a0, $t1
    li $v0, 1
    syscall

	la $a0, nl
	li $v0, 4
	syscall 
  increment:
    addi $t1, $t1, 1
    b loop

  end:
	li $v0, 10
	syscall
	
