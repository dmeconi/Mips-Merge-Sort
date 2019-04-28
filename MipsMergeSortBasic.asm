.data
list: .word 3, 2 ,1, 5, 4, 0
subArray1: .space 20
subArray2: .space 20
.text 
#gets user input for size of array
main:
#ask user size of array

la $a0, list 
li $a1, 0
li $a2, 6
jal mergeSort

Terminate:
li $v0, 10
syscall 
#splits the array into even parts
mergeSort:
li $sp, -20
sw $ra, 0($sp)
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $a2, 12($sp)

#if i < r do this
blt $a1,$a2,iLessThanR
lw $ra, 0($sp)
jr $ra
iLessThanR:
sub $t0, $a2,$a1
srl $t0, $t0,1
add $t0, $a1, $t0
move $s0, $t0
sw $s0, 16($sp)
lw $a0,4($sp)
lw $a1, 8($sp)
move $a2, $s0
jal mergeSort
lw $a0,4($sp)
addi $s0, $s0, 1 
move $a1, $s0
lw $a2, 12($sp)
jal mergeSort
