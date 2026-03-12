#!/bin/bash

pushImage() {
  local image="$1"

  # strip tag
  local repo_with_namespace="${image%%:*}"

  # extract namespace and repo
  local namespace="${repo_with_namespace%%/*}"
  local repo="${repo_with_namespace#*/}"

  # check repository exists in Docker Hub
  if ! curl -fsSL "https://hub.docker.com/v2/repositories/${namespace}/${repo}/" >/dev/null 2>&1; then
    echo "error: Docker Hub repository does not exist: ${namespace}/${repo}"
    exit 1
  fi

  echo "pushing ${image}..."
  docker push "${image}"
}
