#!/usr/bin/env bash

# cek apakah variabel GH_TOKEN sudah diexport atau belum
if [ -z "$GH_TOKEN" ]; then

  # error message jika variabel GH_TOKEN belum diexport
  echo "Empty \$GH_TOKEN! Export them first with your github token!" >&2
  exit 1

else

  # membangun Dockerfile dengan tag ghcr.io/hilmiwicak/order-service:v1
  docker build -t ghcr.io/hilmiwicak/shipping-service:latest .
  echo -ne "\n"

  # login ke github container registry
  echo $GH_TOKEN | docker login -u hilmiwicak --password-stdin ghcr.io
  echo -ne "\n"

  # push image ke github container registry
  docker push ghcr.io/hilmiwicak/shipping-service:latest
  echo -ne "\n"

fi
