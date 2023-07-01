.data
    msg_input:    .asciiz "Insera um número: "
    msg_positivo: .asciiz "posítivo\n"
    msg_negativo: .asciiz "negativo\n"

.text

.globl main

main:

    li $v0, 5 # Lê uma valor int do usuário
    syscall

    add $t0, $zero, $v0

    slti $r1, $t0, 0 # if(input < 0) $r1 = 1 else, $r1 = 0
    beq $r1, $zero, then:

else:
    li $v0, 4               # imprime a mensagem de negativo
    la $a0, msg_negativo    # resgata o endereço da mensagem armazenada no .data
    syscall                 # chama o função que imprime

then:
    li $v0, 4
    la $a0, msg_positivo
    syscall


