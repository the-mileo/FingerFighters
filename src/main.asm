.data
str0:         .asciiz "\nDigite o numero de jogadores (2 a 4): "
str2:         .asciiz "\n"
str3:         .asciiz "\nTurno do jogador: "
str4:         .asciiz "\n    Atacar [1] \n    Dividir Dedos [2] \n    Acao: "
str_esquerda: .asciiz "\n    Mao esquerda: "
str_direita:  .asciiz "\n    Mao direita: "
str5:         .asciiz "        Mao que quer usar [Esquerda 0] [Direita 1]: "
str6:         .asciiz "        Jogador alvo [0, n - 1]: "
str7:         .asciiz "        Mao alvo [Esquerda 0] [Direita 1]: "
msgDebug:     .asciiz "\n DEBUG"

    # Cores de identificação no centro da palma de cada jogador
    cores_jogadores:
        .word 0x0000FFCC    # Jogador 0 (Embaixo)  -> Ciano
        .word 0x00EE2244    # Jogador 1 (Em cima)  -> Vermelho
        .word 0x0000BB44    # Jogador 2 (Direita)  -> Verde
        .word 0x008833FF    # Jogador 3 (Esquerda) -> Roxo

    # 0x0000FFCC funciona como cor-chave (placeholder) no centro da palma
    mao_0:
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x0000FFCC, 0x0000FFCC, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000

    mao_1:
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x0000FFCC, 0x0000FFCC, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000

    mao_2:
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x0000FFCC, 0x0000FFCC, 0x00A0A0A0, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000

    mao_3:
        .word 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00303030
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x0000FFCC, 0x0000FFCC, 0x00A0A0A0, 0x00A0A0A0, 0x00303030
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000

    mao_4:
        .word 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030
        .word 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0
        .word 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0, 0x00303030, 0x00A0A0A0
        .word 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0, 0x00A0A0A0
        .word 0x00000000, 0x00303030, 0x00A0A0A0, 0x0000FFCC, 0x0000FFCC, 0x00A0A0A0, 0x00A0A0A0, 0x00303030
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00A0A0A0, 0x00A0A0A0, 0x00303030, 0x00000000, 0x00000000
        .word 0x00000000, 0x00000000, 0x00303030, 0x00303030, 0x00303030, 0x00303030, 0x00000000, 0x00000000

    tabela_maos: .word mao_0, mao_1, mao_2, mao_3, mao_4

.text
.globl main

main:
    # imprimir str0
    la   $a0, str0
    li   $v0, 4
    syscall
    
    # lê o número de jogadores (n)
    li   $v0, 5                
    syscall
    move $s0, $v0             # $s0 = numero de jogadores (n)
    
    # Validação (2 a 4 jogadores)
    blt  $s0, 2, main
    bgt  $s0, 4, main
    
    # aloca a matriz/vetor (n * 2)
    move $a0, $s0
    jal  alocar_vetor
    move $s2, $v0             # $s2 = endereço base da matriz/vetor
    
    # inicializa matriz/vetor
    move $a0, $s0
    move $a1, $s2
    jal  inicializar_vetor
    
    # loop de gameplay
    li   $s4, 0               # jogador atual [0, n - 1]
    li   $s5, 0               # numero de skips que ja foram feitos

mainloop:
    # Atualiza o Bitmap Display com o estado atual das mãos
    jal  atualizar_tela
    
    # Checa se o jogador é válido e pula ele caso não for
    jal checkIfSkip
    
    addi $s0, $s0, -1
    #bge $s5, $s0, winner
    addi $s0, $s0, 1
    
    bgt $v0, $zero, mainloop #jogador morto, passa pro proximo
    move $s5, $zero #jogador vivo, logo reseta skips
    
    	#DEBUG
    la   $a0, msgDebug
    li   $v0, 4
    syscall

    # ----------------- Imprimir turno atual ------------------
    la   $a0, str3
    li   $v0, 4
    syscall
    
    move $a0, $s4
    li   $v0, 1
    syscall
    
    # ------------------- Imprimir mãos -----------------------
    jal  imprimir_maos
    
    # ----------------- Ler ação do jogador -------------------
    la   $a0, str4
    li   $v0, 4
    syscall
    
    li   $v0, 5                
    syscall
    move $s3, $v0             # $s3 = ação do jogador
    
    beq  $s3, 1, label_atacar
    beq  $s3, 2, label_dividir
    j    mainloop

    # --------------------- Atacar ----------------------------
label_atacar:
    move $a0, $s4
    jal  atacar
    j    atualiza

    # --------------------- Dividir ---------------------------
label_dividir:
    # Implementar
    j    endmainloop

atualiza:
    addi $s4, $s4, 1 
    div  $s4, $s0
    mfhi $s4
    j    mainloop

endmainloop:
    li   $v0, 10
    syscall


# -------------------------------------------------------------------------
# draw_hand:
#   $a0 = Posição X na tela (0..24)
#   $a1 = Posição Y na tela (0..24)
#   $a2 = Quantidade de dedos (0..4)
#   $a3 = Flags de orientação e cor:
#         Bits 0..1 -> Rotação:
#             0 = 0°   (dedos para CIMA     - Jogador 0 / Embaixo)
#             1 = 90°  (dedos para DIREITA  - Jogador 3 / Esquerda)
#             2 = 180° (dedos para BAIXO    - Jogador 1 / Em cima)
#             3 = 270° (dedos para ESQUERDA - Jogador 2 / Direita)
#         Bit 2 (valor +4) -> Espelhamento (0 = normal, 4 = espelhado)
#         Bits 3..4 (valor +0, +8, +16, +24) -> ID do Jogador (0..3) para cor
# -------------------------------------------------------------------------
draw_hand:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    la   $t0, tabela_maos
    sll  $t1, $a2, 2
    add  $t0, $t0, $t1
    lw   $t2, 0($t0)          # $t2 = endereço base do sprite 8x8

    addi $t3, $zero, 0        # $t3 = r (linha na tela: 0..7)
    addi $t9, $zero, 8
    lui  $t8, 0x1004          # $t8 = base do Bitmap Display (0x10040000)

loop_linha:
    beq  $t3, $t9, fim_draw
    addi $t4, $zero, 0        # $t4 = c (coluna na tela: 0..7)

loop_coluna:
    beq  $t4, $t9, prox_linha

    # Separa rotação ($t0 = $a3 & 3) e espelhamento ($t1 = $a3 & 4)
    andi $t0, $a3, 3
    andi $t1, $a3, 4

    beq  $t0, 0, rot_0
    beq  $t0, 1, rot_1
    beq  $t0, 2, rot_2
    j    rot_3

rot_0:                        # 0° (Dedos para CIMA)
    add  $t5, $zero, $t3      # sr = r
    add  $t6, $zero, $t4      # sc = c
    j    aplica_espelho

rot_1:                        # 90° horário (Dedos para DIREITA)
    addi $t5, $zero, 7
    sub  $t5, $t5, $t4        # sr = 7 - c
    add  $t6, $zero, $t3      # sc = r
    j    aplica_espelho

rot_2:                        # 180° (Dedos para BAIXO)
    addi $t5, $zero, 7
    sub  $t5, $t5, $t3        # sr = 7 - r
    addi $t6, $zero, 7
    sub  $t6, $t6, $t4        # sc = 7 - c
    j    aplica_espelho

rot_3:                        # 270° horário (Dedos para ESQUERDA)
    add  $t5, $zero, $t4      # sr = c
    addi $t6, $zero, 7
    sub  $t6, $t6, $t3        # sc = 7 - r

aplica_espelho:
    beq  $t1, $zero, calc_offset
    addi $t0, $zero, 7
    sub  $t6, $t0, $t6        # sc = 7 - sc (inverte mão esquerda/direita)

calc_offset:
    # Endereço do pixel no sprite: $t2 + ((sr * 8 + sc) * 4)
    sll  $t5, $t5, 3
    add  $t5, $t5, $t6
    sll  $t5, $t5, 2
    add  $t5, $t2, $t5
    lw   $t7, 0($t5)

    # Verifica se o pixel é a cor-chave (0x0000FFCC) e troca pela cor do jogador
    li   $t0, 0x0000FFCC
    bne  $t7, $t0, desenha_pixel

    srl  $t0, $a3, 3          # extrai ID do jogador (bits 3..4)
    andi $t0, $t0, 3
    sll  $t0, $t0, 2          # offset em words na tabela cores_jogadores
    la   $t1, cores_jogadores
    add  $t0, $t1, $t0
    lw   $t7, 0($t0)          # carrega a cor personalizada do jogador

desenha_pixel:
    # Endereço do pixel na tela: 0x10040000 + (((Y + r) * 32 + (X + c)) * 4)
    add  $t5, $a1, $t3
    sll  $t5, $t5, 5
    add  $t6, $a0, $t4
    add  $t5, $t5, $t6
    sll  $t5, $t5, 2
    add  $t5, $t8, $t5
    
    sw   $t7, 0($t5)

prox_pixel:
    addi $t4, $t4, 1
    j    loop_coluna

prox_linha:
    addi $t3, $t3, 1
    j    loop_linha

fim_draw:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


# -------------------------------------------------------------------------
# atualizar_tela:
#   Desenha todas as mãos dos jogadores ativos ($s0 = 2..4) com cores únicas
# -------------------------------------------------------------------------
atualizar_tela:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # --- JOGADOR 0: Embaixo (Cor 0 -> +0) ---
    addi $a0, $zero, 7        # X = 7
    addi $a1, $zero, 24       # Y = 24
    lw   $a2, 0($s2)          # Mão esquerda J0
    addi $a3, $zero, 0        # rot 0 (0) + normal (0) + jogador 0 (0) = 0
    jal  draw_hand

    addi $a0, $zero, 17       # X = 17
    addi $a1, $zero, 24       # Y = 24
    lw   $a2, 4($s2)          # Mão direita J0
    addi $a3, $zero, 4        # rot 0 (0) + espelhado (4) + jogador 0 (0) = 4
    jal  draw_hand

    # --- JOGADOR 1: Em cima (Cor 1 -> +8) ---
    addi $a0, $zero, 7        # X = 7
    addi $a1, $zero, 0        # Y = 0
    lw   $a2, 8($s2)          # Mão esquerda J1
    addi $a3, $zero, 14       # rot 2 (2) + espelhado (4) + jogador 1 (8) = 14
    jal  draw_hand

    addi $a0, $zero, 17       # X = 17
    addi $a1, $zero, 0        # Y = 0
    lw   $a2, 12($s2)         # Mão direita J1
    addi $a3, $zero, 10       # rot 2 (2) + normal (0) + jogador 1 (8) = 10
    jal  draw_hand

    blt  $s0, 3, fim_atualizar_tela

    # --- JOGADOR 2: Canto Direito (Cor 2 -> +16) ---
    addi $a0, $zero, 24       # X = 24
    addi $a1, $zero, 8        # Y = 8
    lw   $a2, 16($s2)         # Mão esquerda J2
    addi $a3, $zero, 23       # rot 3 (3) + espelhado (4) + jogador 2 (16) = 23
    jal  draw_hand

    addi $a0, $zero, 24       # X = 24
    addi $a1, $zero, 16       # Y = 16
    lw   $a2, 20($s2)         # Mão direita J2
    addi $a3, $zero, 19       # rot 3 (3) + normal (0) + jogador 2 (16) = 19
    jal  draw_hand

    blt  $s0, 4, fim_atualizar_tela

    # --- JOGADOR 3: Canto Esquerdo (Cor 3 -> +24) ---
    addi $a0, $zero, 0        # X = 0
    addi $a1, $zero, 8        # Y = 8
    lw   $a2, 24($s2)         # Mão esquerda J3
    addi $a3, $zero, 25       # rot 1 (1) + normal (0) + jogador 3 (24) = 25
    jal  draw_hand

    addi $a0, $zero, 0        # X = 0
    addi $a1, $zero, 16       # Y = 16
    lw   $a2, 28($s2)         # Mão direita J3
    addi $a3, $zero, 29       # rot 1 (1) + espelhado (4) + jogador 3 (24) = 29
    jal  draw_hand

fim_atualizar_tela:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


alocar_vetor:
    addi $sp, $sp, -8
    sw   $t0, 0($sp)
    sw   $t1, 4($sp)

    li   $t1, 2
    mul  $t0, $a0, $t1
    
    # Reserva 4096 bytes para o framebuffer (0x10040000..0x10040FFF)
    sll  $a0, $t0, 2
    addi $a0, $a0, 4096
    
    li   $v0, 9
    syscall
    
    addi $v0, $v0, 4096

    lw   $t1, 4($sp)
    lw   $t0, 0($sp)
    addi $sp, $sp, 8
    jr   $ra


inicializar_vetor: 
    addi $sp, $sp, -8
    sw   $t0, 0($sp)
    sw   $t1, 4($sp)

    li   $t1, 2
    mul  $t0, $a0, $t1
    
    li   $t7, 1
    li   $t2, 0
loop:
    bge  $t2, $t0, endloop
    sll  $t3, $t2, 2
    add  $t4, $t3, $a1
    sw   $t7, 0($t4)
    addi $t2, $t2, 1
    j    loop
endloop:

    lw   $t1, 4($sp)
    lw   $t0, 0($sp)
    addi $sp, $sp, 8
    jr   $ra


calc_mao:
    addi $sp, $sp, -12
    sw   $t0, 0($sp)
    sw   $t1, 4($sp)
    sw   $t2, 8($sp)

    mul  $t0, $a0, 2 
    add  $t0, $t0, $a1
    sll  $t1, $t0, 2
    add  $t2, $a2, $t1
    move $v0, $t2

    lw   $t2, 8($sp)
    lw   $t1, 4($sp)
    lw   $t0, 0($sp)
    addi $sp, $sp, 12
    jr   $ra


imprimir_maos:
    addi $sp, $sp, -12
    sw   $ra, 0($sp)
    sw   $t2, 4($sp)
    sw   $t3, 8($sp)

    # --------------------- Esquerda ----------------------
    move $a0, $s4
    li   $a1, 0
    move $a2, $s2
    jal  calc_mao 
    move $t2, $v0
    
    la   $a0, str_esquerda
    li   $v0, 4
    syscall

    lw   $t3, 0($t2)
    move $a0, $t3
    li   $v0, 1
    syscall    
    
    # --------------------- Direita ------------------------
    move $a0, $s4
    li   $a1, 1
    move $a2, $s2
    jal  calc_mao 
    move $t2, $v0
    
    la   $a0, str_direita
    li   $v0, 4
    syscall

    lw   $t3, 0($t2)
    move $a0, $t3
    li   $v0, 1
    syscall    

    lw   $t3, 8($sp)
    lw   $t2, 4($sp)
    lw   $ra, 0($sp)
    addi $sp, $sp, 12
    jr   $ra


atacar:
    addi $sp, $sp, -16
    sw   $t0, 0($sp)
    sw   $t1, 4($sp)
    sw   $t2, 8($sp)
    sw   $t3, 12($sp)

    la   $a0, str5
    li   $v0, 4
    syscall
    
    li   $v0, 5                
    syscall
    move $t0, $v0
    
    la   $a0, str6
    li   $v0, 4
    syscall
    
    li   $v0, 5                
    syscall
    move $t1, $v0
    
    la   $a0, str7
    li   $v0, 4
    syscall
    
    li   $v0, 5                
    syscall
    move $t2, $v0
    
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    
    move $a0, $s4
    move $a1, $t0
    move $a2, $s2
    jal  calc_mao 
    move $t0, $v0
    lw   $t0, 0($t0)
    
    move $a0, $t1
    move $a1, $t2
    move $a2, $s2
    jal  calc_mao 
    move $t1, $v0
    lw   $t2, 0($t1)
    #MUDAR DE VOLTA DEPOIS DO DEBUG
    #era    add  $t2, $t2, $t0
    addi  $t2, $t2, 4
    li   $t3, 5
    div  $t2, $t3
    mfhi $t2
    sw   $t2, 0($t1)
    
    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    lw   $t3, 12($sp)
    lw   $t2, 8($sp)
    lw   $t1, 4($sp)
    lw   $t0, 0($sp)
    addi $sp, $sp, 16
    jr   $ra


checkIfSkip:

    # COLOCA COISAS NA PILHA
    addi $sp, $sp, -20
    sw   $ra, 0($sp)
    sw   $t2, 4($sp)
    sw   $t3, 8($sp)
    sw   $t4, 12($sp)
    sw   $t5, 16($sp)

    # --------------------- Esquerda ----------------------
    move $a0, $s4
    li   $a1, 0
    move $a2, $s2
    jal  calc_mao 
    move $t2, $v0
    li $t5, 0
    
    
    lw   $t3, 0($t2)
    slti $t4, $t3, 1
    add $t5, $t5, $t4
    
    # --------------------- Direita ------------------------
    move $a0, $s4
    li   $a1, 1
    move $a2, $s2
    jal  calc_mao 
    move $t2, $v0

    lw   $t3, 0($t2)
    slti $t4, $t3, 1
    add $t5, $t5, $t4
    
    li $t4, 1
    
    slt $t5, $t4, $t5 #1 = morto, 0 - vivo
    
    add $s4, $s4, $t5
    div  $s4, $s0
    mfhi $s4
    
    add $s5, $s5, $t5
    
    move $v0, $t5
    
    # RETORNA COISAS DA PILHA
    lw   $t5, 16($sp)
    lw   $t4, 12($sp)
    lw   $t3, 8($sp)
    lw   $t2, 4($sp)
    lw   $ra, 0($sp)
    addi $sp, $sp, 20
    jr   $ra
    
    #DEBUG
    #la   $a0, msgDebug
    #li   $v0, 4
    #syscall

    #li $v0, 1
    #move $a0, $s4
    #syscall
