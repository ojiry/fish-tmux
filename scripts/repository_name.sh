#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

repository_name() {
  repo_name="$(
    git config --get remote.origin.url \
      | grep github.com \
      | sed 's/^.*github\.com[:\/]\(.*\)\.git$/\1/' \
      | tr -d '\n'
  )"

  if [ -n "$repo_name" ]; then
    printf $repo_name
  else
    printf `basename $SHELL`
  fi
}

main() {
  repository_name
}
main
