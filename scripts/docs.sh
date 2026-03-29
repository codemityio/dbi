#!/bin/bash

set -e

# Note: the set [-/+] x is purely there to turn on and off outputting of the commands being executed.
if [ "${DEBUG}" = "true" ]; then
  set -x
fi

case "$1" in

"img")
  if [ -z "${PACKAGES}" ]; then
    packages=$(find "img" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
    targets=$(auxilium select --label="Choose img to generate documents for" --select-name-label="Target image" --list="${packages}")
    if [[ ${targets} == "" ]]; then exit 0; fi
  else
    targets=${PACKAGES}
  fi
  for target in ${targets//,/ }; do
    echo "img/${target}/..."
    notatio toc --document="img/${target}/README.md" --header="Table of contents" --limiter-left="##" --limiter-right="## Summary" --index=1 \
      int --start-from-level=1 --start-from-item=1
    docker run --rm \
      -v "${PWD}:${PWD}" \
      -w "${PWD}" \
      "${VENDOR}"/pandoc \
      --wrap=auto --columns=120 \
      --from=markdown-implicit_figures \
      --to=gfm --output="img/${target}/README.md" "img/${target}/README.md"
  done
  ;;

"main")
  packages=$(find "img" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
  paths=
  for target in ${packages//,/ }; do
    paths+=" --path=img/${target}/README.md"
  done
  output=$(make | sed 's/\x1b\[[0-9;]*m//g')
  notatio coi --command="make" --output="${output}" --document=README.md --header="\`make\`" --limiter-left="###" --limiter-right="### " --index=1
  notatio toc --document=README.md --header="Images" --limiter-left="##" --limiter-right="##" \
    ext --summary-header="Summary" --summary-limiter-left="##" --summary-limiter-right="##" ${paths}
  notatio toc --document=README.md --header="Table of contents" --limiter-right="## Summary" --index=1 \
    int --start-from-level=1 --start-from-item=1
  docker run --rm \
    -v "${PWD}:${PWD}" \
    -w "${PWD}" \
    "${VENDOR}"/pandoc \
    --wrap=auto --columns=120 \
    --from=markdown-implicit_figures \
    --to=gfm --output=README.md README.md
  ;;

*)
  echo "error: incorrect '$1' command..."
  ;;

esac
