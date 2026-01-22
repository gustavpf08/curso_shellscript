#!/usr/bin/env bash
#
# Forma de debuggin passo a passo - conteúdo visto fora do curso
#
# Podemos usar um debug para esperar que o usuário digite enter para que a execução
# do programa seja continuada. Muito útil para quando não soubermos em que parte o programa
# falha.

set -x          # Liga o debug de comandos
trap read DEBUG # Liga o passo a passo
txt="txt"
txt="     $txt     "
txt=$(echo "$txt" | tr " " "!")
trap "" DEBUG # Desliga o passo a passo
set +x
txt=${txt^^}
echo -e "$txt\n"

# Fazendo um debug personalizado
# Nesse caso, caso queiramos desligar o debugger é só trocar a variável $DEBUG para 0

DEBUG=1
function Debug() {
  [[ "$DEBUG" -eq 1 ]] && echo "===== $* ====="
}

txt="txt"
txt="     $txt     "
Debug "O valor da mensagem: [$txt]"
txt=$(echo "$txt" | tr " " "!")
Debug "Verificando se trocou os espaços em branco por !: [$txt]"
txt=${txt^^}
echo $txt
