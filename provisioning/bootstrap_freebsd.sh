#!/usr/bin/env bash
set -euo pipefail

# echo "===================Install ansible================================================================="
# sudo pkg install py36-ansible
# sudo pkg install py36-ansible
# https://osquery.readthedocs.io/en/stable/installation/install-freebsd/
echo "====================Install osquery================================================================"

# https://www.freebsd.org/doc/handbook/ports-using.html
# from ports
# /tmp/vagrant-shell: line 10: cd: /usr/ports/sysutils/osquery: No such file or directory
# portsnap fetch update #portsnap fetch should not be run non-interactively.Run portsnap cron instead
# cd /usr/ports/sysutils/osquery && make install clean

# from binary package
whoami
pkg update
pkg install --yes osquery

# using portmaster
# portmaster sysutils/osquery
echo "===================================================================================="
