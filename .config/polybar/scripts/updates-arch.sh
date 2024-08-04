#!/usr/bin/env bash

# Verificar atualizações dos repositórios oficiais
if ! updates_official=$(checkupdates 2> /dev/null | wc -l); then
    updates_official=0
fi

# Verificar atualizações do AUR
if ! updates_aur=$(paru -Qua 2> /dev/null | wc -l); then
    updates_aur=0
fi

# Exibir o número de atualizações disponíveis
if [ "$updates_official" -gt 0 ] || [ "$updates_aur" -gt 0 ]; then
    echo "  $updates_official/$updates_aur "
else
    echo "  No updates"
fi

