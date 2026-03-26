#!/bin/sh

if [ "${DEBUG}" = "true" ]; then
  set -x
fi

if [ -n "${GOBIN}" ]; then
  export PATH="${PATH}:${GOBIN}"
fi

git config --global --add safe.directory "${PWD}"

"$@"
