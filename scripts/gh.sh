#!/usr/bin/bash

# Variáveis
read -p 'Digita o nome do repositorio: ' repository
#REPOSITORIO="nome-do-repositorio"

# Verifica se o repositório existe
if [ ! -d "$REPOSITORIO" ]; then
  echo "Repositório não encontrado!"
  exit 1
fi

# Entra no repositório
cd "$HOME/Franks/Projetos/Repository/$repository"

# Adiciona todas as alterações
git add --all

# Faz o commit
git commit -m "Commit automático"

# Envia para o GitHub
git push origin main
