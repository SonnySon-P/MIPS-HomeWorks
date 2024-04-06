.text 
.globl main

main:
  la $a0, input_data_msg
  li $v0 4
  syscall
  li $v0 5
  syscall
  move $a1, $v0
  li $t1, 10
  li $a2, 0
  move $s0, $a1
  beqz $a1, print1
  
  loop:
    divu $a1, $t1
    mflo $a1           # $a1 = quotient
    mfhi $t2           # $t2 = reminder
    addu $a2, $a2, $t2 #         + reminder  
    mul $a2, $a2, $t1  # reverse=reverse*10
    move $s0, $a2
    bgtz $a1, loop
    j print1
    
  print0:
    la $a0, output_msg
    li $v0, 4
    syscall
    move $a0, $a2
    li $v0, 1
    syscall
    j end
  
  print1:
    la $a0, output_msg
    li $v0, 4
    syscall
    div $a0, $a2, $t1
    li $v0, 1
    syscall
    j end
    
  end:
    li $v0, 10
    syscall

.data
  array: .space 400
  input_data_msg: .asciiz "\nPlease enter the data: " 
  input_data: .asciiz "Input: "
  output_msg: .asciiz "\nOutput: "