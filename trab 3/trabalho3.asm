.data
	newLine:  .asciiz  "\n"         
	msgErro:  .asciiz "Entrada invalida.\n"

.text
main:
	li $v0, 5		# le numero
	syscall
	
	move $t0, $v0       	# salva em t0
    
	li $s1, 32768       	# s1 = 32768
	
	ble $s1, $t0, error	# se t0 >= 32768, vai para error
    	blez $t0, error 	# se t0 <= 0, vai para error
    	
    	li $t1, 2 		# t1 = 2
	li $t5, 3 		# t5 = 3(i do for)
	
    	jal while		# vai para while
    
while:
    	div $t0, $t1 		# t0/t1 (entrada/2)
    	mfhi $t2 		# pega o resto da divisão
    	
   	bnez $t2, for 		# se t2!=0, vai para for
   	
    	mflo $t0 		# pega o quociente da divisão 
  
    	li $v0, 1      		# imprime t1  	
    	move $a0, $t1  		

    	syscall        		
    	
    	li $v0, 4      		# imprime linha
	la $a0, newLine    	
	syscall        		
	
	j while 		
    
for:
	mtc1 $t0, $f0 		# f0=t0 (entrada de usuário vira ponto flutuante)
	cvt.s.w $f0, $f0 	# converte o valor flutuante em precisão simples
	
	sqrt.s $f2, $f0 	# f2=f0 (salva em f2 a raiz de n)

	mtc1 $t5, $f1 		# f1=t5 (i vira ponto flutuante)
	cvt.s.w $f1, $f1 	# converte o valor flutuante em precisão simples   

	c.le.s  $f1, $f2 	# compara se f1 > f2
	bc1f if  		# se verdadeiro, vai para if  
    
	div $t0, $t5 		# divide a entrada do usuário por i (t5)
	mfhi $t2 		# pega o resto da divisão
	
	beqz $t2, restoZero 	# se t2==0, vai para restoZero
    
	add $t5, $t5, $t1 	# i = i + 2
	
	jal for 		
    
restoZero:
	div $t0, $t5 		# divide a entrada do usuário por i
	mfhi $t2 		# pega o resto 
	
	bnez $t2, for 		# se t2 != 0, vai para for
    
    	li $v0, 1      		# imprime t5
	move $a0, $t5  		
	syscall        		
 
  	li $v0, 4      		# imprime linha
	la $a0, newLine    	
	syscall        		
    
	mflo $t0 		# pega o quociente    
    
	j restoZero 		

resultado:    		
	li $v0, 1 		# imprime resultado
	move $a0, $t0     		
	syscall        		
  
  	li $v0, 4      		# imprime linha
	la $a0, newLine    	
	syscall        		
	
	jal exit
	
error: 	
	li $v0, 4 		# imprime texto
	la $a0, msgErro 	
	syscall 	
		
	jal exit
	
if:
	bgt $t0, 2, resultado	# se t0 for maior que 2, vá para resultado	
	
exit:     
	li $v0, 10 		# sai do programa
	syscall 		
