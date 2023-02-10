#!/bin/bash

repository_name=$1
email_address=$2
dir=$3

mkdir -p $dir
touch -a "$dir"/config

ssh-keygen -t ed25519 -f "$dir"/"$repository_name"_deploy-key -N "" -C $email_address

printf "\n\nHost %s\n  Hostname github.com\n  User git\n  IdentityFile %s/%s_deploy-key\n   IdentitiesOnly yes\n" $repository_name $dir $repository_name >> "$dir"/config

echo "======================================================="
echo "Done! The public deploy key for your repository is:"
echo $(cat "$dir"/"$repository_name"_deploy-key.pub)
echo "======================================================="
