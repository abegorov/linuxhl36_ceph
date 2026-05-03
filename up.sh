#!/bin/sh
set -eu
./update-tfvars.sh
terraform init -input=false
terraform apply -input=false -auto-approve
./provision.sh
