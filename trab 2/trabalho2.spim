.data
	incorreto: .asciiz "entrada incorreta\n"
	bitParidade: .asciiz "bit-paridade: "
	saida: .asciiz "\nsaida: "
	line: .asciiz "\n"
.text
main:
	li $v0, 5		# le numero
	syscall
	
	move $t0, $v0		# salva em t0 (usado para calculo)
	move $s0, $v0		# salva em s0
	
	bge  $s0, 128, error	# se t0 >= 128, vai para error

	li $t1, 7		# limite for
	li $t2, 0		# i

loop: 
	beq $t1, 0, calcular	# quando t1 chegar em 0, vai para calcular
	rem $t3, $t0, 2		# t3 = t0 % 2
	beq $t3, 0, bit0	# se t3 == 0, vai para bit0
	add $t2, $t2, 1		# se t3 == 1, i++

bit0:
	srl $t0, $t0, 1		# sift numero
	sub $t1, $t1, 1		# j-- (contador loop)
	b loop	
	
calcular:
	rem $t5, $t2, 2		# t5 = t2%2
	beqz $t5, even		# se par, vai para even
		
	# odd -----
	
	li $v0, 4		# imprime texto
	la $a0, bitParidade
	syscall
	
	li $v0, 1		
	li $a0, 1		# imprime bit paridade 1
	syscall
	
	addi  $t4, $s0, 128	# t4 = valor digitado + 128
	
	li $v0, 4		# imprime texto
	la $a0, saida
	syscall
	
	li $v0, 1		# imprime soma 
	move $a0, $t4
	syscall
	
	li $v0, 4		# imprime linha
	la $a0, line
	syscall
	
	li $v0, 10		# sai do programa
	syscall
		
even: 
	li $v0, 4		# imprime texto
	la $a0, bitParidade
	syscall
	
	li $v0, 1	
	li $a0, 0		# imprime bit paridade 0
	syscall
	
	li $v0, 4		# imprime texto
	la $a0, saida
	syscall
	
	li $v0, 1		# imprime valor digitado
	move $a0, $s0
	syscall
	
	li $v0, 4		# imprime linha
	la $a0, line
	syscall
	
	li $v0, 10		# sai do programa
	syscall		
	
		
error:
	li $v0, 4		# imprime texto
	la $a0, incorreto
	syscall
	
	li $v0, 10		# sai do programa
	syscall
		
								
