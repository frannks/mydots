#!/usr/bin/env bash

# Franklin Souza
# @FranklinTech

clear
[ ! `command -v podman` ] && echo "podman não instalado, por favor faça a instalação" && exit 1

title(){
  SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga
  clear
  cat << Podman
██████╗  ██████╗ ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗
██╔══██╗██╔═══██╗██╔══██╗████╗ ████║██╔══██╗████╗  ██║
██████╔╝██║   ██║██║  ██║██╔████╔██║███████║██╔██╗ ██║
██╔═══╝ ██║   ██║██║  ██║██║╚██╔╝██║██╔══██║██║╚██╗██║
██║     ╚██████╔╝██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║
╚═╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                    
Podman
}


main(){
  clear
  title && printf "\n\nEscolha uma das opções abaixo:\n\n[01] - Proucurar por imagens\n[02] - Listar imagens\n[03] - Download imagem\n[04] - Remover containers\n[05] - Logs\n[06] - Executar imagem\n[07] - Gerenciar containers\n[08] - Dockerfile\n[09] - Imagens\n[10] - Sair\n\n"
  read OPTION_CHOICE

  if [ $OPTION_CHOICE == '1' ] || [ $OPTION_CHOICE == '01' ] ; then
    images_search

  elif [ $OPTION_CHOICE == '2' ] || [ $OPTION_CHOICE == '02' ] ; then
    image_list

  elif [ $OPTION_CHOICE == '3' ] || [ $OPTION_CHOICE == '03' ] ; then
    image_down

  elif [ $OPTION_CHOICE == '4' ] || [ $OPTION_CHOICE == '04' ] ; then
    containers_del

  elif [ $OPTION_CHOICE == '5' ] || [ $OPTION_CHOICE == '05' ] ; then
    logsPodman

  elif [ $OPTION_CHOICE == '6' ] || [ $OPTION_CHOICE == '06' ] ; then
    image_run

  elif [ $OPTION_CHOICE == '7' ] || [ $OPTION_CHOICE == '07' ] ; then
    PodmanManager

  elif [ $OPTION_CHOICE == '8' ] || [ $OPTION_CHOICE == '08' ] ; then
  dockerFILE
  
  elif [ $OPTION_CHOICE == '9' ] || [ $OPTION_CHOICE == '09' ] ; then
    imagesDel

  elif [ $OPTION_CHOICE == '10' ] || [ $OPTION_CHOICE == '09' ] ; then
    quitPodman

  else
    clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

images_search(){
  #clear
  #printf "https://hub.docker.com/search?image_filter=official&q=&type=image"
  #printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  clear && printf "Deseja ter somente a imagem oficial? [y/n]:\n\n"
  read IMG_OFC
  if [ $IMG_OFC == 'y' ] || [ $IMG_OFC == 'Y' ] || [ $IMG_OFC == 'yes' ] || [ $IMG_OFC == 'YES' ] || [ $IMG_OFC == 'Yes' ] ; then
    clear
    printf "Digite o nome da imagem (letra minuscula):\n\n"
    read IMAGE_SEARCH
    podman search "$IMAGE_SEARCH" --filter=is-official
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $IMG_OFC == 'n' ] || [ $IMG_OFC == 'N' ] || [ $IMG_OFC == 'no' ] || [ $IMG_OFC == 'NO' ] || [ $IMG_OFC == 'No' ] ; then
    clear
    printf "Digite o nome da imagem (letra minuscula):\n\n"
    read IMAGE_SEARCH
    podman search "$IMAGE_SEARCH"
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  else
    read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

image_list(){
  clear
  podman ps -a && printf "\n\n" && podman images
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

image_down(){
  clear
  printf "Cole o nome da imagem abaixo:\n\n"
  read IMAGE_NAME
  printf "\n\nDigite o número da porta (ex: 8080:80):\n\n"
  read PORT_NUMBER
  podman run -dt -p "$PORT_NUMBER" "$IMAGE_NAME" && notify-send 'Imagem baixada com sucesso!!!' && mpv $SOUND
  clear && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

containers_del(){
  clear
  printf "Escolha uma das opções abaxio:\n\n[1] - Deseja apagar somente 1 container\n[2] - Deseja apagar tudo?\n[3] - Voltar\n\n"
  read CONTAINER_DEL
  if [ $CONTAINER_DEL == '1' ] || [ $CONTAINER_DEL == '01' ] ; then
    clear
    printf "Cole abaixo o ID do container que deseja apagar:\n\n"
    podman ps -a && printf "\n\n"
    read CONTAINER_ID
    podman stop "$CONTAINER_ID"
    podman rm -f "$CONTAINER_ID"  && notify-send 'Container deletado com sucesso!!!' && mpv $SOUND
    clear && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CONTAINER_DEL == '2' ] || [ $CONTAINER_DEL == '02' ] ; then
    clear
    printf "Pressione 'y' para apagar tudo:\n\n"
    podman system reset && notify-send 'Todos os containers deletados com sucesso!!!' && mpv $SOUND
    clear && printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CONTAINER_DEL == '3' ] || [ $CONTAINER_DEL == '03' ] ; then
    clear && main
  else
    clear && read -p 'Opção inexistente, por favor tente novamente...' && containers_del
  fi
}

logsPodman(){
  clear
  printf "Cole abaixo o ID do container que você deseja ver o log:\n\n"
  read LOG_ID
  podman logs -f "$LOG_ID"
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

image_run(){
  clear
  printf "Cole abaixo o ID da imagem para executar no terminal:\n\n"
  podman ps -a && printf "\n\n"
  read IMAGE_RUN
  clear
  printf "Escolha qual SHELL deseja usar:\n\n[1] - sh\n[2] - bash\n[3] - zsh\n[4] - Voltar\n\n"
  read CHOICE_SHELL
  if [ $CHOICE_SHELL == '1' ] || [ $CHOICE_SHELL == '01' ] ; then
    clear
    podman exec -ti "$IMAGE_RUN" sh
    clear && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CHOICE_SHELL == '2' ] || [ $CHOICE_SHELL == '02' ] ; then
    clear
    podman exec -ti "$IMAGE_RUN" bash
    clear && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CHOICE_SHELL == '3' ] || [ $CHOICE_SHELL == '03' ] ; then
    clear
    podman exec -ti "$IMAGE_RUN" zsh
    clear && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CHOICE_SHELL == '4' ] || [ $CHOICE_SHELL == '04' ] ; then
    clear && main

  else
    clear
    read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && image_run
  fi
}

PodmanManager(){
  clear
  printf "Escolha uma das opções abaixo:\n\n[1] - Start\n[2] - Stop\n[3] - Pause\n[4] - Unpause\n\n"
  read MANAGER_PODMAN

  if [ $MANAGER_PODMAN == '1' ] || [ $MANAGER_PODMAN == '01' ] ; then
    clear
    printf "Deseja usar o start em todos os containers? [y/n]\n\n"
    read SELECT_PODMAN
    
    if [ $SELECT_PODMAN == 'y' ] || [ $SELECT_PODMAN == 'Y' ] || [ $SELECT_PODMAN == 'yes' ] || [ $SELECT_PODMAN == 'YES' ] || [ $SELECT_PODMAN == 'Yes' ] ; then
      clear
      podman start --all
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

    elif [ $SELECT_PODMAN == 'n' ] || [ $SELECT_PODMAN == 'N' ] || [ $SELECT_PODMAN == 'no' ] || [ $SELECT_PODMAN == 'NO' ] || [ $SELECT_PODMAN == 'No' ] ; then
      clear
      printf "Cole aqui a ID do container que deseja usar o start:\n\n"
      podman ps -a && printf "\n\n" && podman images && printf "\n\n"
      read PODMAN_START
      podman start "$PODMAN_START"
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
    fi

  elif [ $MANAGER_PODMAN == '2' ] || [ $MANAGER_PODMAN == '02' ] ; then
    clear
    printf "Deseja usar o stop em todos os containers? [y/n]\n\n"
    read SELECT_PODMAN1
    
    if [ $SELECT_PODMAN1 == 'y' ] || [ $SELECT_PODMAN1 == 'Y' ] || [ $SELECT_PODMAN1 == 'yes' ] || [ $SELECT_PODMAN1 == 'YES' ] || [ $SELECT_PODMAN1 == 'Yes' ] ; then
      clear
      podman stop -a
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
      
    elif [ $SELECT_PODMAN1 == 'n' ] || [ $SELECT_PODMAN1 == 'N' ] || [ $SELECT_PODMAN1 == 'no' ] || [ $SELECT_PODMAN1 == 'NO' ] || [ $SELECT_PODMAN1 == 'No' ] ; then
      clear
      printf "Cole aqui a ID do container que deseja usar o stop:\n\n"
      podman ps -a && printf "\n\n" && printf "\n\n" && podman images && printf "\n\n"
      read PODMAN_STOP
      podman stop "$PODMAN_STOP"
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
    
    else
      clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
    fi

  elif [ $MANAGER_PODMAN == '3' ] || [ $MANAGER_PODMAN == '03' ] ; then
    clear
    printf "Deseja usar o pause em todos os containers? [y/n]\n\n"
    read PAUSE_CONTAINERS

    if [ $PAUSE_CONTAINERS == 'y' ] || [ $PAUSE_CONTAINERS == 'Y' ] || [ $PAUSE_CONTAINERS == 'yes' ] || [ $PAUSE_CONTAINERS == 'YES' ] || [ $PAUSE_CONTAINERS == 'Yes' ] ; then
      clear
      podman pause -a
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

    elif [ $PAUSE_CONTAINERS == 'n' ] || [ $PAUSE_CONTAINERS == 'N' ] || [ $PAUSE_CONTAINERS == 'no' ] || [ $PAUSE_CONTAINERS == 'NO' ] || [ $PAUSE_CONTAINERS == 'YES' ] ; then
      clear
      printf "Cole aqui o ID do container que deseja usar o pause:\n\n"
      podman ps -a && printf "\n\n" && printf "\n\n" && podman images && printf "\n\n"
      read PAUSE_CONTAINER
      podman pause "$PAUSE_CONTAINER"
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
    fi
  
  elif [ $MANAGER_PODMAN == '4' ] || [ $MANAGER_PODMAN == '04' ] ; then
    clear
    printf "Deseja usar o unpause em todos os containers? [y/n]\n\n"
    read UNPAUSE_CONTAINERS

    if [ $UNPAUSE_CONTAINERS == 'y' ] || [ $UNPAUSE_CONTAINERS == 'Y' ] || [ $UNPAUSE_CONTAINERS == 'yes' ] || [ $UNPAUSE_CONTAINERS == 'YES' ] || [ $UNPAUSE_CONTAINERS == 'Yes' ] ; then
      clear
      podman unpause -a
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

    elif [ $UNPAUSE_CONTAINERS == 'n' ] || [ $UNPAUSE_CONTAINERS == 'N' ] || [ $UNPAUSE_CONTAINERS == 'no' ] || [ $UNPAUSE_CONTAINERS == 'NO' ] || [ $UNPAUSE_CONTAINERS == 'No' ] ; then
      clear
      printf "Cole aqui o ID do container que deseja usar o unpause:\n\n"
      podman ps -a && printf "\n\n" && printf "\n\n" && podman images && printf "\n\n"
      read UNPAUSE_CONTAINER
      podman unpause "$UNPAUSE_CONTAINER"
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
    fi
  
  else
    clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

dockerFILE(){
  clear
  DIRECTORY="$HOME/Franks/Projetos/Dockerfiles"
  if [ ! -d "$DIRECTORY "] ; then
    mkdir -p $HOME/Franks/Projetos/Dockerfiles
  else
    clear
  fi
  printf "Escolha uma opção abaixo\n\n[1] - Criar Dockerfile\n[2] - Buildar Dockerfile\n[3] - Excluir\n[4] - Editar Dockerfiles\n[5] - Voltar\n\n"
  read POD_OPTION
  if [ $POD_OPTION == '1' ] || [ $POD_OPTION == '01' ] ; then
    clear && cd $HOME/Franks/Projetos/Dockerfiles
    printf "Digite um nome para a pasta:\n\n"
    read FOLDER_NAME
    mkdir "$HOME/Franks/Projetos/Dockerfiles/"$FOLDER_NAME""
    cd "$HOME/Franks/Projetos/Dockerfiles/"$FOLDER_NAME"" && nvim Dockerfile && dockerFILE
    
  elif [ $POD_OPTION == '2' ] || [ $POD_OPTION == '02' ] ; then
    clear
    cd "$DIRECTORY" && ls && printf "Escolha qual pasta acessar\n\n"
    read FOLDER_ACESS
    clear && printf "Digite o nome da sua imagem:\n\n"
    read IMAGE_NAME
    cd "$DIRECTORY" && podman build -t "$IMAGE_NAME":latest "$FOLDER_ACESS" && dockerFILE

  elif [ $POD_OPTION == '3' ] || [ $POD_OPTION == '03' ] ; then
    clear
    printf "Escolha uma opção:\n\n[1] - Apagar tudo\n[2] - Remover somente uma pasta\n[3] - Voltar\n\n"
    read REMOVE_DOCKERFILE
    if [ $REMOVE_DOCKERFILE == '1' ] || [ $REMOVE_DOCKERFILE == '01' ] ; then
      clear
      cd "$DIRECTORY" && rm -rf * && cd && dockerFILE

    elif [ $REMOVE_DOCKERFILE == '2' ] || [ $REMOVE_DOCKERFILE == '02' ] ; then
      clear
      cd "$DIRECTORY" && ls && printf "\nDigite abaixo o nome da pasta que deseja remover\n\n"
      read FOLDER_REMOVE
      cd "$DIRECTORY" && rm -rf "$FOLDER_REMOVE" && dockerFILE
    
    elif [ $REMOVE_DOCKERFILE == '3' ] || [ $REMOVE_DOCKERFILE == '03' ] ; then
      main
    else
      clear && read -p 'Opção inexistente, por favor tente novamente...' && dockerFILE
    fi
  elif [ $POD_OPTION == '4' ] || [ $POD_OPTION == '04' ] ; then
    clear
    cd "$DIRECTORY" && ls && printf "\nDigite abaixo a pasta que deseja editar o Dockerfile:\n\n"
    read DOCKERFILE_EDIT
    nvim "$DOCKERFILE_EDIT/Dockerfile" && dockerFILE

  elif [ $POD_OPTION == '5' ] || [ $POD_OPTION == '05' ] ; then
    clear && main
  else
    clear && read -p 'Opção inexistente, por favor tente novamente...' && dockerFILE
  fi
}

imagesDel(){
  clear && printf "Escolha uma das opções:\n\n[1] - Apagar todas as imagens\n[2] - Remover apenas uma imagem\n[3] - Executar uma imagem\n[4] - Subir imagem GUI\n[5] - Voltar\n\n"
  read IMAGES_DEL
  if [ $IMAGES_DEL == '1' ] || [ $IMAGES_DEL '01' ] ; then
    clear
    podman rmi -a && main

  elif [ $IMAGES_DEL == '2' ] || [ $IMAGES_DEL == '02' ] ; then
    clear
    podman images && printf "\n\nDigite abaixo o nome da imagem que você deseja remover:\n\n"
    read REMOVE_IMAGE
    podman rmi "$REMOVE_IMAGE" && main

  elif [ $IMAGES_DEL == '3' ] || [ $IMAGES_DEL == '03' ] ; then
    clear && podman images && printf "\n\nDigite abaixo o nome da imagem que você deseja executar:\n\n"
    read IMAGERUN
    podman run -it "$IMAGERUN" && main

  elif [ $IMAGES_DEL == '4' ] || [ $IMAGES_DEL == '04' ] ; then
    clear && xhost + && podman ps -a && printf "\n\n" && podman images
    printf "\n\nDigite abaixo o nome da imagem para subir a GUI:\n\n"
    read GUI_IMAGE
    clear && podman run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix "$GUI_IMAGE" && main
  
  elif [ $IMAGES_DEL == '5' ] || [ $IMAGES_DEL == '05' ] ; then
    main
  else
    clear && read -p 'Opção inexistente, por favor tente novamente...' && imagesDel
  fi
}

quitPodman(){
  clear && exit 0
}
main
