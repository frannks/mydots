#!/usr/bin/env bash

updateArch(){
    clear
    echo -e "Update Arch Linux\n\n"
    if arch_update_snapshot ; then
        echo -e "\n\n" && read -p 'Arch Linux atualizado com sucesso!!! PRESSIONE ENTER PARA SAIR...'
        clear && exit 0
    else
        read -p 'Erro ao atualizar o Arch Linux. Verifique o erro e tente novamente. PRESSIONE ENTER PARA SAIR...'

        exit 1
    fi
}

updateArch
