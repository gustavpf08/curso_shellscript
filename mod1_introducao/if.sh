#!/usr/bin/env bash

VAR_1=""
VAR_2="1"

if [[ "$VAR_1" = "$VAR_2" ]]; then
  echo "São iguais"
fi

if [ "$VAR_1" = "$VAR_2" ]; then
  echo "são iguais"
fi

# A diferença entre o colchetes duplos e o simples é que o
# duplo suporta expressões regulares e não realiza word splitting
# De um modo geral, é preferível usar com colchetes duplos.

# Esse modo com o "test" é um alias para o uso de colchetes simples
if test "$VAR_1" = "$VAR_2"; then
  echo "São iguais"
fi

# Forma mais clean de escrever if statements quando uma única coisa
# executará no bloco
# Usamos "&&" para condições verdadeiras e "||" para condições falsas
[[ "$VAR_1" = "$VAR_2" ]] && echo "São iguais"
[[ "$VAR_1" = "$VAR_2" ]] || echo "Não são iguais"

# Desafio proposto pelo professor
[[ "$1" > 10 ]] && echo -e "\nNome do arquivo: $0 e PID: $$"
