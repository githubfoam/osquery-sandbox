#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================Install runner============================================================="
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash
sudo yum install -y gitlab-runner
echo "=============================Install runner finished============================================================="

# git clone https://github.com/WERNERWAN1/gitlab-runner-demo.git && cd gitlab-runner-demo
# curl -LJO https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_amd64.rpm
# rpm -i gitlab-runner_amd64.rpm
# chmod +x /usr/local/bin/gitlab-runner

# useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
# gitlab-runner start
# gitlab-runner register 
