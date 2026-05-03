#!/bin/sh
set -eu

PROJECT=vault
ZONE=ru-central1-d

TOKEN=$(yc iam create-token)
CLOUD_ID=$(yc config get cloud-id)
FOLDER_ID=$(yc config get folder-id)

SSH_USERNAME=ansible
SSH_KEY_FILE=secrets/yandex-cloud


test -f "${SSH_KEY_FILE}" || \
  ssh-keygen -q -t ed25519 -f "${SSH_KEY_FILE}" -C terraform -N ''
cat <<EOF > "terraform.tfvars"
project      = "${PROJECT}"
token        = "${TOKEN}"
cloud_id     = "${CLOUD_ID}"
folder_id    = "${FOLDER_ID}"
zone         = "${ZONE}"
ssh_username = "${SSH_USERNAME}"
ssh_key_file = "${SSH_KEY_FILE}"
EOF
