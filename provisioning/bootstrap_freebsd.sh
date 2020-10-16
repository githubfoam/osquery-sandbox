#!/usr/bin/env bash
set -euo pipefail

echo "===================Install ansible================================================================="
sudo pkg install py36-ansible

# https://osquery.readthedocs.io/en/stable/installation/install-freebsd/
echo "====================Install osquery================================================================"
# from ports
cd /usr/ports/sysutils/osquery && make install clean

# from binary package
# pkg install osquery

# using portmaster
# portmaster sysutils/osquery
echo "===================================================================================="
