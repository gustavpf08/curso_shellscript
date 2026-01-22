#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai usuários do /etc/passwd
#
# Autor:      Gustavo Paulino
# Manutenção: Gustavo Paulino
#
# ------------------------------------------------------------------------ #
#  Este programa irá extrair os usuários do /etc/passwd, podendo listá-los
#  em maiúsculo ou em ordem alfabética.
#
#  Exemplos:
#      $ ./listaUsuarios.sh -s -m
#      Neste exemplo, o script ficará em maiúsculo e em ordem alfabética
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 21/01/2026, Gustavo:
#     - Adição dos parâmetros -h, -v, -m e -a
#   v1.1 21/01/2026, Gustavo:
#     - Refactor do código adicionando chave ou flags.
#   v1.2 21/01/2026, Gustavo:
#     - Adicionando combinação de parâmetros, tendo comportamentos em conjunto.
#   v1.3 22/02/2026, Gustavo:
#     - Refactor do valor da versão do programa, aparecendo dinamicamente para o usuário.
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.2.37
# ------------------------------- VARIÁVEIS ----------------------------------------- #

USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO=("
  $(basename $0) - [OPÇÕES]
  
  -h - Menu de ajuda
  -v - Versão
  -s - Letra maiúscula
  -m - Ordem Alfabética
")
VERSAO=$(grep "^#   v" key_flags.sh | cut -d " " -f 4 | tail -n 1)
CHAVE_MAIUSCULO=0
CHAVE_ORDEM=0

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# O shift desloca os próximos parâmetros para a primeira posição.
while test -n "$1"; do
  case "$1" in
  -h) echo "$MENSAGEM_USO" && exit 0 ;;
  -v) echo "$VERSAO" && exit 0 ;;
  -m) CHAVE_MAIUSCULO=1 ;;
  -a) CHAVE_ORDEM=1 ;;
  *) echo "Opção inválida. Valide no -h." && exit 1 ;;
  esac
  shift
done
# ------------------------------------------------------------------------ #

[[ $CHAVE_MAIUSCULO -eq 1 ]] && USUARIOS=$(echo "${USUARIOS^^}")
[[ $CHAVE_ORDEM -eq 1 ]] && USUARIOS=$(echo "$USUARIOS" | sort)

echo "$USUARIOS"
