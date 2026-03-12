#!/bin/bash

source scripts/func.sh

# Note: the set [-/+] x is purely there to turn on and off outputting of the commands being executed.
if [ "${DEBUG}" = "true" ]; then
  set -x
fi

case "$1" in

"tag")
  images=$(find img/*/ -maxdepth 0 -type d -exec basename {} \;)

  for target in ${images//,/ }; do
    name="${VENDOR}/${target}"

    version=$(./scripts/tools.sh version)

    docker tag "${name}":latest "${name}:${version}"
  done
  ;;

"push")
  images=$(find img/*/ -maxdepth 0 -type d -exec basename {} \;)
  for target in ${images//,/ }; do
    name="${VENDOR}/${target}"

    version=$(./scripts/tools.sh version)

    pushImage "${name}:latest"
    pushImage "${name}:${version}"
  done
  ;;

*)
  echo "error: incorrect '$1' command..."
  ;;

esac
