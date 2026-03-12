#!/bin/bash

# Note: the set [-/+] x is purely there to turn on and off outputting of the commands being executed.
if [ "${DEBUG}" = "true" ]; then
  set -x
fi

case "$1" in

"main")
  notatio toc --document=README.md --header="Table of contents" --limiter-right="## Summary" int
  pandoc \
    --wrap=auto --columns=120 \
    --from=markdown-implicit_figures \
    --to=gfm --output=README.md README.md
  ;;

*)
  echo "error: incorrect '$1' command..."
  ;;

esac
