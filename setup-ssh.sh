#!/bin/bash
set -e

mkdir -p ~/.ssh
echo "$APP_SSH_KEY" > ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
ssh-keyscan -H "github.com" > ~/.ssh/known_hosts
