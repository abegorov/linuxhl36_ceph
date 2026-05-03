#!/bin/sh
export ANSIBLE_INVENTORY="inventory.yml"
PLAYBOOK="provision.yml"
ansible-playbook --diff "${PLAYBOOK}"
