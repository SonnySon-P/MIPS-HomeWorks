.text 
.globl main

main:
  function_input_data_number:
    la $a0, input_data_number_msg
    li $v0 4
    syscall
    li $v0 5
    syscall 
    move $s0, $v0

  function_input_data:
    li $t0, 0
    li $t1, 0
    loop1:
      la $a0, input_data_msg
      li $v0, 4
      syscall
      li $v0, 5
      syscall
      sw $v0, array($t0)
      addi $t0, $t0, 4
      addi $t1, $t1, 1
      beq $t1, $s0, function_output_data
      j loop1
   
  function_output_data:
    subi $s1, $t0, 4
    la $a0, output_reverse_order_data_msg
    li $v0, 4
    syscall
    loop2:
      subi $t0, $t0, 4
      subi $t1, $t1, 1
      la $a0, warp
      li $v0, 4
      syscall
      lw $a0, array($t0)
      li $v0, 1
      syscall
      beq $t1, 0, function_buble_sort
      j loop2
      
  function_buble_sort:
    beq $s0, 1, function_second_min_and_max_type1
    li $t0, 0
    li $t1, 0
    subi $t4, $s0, 1
    loop3:
      addi $t2, $t0, 4
      addi $t3, $t1, 1
      loop4:
        lw $a0, array($t0)
        lw $a1, array($t2)
        bgt $a1, $a0, else
          move $a3, $a0
          sw $a1, array($t0)
          sw $a3, array($t2)
        else:
          beq $t3, $s0, continue
          addi $t2, $t2, 4
          addi $t3, $t3, 1        
          beq $t3, $s0, continue
          j loop4
      continue:
      addi $t0, $t0, 4
      addi $t1, $t1, 1
      beq $t1, $t4, function_second_min_and_max_type2
      j loop3

  function_second_min_and_max_type1:
    la $a0, output_second_smallest_number_msg
    li $v0, 4
    syscall
    addi $t0, $zero, 0
    lw $a0, array($t0)
    li $v0, 1
    syscall
    la $a0, output_second_largest_number_msg
    li $v0, 4
    syscall
    addi $t0, $zero, 0
    lw $a0, array($t0)
    li $v0, 1
    syscall
    j function_end
     
  function_second_min_and_max_type2:
    la $a0, output_second_smallest_number_msg
    li $v0, 4
    syscall
    addi $t0, $zero, 4
    lw $a0, array($t0)
    li $v0, 1
    syscall
    la $a0, output_second_largest_number_msg
    li $v0, 4
    syscall
    subi $t0, $s1, 4
    lw $a0, array($t0)
    li $v0, 1
    syscall
    
  function_end:
    li $v0, 10
    syscall

.data
  array: .space 400
  input_data_number_msg: .asciiz "\nPlease enter the number of data(n=): " 
  input_data_msg: .asciiz "Input: "
  output_reverse_order_data_msg: .asciiz "Print out the array in the reverse order: "
  warp: .asciiz "\n"
  output_second_largest_number_msg: .asciiz "\nSecond largest number: "
  output_second_smallest_number_msg: .asciiz "\nSecond smallest number: "