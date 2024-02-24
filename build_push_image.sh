#!/usr/bin/env bash

# cek apakah variabel GITHUB_TOKEN sudah diexport atau belum
if [ -z "$GITHUB_TOKEN" ]; then

  # error message jika variabel GITHUB_TOKEN belum diexport
  echo "Empty \$GITHUB_TOKEN! Export them first with your github token!" >&2
  exit 1

else

  # membangun Dockerfile dengan tag item-app:v1
  docker build -t item-app:v1 .
  echo -ne "\n"

  # menampilkan daftar image yang sudah dibuat
  docker image ls
  echo -ne "\n"

  # tag image yang sudah dibuat dengan nama ghcr.io/hilmiwicak/item-app:v1
  docker image tag item-app:v1 ghcr.io/hilmiwicak/item-app:v1
  echo -ne "\n"

  # login ke github container registry
  echo $GITHUB_TOKEN | docker login -u hilmiwicak --password-stdin ghcr.io
  echo -ne "\n"

  # push image ke github container registry
  docker push ghcr.io/hilmiwicak/item-app:v1
  echo -ne "\n"

fi
