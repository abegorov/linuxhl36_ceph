#!/bin/sh
set -eu
HOST="${1}"
shift

ANSIBLE_HOST=$(yq ".[] | select(.hosts | has(\"${HOST}\")) |
  .hosts.${HOST}.ansible_host" inventory.yml)
SSH_USER=$(yq .all.vars.ansible_user inventory.yml)
SSH_KEY=$(yq .all.vars.ansible_ssh_private_key_file inventory.yml)
SSH_ARGS=$(yq .all.vars.ansible_ssh_common_args inventory.yml |
  sed 's/ -o ControlMaster=\S\+ -o ControlPersist=\S\+//')
eval ssh ${SSH_ARGS} \
  -i \'"${SSH_KEY}"\' -l \'"${SSH_USER}"\' \'"${ANSIBLE_HOST}"\' "$@"
