#!/bin/bash
set -eox pipefail #safety for script

- PACKER_CURRENT_VERSION="$(curl -s https://checkpoint-api.hashicorp.com/v1/check/packer | jq -r -M '.current_version')"
- PACKER_URL="https://releases.hashicorp.com/packer/$PACKER_CURRENT_VERSION/packer_${PACKER_CURRENT_VERSION}_linux_amd64.zip"
- PACKER_SHA256="https://releases.hashicorp.com/packer/$PACKER_CURRENT_VERSION/packer_${PACKER_CURRENT_VERSION}_SHA256SUMS"
- PACKER_SHA256_SIG="https://releases.hashicorp.com/packer/$PACKER_CURRENT_VERSION/packer_${PACKER_CURRENT_VERSION}_SHA256SUMS.sig"
- HASHICORP_FINGERPRINT=91a6e7f85d05c65630bef18951852d87348ffc4c
- HASHICORP_KEY="https://keybase.io/hashicorp/pgp_keys.asc?fingerprint=${HASHICORP_FINGERPRINT}"

# - echo "================================Installing Packer================================================================"
# - curl -LO "${PACKER_URL}"
# - curl -LO "${PACKER_SHA256}"
# - curl -LO "${PACKER_SHA256_SIG}"
# - wget -Lo hashicorp.key "${HASHICORP_KEY}"
# - gpg --with-fingerprint --with-colons hashicorp.key | grep ${HASHICORP_FINGERPRINT^^}
# - gpg --import hashicorp.key
# - gpg --verify "packer_${PACKER_CURRENT_VERSION}_SHA256SUMS.sig" "packer_${PACKER_CURRENT_VERSION}_SHA256SUMS"
# - grep linux_amd64 "packer_${PACKER_CURRENT_VERSION}_SHA256SUMS" >packer_SHA256SUM_linux_amd64
# - sha256sum --check --status packer_SHA256SUM_linux_amd64
# - unzip "packer_${PACKER_CURRENT_VERSION}_linux_amd64.zip"
# - sudo cp packer /usr/bin
# - stat /usr/bin/packer
# - sudo packer --version
# - echo "=================================================================================================================="
- sudo packer validate -syntax-only archlinux/vagrant.json
# - sudo packer build -parallel=false archlinux/vagrant.json #build the images in a queue instead of parallel
# - sudo packer build -only=virtualbox-iso local.json #build process locally without uploading them to the Vagrant cloud
# - sudo packer build -except=qemu,vmware-iso archlinux/vagrant.json #build for all providers except VMware and Qemu
- sudo packer build -only=qemu archlinux/vagrant.json #build for only the VirtualBox provider
# - sudo packer build centos/centos7.json
# - sudo packer build -var 'mirror=http://mirror.utexas.edu/fedora/linux' fedora-31-x86_64.json #alternate mirror
