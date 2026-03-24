#!/bin/bash

# Note: the set [-/+] x is purely there to turn on and off outputting of the commands being executed.
if [ "${DEBUG}" = "true" ]; then
  set -x
fi

case "$1" in

"prep")
  go install github.com/"${VENDOR}"/notatio@latest
  ;;

"diff")
  (git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]) || {
    echo "error: changes detected..."
    exit 1
  }
  ;;

"version")
  git tag -l | sort -V | tail -n1
  ;;

"next")
  # get latest v-tag (supports vX.Y.Z and vX.Y.Z-preN) and bump prerelease or patch
  latest=$(git tag -l "v*" | sort -V | tail -n1)

  if [[ $latest =~ ^v([0-9]+\.[0-9]+\.[0-9]+)-([a-zA-Z]+)([0-9]+)$ ]]; then
    next="v${BASH_REMATCH[1]}-${BASH_REMATCH[2]}$((BASH_REMATCH[3] + 1))"
  elif [[ $latest =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
    next="v${BASH_REMATCH[1]}.${BASH_REMATCH[2]}.$((BASH_REMATCH[3] + 1))"
  else
    echo "error: unsupported tag format: $latest"
    exit 1
  fi

  git tag "$next"
  echo "Tagged: $next"
  ;;

*)
  echo "error: incorrect '$1' command..."
  ;;

esac
