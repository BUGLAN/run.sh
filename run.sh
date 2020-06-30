#!/bin/bash

cmd=
config=~/.runrc
tmp=0
newline=$'\n'
ok=1

_build_in() {
  if [ "$1" = "config" ]; then
    vim ~/.runrc
    exit 0
fi

  if [ "$1" = "version" ]; then
    echo "v0.2.0"
    exit 0
  fi
}

_build_cmd() {
    # shellcheck disable=SC2162
  while read line; do
  if [ "[$1]" == "${line}" ]; then
      tmp=${ok}
      continue
  fi

  # shellcheck disable=SC2166
  if [ -n "${line}" -a "${tmp}" -eq "${ok}" ]; then
    if [ -n "${cmd}" ]; then
      cmd="${cmd}${newline}${line}"
    else
      cmd="${line}"
    fi
  fi

  # shellcheck disable=SC2166
  if [ -z "${line}" -a "${tmp}" = "${ok}" ]; then
    break
  fi

  done <${config}
  eval "${cmd}"
  exit 0
}

_build_in $*
_build_cmd $*

