#!/bin/bash

# Nome do contêiner temporário
CONTAINER_NAME="backup-container"

# Volumes a serem copiados
VOLUMES="jenkins_data/"

# Diretório de destino do backup
BACKUP_DIR="/home/rodrigo/devops"

# Criar contêiner temporário
docker create --name $CONTAINER_NAME $(for volume in ${VOLUMES[@]}; do echo "-v $volume:$volume"; done)

# Copiar dados do volume
for volume in ${VOLUMES[@]}; do
  docker cp $CONTAINER_NAME:$volume $BACKUP_DIR/$volume
done

# Remover contêiner temporário
docker rm $CONTAINER_NAME
