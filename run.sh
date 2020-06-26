#!/bin/bash

cmd=
config=~/.runrc
tmp=0
newline=$'\n'
ok=1

if [ "$1" = "config" ]; then
    vim ~/.runrc
    exit 0
fi

if [ "$1" = "version" ]; then
  echo "v0.1.0"
fi

# shellcheck disable=SC2162
while read line; do
if [ "[$1]" == "${line}" ]; then
    tmp=${ok}
    continue
fi

# shellcheck disable=SC2166
if [ -n "${line}" -a "${tmp}" = "${ok}" ]; then
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