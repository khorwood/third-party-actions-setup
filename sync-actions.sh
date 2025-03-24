#!/bin/bash
set -e

export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519 -o UserKnownHostsFile=~/.ssh/known_hosts"
git push git@github.com:$OWNER/third-party-actions.git HEAD:refs/heads/$1 --force
