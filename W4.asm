.text 
.globl main

main:
  la $a0, input_data_1_msg
  li $v0 4
  syscall
  lwc1 $f4, x_float
  li $v0 6
  syscall
  add.s $f12, $f0, $f4
  la $a0, input_data_2_msg
  li $v0 4
  syscall
  li $v0 5
  syscall
  add $a2, $zero, $v0
  
  power:
    addi $t0, $t0, 0
    subi $a3, $a2, 1
  
    loop: 
      bge $t0, $a3, print    
      mul.s $f12, $f12, $f0
      addi $t0, $t0, 1  
      jal loop

  print:
    la $a0, output_msg
    li $v0, 4
    syscall
    li $v0, 2
    syscall
    
  end:
    li $v0, 10
    syscall

.data
  input_data_1_msg: .asciiz "\nPlease enter the X: " 
  input_data_2_msg: .asciiz "\nPlease enter the N: "
  x_float: .float 0.0
  output_msg: .asciiz "\nX to the power of N is: "
