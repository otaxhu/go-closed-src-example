#!/usr/bin/env bash
set -e

mkdir -p build

function go-tool-compile-pkg() {
  local importpath=$1
  local pkg=$(basename $importpath)
  local out=$(realpath .)/$importpath.a
  go tool compile -p $importpath -I $(realpath .) -pack -o $out $(realpath .)/$importpath/*.go
}

function go-tool-compile-main() {
  local importpath=$1
  local pkg=$(basename $importpath)
  local out=$(realpath .)/$importpath.a
  # Deleted -p flag, automatically set to main if is a main package
  go tool compile -I $(realpath .) -pack -o $out $(realpath .)/$importpath/*.go
}

function go-tool-link-pkg() {
  local importpath=$1
  local pkg=$(basename $importpath)
  local out=$2
  go tool link -o $out -L $(realpath .) $(realpath .)/$importpath.a
}

go-tool-compile-pkg github.com/otaxhu/closed_src/closed_src
go-tool-compile-pkg github.com/otaxhu/closed_src/interfaces
go-tool-compile-main github.com/otaxhu/closed_src/cmd
go-tool-link-pkg github.com/otaxhu/closed_src/cmd build/main
