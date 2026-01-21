#!/usr/bin/env bash

echo "===== For 1 (for simples) ====="
for ((i = 0; i < 10; i++)); do
  echo "$i"
done

echo -e "\n===== For 2 (usando o seq) ====="
for i in $(seq 10); do
  echo $i
done

echo -e "\n===== For 3 (usando a length de um array) ====="

MARCAS=(
  'Samsung'
  'Motorola'
  'Xiaomi'
  'Apple'
)

# Como se fosse um forEach
for i in "${MARCAS[@]}"; do
  echo $i
done

echo -e "\n===== For 4 (usando While) ====="

CONTADOR=0
while [[ $CONTADOR -lt ${#MARCAS[@]} ]]; do
  echo ${MARCAS[$CONTADOR]}
  CONTADOR=$(($CONTADOR + 1))
done

# O ${MARCAS[@]} serve como forEach e ${#MARCAS[@]} serve para pegar a length do array

# Desafio proposto pelo professor
echo ""
for i in $(seq 0 10); do
  [[ $(($i % 2)) -eq 0 ]] && echo -e "O número $i é divisível por 2"
done
