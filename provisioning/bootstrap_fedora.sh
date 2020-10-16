#!/usr/bin/env bash
set -euo pipefail

echo "===================Install ansible================================================================="
sudo pkg install py36-ansible

# https://osquery.readthedocs.io/en/stable/installation/install-linux/#installing-osquery
# https://osquery.io/downloads/official/4.5.1
echo "====================Install osquery================================================================"
curl -L https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery
sudo yum-config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo
sudo yum-config-manager --enable osquery-s3-rpm
sudo yum install osquery -y
echo "===================================================================================="
