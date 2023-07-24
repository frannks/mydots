#!/usr/bin/env bash

# Função para exibir as temperaturas e voltagens
show_sensors() {
    echo "=== Sensors Info ==="
    sensors
    echo "===================="
    sleep 5  # Tempo em segundos entre cada atualização
}

# Loop infinito para exibir as informações em loop
while true; do
    clear  # Limpa a tela antes de exibir as informações atualizadas
    show_sensors
done
