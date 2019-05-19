.data
	Add: .asciiz "ADD: "
	Sub: .asciiz "\nSUB: "
	And: .asciiz "\nAND: "
	Or: .asciiz "\nOR: "
	Xor: .asciiz "\nXOR: "
	Sll: .asciiz "\nSLL(3): "
	Srl: .asciiz "\nSRL(1): "
	Esp: .asciiz "\n"
.text

main:
	# le numeros
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	# operacoes
	add $t2, $t1, $t0
	sub $t3, $t0, $t1
	and $t4, $t1, $t0
	or $t5, $t1, $t0
	xor $t6, $t1, $t0
	sll $t7, $t0,3
	srl  $t8, $t1,1
	
	# imprime add
	li $v0, 4
	la $a0, Add
	syscall 
	
	li $v0, 1
	move $a0, $t2
	syscall 
	
	# imprime sub
	li $v0, 4
	la $a0, Sub
	syscall 
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	# imprime and
	li $v0, 4
	la $a0, And
	syscall 
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	# imprime or
	li $v0, 4
	la $a0, Or
	syscall 
	
	li $v0, 1
	move $a0, $t5
	syscall	
	
	# imprime xor
	li $v0, 4
	la $a0, Xor
	syscall 
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	# imprime sll
	li $v0, 4
	la $a0, Sll
	syscall 
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	# imprime sll
	li $v0, 4
	la $a0, Srl
	syscall 
	
	li $v0, 1
	move $a0, $t8
	syscall
	
	# imprime espaco
	li $v0, 4
	la $a0, Esp
	syscall 

	# finaliza
	li $v0, 10
	syscall
