#!/bin/sh

if [ "${DEBUG}" = "true" ]; then
  set -x
fi

pandoc "$@"
