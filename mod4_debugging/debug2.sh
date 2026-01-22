#!/usr/bin/env bash

# Debug personalizado
# A ideia é criar níveis de debuggin que contenham mensagens diferentes a cada nível
CHAVE_DEBUG=0
NIVEL_DEBUG=0

function Debugar() {
  [[ $1 -le $NIVEL_DEBUG ]] && echo "Debug $* ======"
}

function Soma() {
  local total=0
  for i in $(seq 1 25); do
    Debugar 1 "Entrei no for com o valor $i"
    total=$(($total + $i))
    Debugar 2 "Valor do total depois do loop $i é de $total"
  done
}

case "$1" in
-d) [[ "$2" ]] && NIVEL_DEBUG="$2" ;;
*) Soma ;;
esac

Soma
