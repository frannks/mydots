#!/bin/bash

# Define a URL da API
url="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=brl"

# Faz a solicitação e obtém a resposta
response=$(curl -s $url)

# Verifica se a resposta contém um erro
if echo "$response" | grep -q '"error"'; then
    echo "Erro ao obter cotação"
    exit 1
fi

# Obtém o preço do Bitcoin em BRL
price=$(echo "$response" | jq -r '.bitcoin.brl')

# Verifica se o preço é um número válido
if ! [[ "$price" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Preço inválido"
    exit 1
fi

# Formata o preço para o formato BRL com separadores
# Remove o ponto decimal e transforma em número inteiro
integer_part=$(echo "$price" | cut -d '.' -f 1)
decimal_part=$(echo "$price" | cut -d '.' -f 2 | cut -c1-2)

# Adiciona separador de milhar com pontos
formatted_integer=$(echo "$integer_part" | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')

# Concatena a parte inteira com a parte decimal
formatted_price="$formatted_integer,$decimal_part"

# Exibe o preço na Polybar
echo "BTC: R$ $formatted_price"
