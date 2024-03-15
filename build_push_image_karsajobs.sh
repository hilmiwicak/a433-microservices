#!/usr/bin/env bash

# cek apakah variabel GITHUB_TOKEN sudah diexport atau belum
if [ -z "$GITHUB_TOKEN" ]; then

  # error message jika variabel GITHUB_TOKEN belum diexport
  echo "Empty \$GITHUB_TOKEN! Export them first with your github token!" >&2
  exit 1
else

  # membangun Dockerfile dengan tag hilmiwicak/karsajobs:latest
  docker build -t hilmiwicak/karsajobs:latest .
  echo -ne "\n"

  # tag image yang sudah dibuat dengan nama ghcr.io/hilmiwicak/karsajobs:latest
  docker image tag hilmiwicak/karsajobs:latest ghcr.io/hilmiwicak/karsajobs:latest
  echo -ne "\n"

  # login ke github container registry
  echo $GITHUB_TOKEN | docker login -u hilmiwicak --password-stdin ghcr.io
  echo -ne "\n"

  # push image ke github container registry
  docker push ghcr.io/hilmiwicak/karsajobs:latest
  echo -ne "\n"

fi
