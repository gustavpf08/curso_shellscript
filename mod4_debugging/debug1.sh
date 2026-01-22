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
#     - Refactor da versão do programa final do curso, extraindo dinamicamente o valor
#     pelo cabeçalho do programa.
#   v1.4 22/02/2026, Gustavo:
#     - Reconfigurando o sistema de opções, adicionando "--help", "--version", "--uppercase" e
#   "--alphabetic".
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.2.37
# ------------------------------- VARIÁVEIS ----------------------------------------- #

CHAVE_MAIUSCULO=0
CHAVE_ORDEM=0
VERSAO=$(grep "^#   v" key_flags.sh | cut -d " " -f 4 | tail -n 1)
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO=("
  $(basename $0) - [OPÇÕES]
  
  -h, --help       Menu de ajuda
  -v, --version    Versão
  -u, --uppercase  Letra maiúscula
  -a, --alphabetic Ordem Alfabética
")

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# O shift remove o primeiro parâmetro, deslocando os outros parâmetros para uma posição a menos.
while test -n "$1"; do
  case "$1" in
  -h | --help) echo "$MENSAGEM_USO" && exit 0 ;;
  -v | --version) echo "$VERSAO" && exit 0 ;;
  -a | --alphabetic) CHAVE_MAIUSCULO=1 ;;
  -u | --uppercase) CHAVE_ORDEM=1 ;;
  *) echo "Opção inválida: $1." && exit 1 ;;
  esac
  shift
done
# ------------------------------------------------------------------------ #

[[ $CHAVE_MAIUSCULO -eq 1 ]] && USUARIOS=$(echo "${USUARIOS^^}")
[[ $CHAVE_ORDEM -eq 1 ]] && USUARIOS=$(echo "$USUARIOS" | sort)

echo "$USUARIOS"

# Para debugging, podemos usar o comando bash com os seguintes parâmetros:
#
#   -x, para mostrar a saída das variáveis mudando de valor ao longo do código
#   -v, mostra todo código e apenas a sua saída, não mostrando os valores que as variáveis assumem.
#
#     ** Juntos eles mostram a mudança dos valores das variáveis juntamente com a
#     parte do código que modifica elas. **
#
#   Temos outros parâmetros também, como o "bash -n" que testa se há algum erro de sintaxe no programa.
#
# Outra forma de debugging seria usar o "set" dentro do código, delimitando a parte que será
# executada no debugging
#
#    set -x
#       {bloco de código aqui}
#       {que queremos debugar}
#    set +x
