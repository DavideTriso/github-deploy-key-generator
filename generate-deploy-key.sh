#!/bin/bash

repository_name=$1
email_address=$2

ssh-keygen -t ed25519 -f ~/.ssh/"$repository_name"_deploy-key -N "" -C $email_address

touch -a ~/.ssh/config

printf "\n\nHost %s\n  Hostname github.com\n  User git\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/%s_deploy-key" $repository_name $repository_name >> ~/.ssh/config

echo "======================================================="
echo "Done! The public deploy key for your repository is:"
echo $(cat ~/.ssh/"$repository_name"_deploy-key.pub)
echo "======================================================="