#!/bin/bash

set -euo pipefail

# Note: the set [-/+] x is purely there to turn on and off outputting of the commands being executed.
if [ "${DEBUG}" = "true" ]; then
  set -x
fi

images=$(find img/*/ -maxdepth 0 -type d -exec basename {} \; | sort)

for target in ${images//,/ }; do
  docker image build \
    --target final \
    --build-arg VENDOR \
    -t "${VENDOR}/${target}:latest" \
    -f "img/${target}/Dockerfile" "img/${target}/."
done
