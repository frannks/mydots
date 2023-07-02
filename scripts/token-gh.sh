#!/usr/bin/env bash

clear
printf "Digite o PATH onde deseja clonar o repositório (Ex: /home/user/repo/):\n\n"
read PATH_CLONE
printf "\n\nCole abaixo o seu token do github:\n\n"
read TOKEN
printf "\n\nDigite logo abaixo o user do seu github:\n\n"
read GITHUB_USER
printf "\n\nAgora digite o repositório que deseja clonar (Ex: repository.git):\n\n"
read REPO

cd "$PATH_CLONE" && git clone https://"$TOKEN":x-oauth-basic@github.com/"$GITHUB_USER"/"$REPO"
