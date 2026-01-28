#!/usr/bin/env bash
#
#   Breakdown dos caracteres de controle:
#
#   - A ideia mostrada no curso é usar esses caracteres para poder colorir o programa para
#   facilitar a visualização de código.
#
#   - Fazemos esse uso das cores da seguinte forma:
#
#       ESC[codigo_cor1;codigo_cor2m
#
#       * Os caracteres de controle são "sequências de escape" com sequências reservadas
#       no bash. Nesse caso, temos que é necessário o uso de:
#
#           echo -e '\033['
#
#       * O '-e' torna possível justamente a leitura dessa sequência de caracteres
#       especiais reservados. Assim, podemos escolher as cores
#       e os comportamentos que queremos que o bash assuma, como por exemplo:
#
#       echo -e '\033[35;1;42mMensagem que irá aparecer formatada no terminal'
#
#           - Nesse caso, irá aparecer um texto da cor roxa (35), brilhante (1) e com um fundo
#           verde(42), encerrando a seleção das cores com o 'm'. Assim, testando o código, temos que:
#
echo -e '\033[35;1;42mMensagem que irá aparecer formatada no terminal\n'

#   Se aplicarmos essa ideia no código das aulas anteriores, teremos que:
ROXO_BRILHANTE='\033[35;1;42'
PRETO_FUNDO_BRANCO='\033[30;47m'
DEBUG=1

function Debug() {
  [[ "$DEBUG" -eq 1 ]] && echo -e "$2===== $* =====\n"
}

TXT="txt"
TXT="     $TXT     "
Debug "O valor da mensagem: [$TXT]" "${ROXO_BRILHANTE}"
TXT=$(echo "$TXT" | tr " " "!")
TXT=${TXT^^}
Debug "Verificando se trocou os espaços em branco por !: [$TXT]" "${PRETO_FUNDO_BRANCO}"
echo $TXT

# Dessa forma, podemos ter um controle melhor pela separação de como a mensagem de debug
# se comporta dentro do programa
