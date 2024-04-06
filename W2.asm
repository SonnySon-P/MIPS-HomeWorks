.text 
.globl main

main:
  la $a0, input_data_1_msg
  li $v0 4
  syscall
  li $v0 5
  syscall
  add $a1, $zero, $v0
  la $a0, input_data_2_msg
  li $v0 4
  syscall
  li $v0 5
  syscall
  add $a2, $zero, $v0
  
  divisor:
    bgt $a1, $a2, case1
    addi $t0, $t0, 0 
    
    loop:         
      sub $a2, $a2, $a1
      addi $t0, $t0, 1 
      bgt $a1, $a2, case2 
      jal loop
      
  case1:
    add $s0, $zero, $zero
    jal print
    
  case2:
    add $s0, $zero, $t0
    jal print

  print:
    la $a0, output_msg
    li $v0, 4
    syscall
    li $v0, 1
    add $a0, $zero, $s0
    syscall
    
  end:
    li $v0, 10
    syscall

.data
  input_data_1_msg: .asciiz "\nPlease enter the Divisor: " 
  input_data_2_msg: .asciiz "\nPlease enter the Dividend: "
  output_msg: .asciiz "\nQuotient is: "