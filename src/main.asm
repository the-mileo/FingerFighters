.data
str0: .asciiz "\nDigite o numero de jogadores: "
str2: .asciiz "\n"
str3: .asciiz "\nTurno do jogador: "
str4: .asciiz "\n    Atacar [1] \n    Dividir Dedos [2] \n    Ação: "
str_esquerda: .asciiz "\n    Mão esquerda: "
str_direita: .asciiz "\n    Mão direita: "
str5: .asciiz "        Mão que quer usar [Esquerda 0] [Direita 1]: "
str6: .asciiz "        Jogador alvo [0, n - 1]: "
str7: .asciiz "        Mão alvo [Esquerda 0] [Direita 1]: "

.text
.globl main

main:
	# imprimir str0
	la $a0, str0
	li $v0, 4
	syscall
	
	# lê o número de jogadores (n)
    	li $v0, 5                
    	syscall
    	move $s0, $v0 # $s0 = numero de jogadores (n)
    	
    	
    	# --------------------------------------------------------
    	# alloc e inicialização da matriz/vetor
    	# --------------------------------------------------------
    	
    	# aloca a matriz/vetor (n * 2)
    	move $a0, $s0
    	jal alocar_vetor
    	
    	move $s2, $v0 # $s2 = endereço base da matriz/vetor
    	
    	
    	# inicializa matriz/vetor
    	move $a0, $s0
    	move $a1, $s2
    	jal inicializar_vetor
    	
    	
    	
    	
    	
    	
    	# --------------------------------------------------------
    	# loop de gameplay
    	# --------------------------------------------------------
    	
    	li $s4, 0 # jogador atual [0, n - 1]
    	mainloop:
    	
    	
    		# ----------------- Imprimir turno atual ------------------
		# imprimir str3
		la $a0, str3
		li $v0, 4
		syscall
    		
    		# imprimir jogador atual
    		move $a0, $s4
		li $v0, 1
		syscall
		
		# ------------------- Imprimir mãos --------------------
		jal imprimir_maos	
		
		
		
		# ----------------- Ler ação do jogador ------------------
		# imprimir str4
		la $a0, str4
		li $v0, 4
		syscall
		
		# lê a ação do jogador
    		li   $v0, 5                
    		syscall
    		move $s3, $v0 # $s2 = ação do jogador
		
		beq $s3, 1, label_atacar
		beq $s3, 2, label_dividir
		
		
		
    		# --------------------- Atacar -----------------------
    		label_atacar:
    		move $a0, $s4
    		jal atacar
    		j atualiza
    		
    		
    		
    	
    		# --------------------- Dividir -----------------------
    		label_dividir:
    		# Implementar
    		j endmainloop
    		
    		
    		
    	
    	
    		atualiza:
    		# atualiza jogador atual
    		addi $s4, $s4, 1 
    		div $s4, $s0
    		mfhi $s4
    		j mainloop
    	endmainloop:
    	
    	# encerra o programa
    	li $v0, 10
	syscall
    	
    	
    	
    	
alocar_vetor:
	# salva o $t0, $t1 na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t0, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t1, 0($sp) # guarda o valor atual
    	
    	# --------------------------------------------------------
    	# Corpo da função
    	# --------------------------------------------------------

    	# calcula numero de elementos necessários (sendo que cada jogador tem vetor de dois int)
    	li $t1, 2
    	mul $t0, $a0, $t1
    	
    	# calcula o total de bytes necessários
    	sll $a0, $t0, 2 # shift left logical
	
	# alloca memória no heap 	
	li $v0, 9
	syscall
	
	# --------------------------------------------------------
    	# Fim corpo da função
    	# --------------------------------------------------------
	
	# restaura o $t1, $t0 originais da pilha
    	lw   $t1, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t0, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
   	
   	jr $ra
    	
    	
inicializar_vetor: 
	# salva o $t0, $t1 na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t0, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t1, 0($sp) # guarda o valor atual

	# --------------------------------------------------------
    	# Corpo da função
    	# --------------------------------------------------------

	# calcula numero de elementos (max de iterações no loop)
	li $t1, 2
	mul $t0, $a0, $t1
	
	li $t7, 1 # valor de inicialização
	
	li $t2, 0 # indice do loop
	loop:
		bge $t2, $t0, endloop
		
		# calcula o deslocamento em bytes
		sll $t3, $t2, 2 # indice * 4
		add $t4, $t3, $a1 # $t4 = endereço do elemento atual
		
		# armazena valor de inicialização no endereço
		sw $t7, 0($t4)
		
		addi $t2, $t2, 1 # atualiza indice
		j loop
	endloop:
	
	# --------------------------------------------------------
    	# Fim corpo da função
    	# --------------------------------------------------------
	
	
	# restaura o $t1, $t0 originais da pilha
    	lw   $t1, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t0, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
	
	jr $ra


calc_mao:
	# salva o $t0, $t1, $t2 na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t0, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t1, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t2, 0($sp) # guarda o valor atual

    	# --------------------------------------------------------
    	# Corpo da função
    	# --------------------------------------------------------

	# calcula indice no vetor ((jogador atual * 2) + mão de interesse)
	mul $t0, $a0, 2 
	add $t0, $t0, $a1 # $ t0 = indice no vetor
	
	# calcula o deslocamento em bytes
	sll $t1, $t0, 2 # indice * 4
	
	# endereço da mão de interesse (endereço base $a2 + deslocamento em bytes $t1)
	add $t2, $a2, $t1 # $t2 = endereço da mão de interesse
	
	move $v0, $t2
	
	# --------------------------------------------------------
    	# Fim corpo da função
    	# --------------------------------------------------------

	# restaura o $t2, $t1, $t0 originais da pilha
    	lw   $t2, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t1, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t0, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
	
	jr $ra


imprimir_maos:
	# salva o $ra na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $ra, 0($sp) # guarda o endereço de retorno atual
    	
    	# salva o $t2, $t3 na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t2, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t3, 0($sp) # guarda o valor atual

    	# --------------------------------------------------------
    	# Corpo da função
    	# --------------------------------------------------------

	# --------------------- Esquerda ----------------------
	# endereço da mão esquerda:
	move $a0, $s4 # $a0 = jogador atual
	li $a1, 0 # $a1 = mão de interesse (0 = mão esquerda)
	move $a2, $s2 # $a2 = endereço base do vetor
	jal calc_mao 
	move $t2, $v0 # $t2 = endereço da mão de interesse
		
	# imprimir string mão
	la $a0, str_esquerda
	li $v0, 4
	syscall

	# imprime valor no endereço
	lw $t3, 0($t2) # $t3 = valor no endereço
	move $a0, $t3
	li $v0, 1
	syscall	
	
	# --------------------- Direita ------------------------
	# endereço da mão direita:
	move $a0, $s4 # $a0 = jogador atual
	li $a1, 1 # $a1 = mão de interesse (1 = mão esquerda)
	move $a2, $s2 # $a2 = endereço base do vetor
	jal calc_mao 
	move $t2, $v0 # $t2 = endereço da mão de interesse
		
	# imprimir string mão
	la $a0, str_direita
	li $v0, 4
	syscall

	# imprime valor no endereço
	lw $t3, 0($t2) # $t3 = valor no endereço
	move $a0, $t3
	li $v0, 1
	syscall	
	
	
	# --------------------------------------------------------
    	# Fim corpo da função
    	# --------------------------------------------------------
	
	# restaura o $t3, $t2 originais da pilha
    	lw   $t3, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t2, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
	
	# restaura o $ra original da pilha
    	lw   $ra, 0($sp) # recupera o endereço de retorno original
    	addi $sp, $sp, 4 # fecha o espaço na pilha

	jr $ra

atacar:
	# salva o $t0, $t1, $t2, $t3 na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t0, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t1, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t2, 0($sp) # guarda o valor atual
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $t3, 0($sp) # guarda o valor atual


    	# --------------------------------------------------------
    	# Corpo da função
    	# --------------------------------------------------------

	# --------- Mão que jogador quer usar [Esquerda 0] [Direita 1] ---------
	# imprime str5
	la $a0, str5
	li $v0, 4
	syscall
	
	# mão que jogador quer usar
	li $v0, 5                
    	syscall
    	move $t0, $v0 # $t0 = mão que jogador quer usar
    	
    	
    	# ------------------ Jogador alvo [0, n - 1] --------------------
	# imprime str6
	la $a0, str6
	li $v0, 4
	syscall
	
	# jogador alvo [0, n - 1]
	li $v0, 5                
    	syscall
    	move $t1, $v0 # $t1 = jogador alvo [0, n - 1]
    	
    	
    	# ------------- Mão alvo [Esquerda 0] [Direita 1] ---------------
	# imprime str7
	la $a0, str7
	li $v0, 4
	syscall
	
	# mão alvo 
	li $v0, 5                
    	syscall
    	move $t2, $v0 # $t2 = mão alvo 
    	
    	
    	
    	# -------------- Atualiza valor da mão alvo -----------------
    	# salva o $ra na pilha
    	addi $sp, $sp, -4 # abre espaço de 4 bytes na pilha
    	sw $ra, 0($sp) # guarda o endereço de retorno atual
    	
    	# encontra número de dedos da mão que quer usar
    	move $a0, $s4 # $a0 = jogador atual
	move $a1, $t0 # $a1 = mão de interesse
	move $a2, $s2 # $a2 = endereço base do vetor
	jal calc_mao 
	move $t0, $v0 # $t0 = endereço da mão de interesse
	lw $t0, 0($t0) # $t0 = valor na mão de interesse
	
	# encontra número de dedos da mão alvo
	move $a0, $t1 # $a0 = jogador alvo
	move $a1, $t2 # $a1 = mão de interesse
	move $a2, $s2 # $a2 = endereço base do vetor
	jal calc_mao 
	move $t1, $v0 # $t1 = endereço da mão de interesse
	lw $t2, 0($t1) # $t2 = valor na mão de interesse
	
	# novo valor
	add $t2, $t2, $t0
	li $t3, 5
    	div $t2, $t3
    	mfhi $t2 # $t2 = novo valor
    	sw $t2, 0($t1) # salva valor no endereço da mão alvo
    	
    	
	# restaura o $ra original da pilha
    	lw   $ra, 0($sp) # recupera o endereço de retorno original
    	addi $sp, $sp, 4 # fecha o espaço na pilha
    	
    	
    	
    	
	# --------------------------------------------------------
    	# Fim corpo da função
    	# --------------------------------------------------------
    	
    	
    	
    	
    	# restaura o $t3, $t2, $t1, $t0 originais da pilha
    	lw   $t3, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t2, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t1, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
    	lw   $t0, 0($sp) # Recupera o valor original
    	addi $sp, $sp, 4 # Fecha o espaço na pilha
	
	jr   $ra
