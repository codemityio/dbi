#!/bin/bash

source scripts/func.sh

# Note: the set [-/+] x is purely there to turn on and off outputting of the commands being executed.
if [ "${DEBUG}" = "true" ]; then
  set -x
fi

case "$1" in

"buildx")
  set -euo pipefail
  if [ -z "${IMAGES:-}" ]; then
    images=$(find img/*/ -maxdepth 0 -type d -exec basename {} \; | sort)
    if [[ ${images} == "" ]]; then exit 0; fi
  else
    images=${IMAGES}
  fi
  version=$(scripts/tools.sh version)
  for target in ${images//,/ }; do
    version_tag=()
    if [[ -n "${version}" ]]; then
      version_tag=(-t "${VENDOR}/${target}:${version}")
    fi
    docker buildx build \
      --platform linux/amd64,linux/arm64 \
      --target final \
      --build-arg VENDOR \
      -t "${VENDOR}/${target}:latest" \
      "${version_tag[@]}" \
      --push \
      -f "img/${target}/Dockerfile" "img/${target}/."
  done
  ;;

"build")
  set -euo pipefail
  if [ -z "${IMAGES:-}" ]; then
    images=$(find img/*/ -maxdepth 0 -type d -exec basename {} \; | sort)
    if [[ ${images} == "" ]]; then exit 0; fi
  else
    images=${IMAGES}
  fi
  version=$(scripts/tools.sh version)
  for target in ${images//,/ }; do
    version_tag=()
    if [[ -n "${version}" ]]; then
      version_tag=(-t "${VENDOR}/${target}:${version}")
    fi
    docker image build \
      --target final \
      --build-arg VENDOR \
      -t "${VENDOR}/${target}:latest" \
      "${version_tag[@]}" \
      -f "img/${target}/Dockerfile" "img/${target}/."
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
