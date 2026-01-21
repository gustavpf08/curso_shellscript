#!/usr/bin/env bash

# Variáveis globais são comuns de serem postas em letra maiuscula
# Usando sem a formatação da string:
NOME="Gustavo Paulino"

echo $NOME

# Usando com a formatação da string, tendo um resultado
# diferente se chamar a variavel entre aspas
NOME="Gustavo 

Paulino"

echo "$NOME"

NUM1=18
NUM2=17
TOTAL=$(($NUM1 + $NUM2))

echo $TOTAL

SAIDA_FASTFETCH=$(fastfetch)
echo "$SAIDA_FASTFETCH"

echo "------------------------------------------"
echo "Parametro 1: $1"
echo "Parametro 2: $2"
echo "Parametro 3: $3"

# Reservados
echo "Todos os parâmetros: $*"
echo "Quantidade de parâmetros passados: $#"
echo "Exit code: $?"
echo "Número do PID: $$"
echo "Nome do script: $0"
