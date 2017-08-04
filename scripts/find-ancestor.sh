#!/usr/bin/env bash

findAncestor() {
  # from: https://www.npmjs.com/package/find-config#algorithm
  # 1. If X/file.ext exists, return it. STOP
  # 2. If X/.dir/file.ext exists, return it. STOP
  # 3. If X has a parent directory, change X to parent. GO TO 1
  # 4. Return NULL.
  #

  [ -f "$1" ] && echo "$PWD/$1" && return 0
  [ -f ".dir/$1" ] && echo "$PWD/.dir/$1" && return 0
  [ "$PWD" = "/" ] && return 1
  # a subshell so that we don't affect the caller's $PWD
  (cd .. && findAncestor "$1")
}

findAncestor "$@"

