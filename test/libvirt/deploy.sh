#!/bin/bash
#. installrc
set -e
./generate_assets.sh
./terraform_provision.sh
echo "sleeping 20"
sleep 20
./rhel_setup.sh
openshift-install create ignition-configs
./run_ansible.sh
