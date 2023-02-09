#!/bin/bash

repository_name=$1

rm ~/.ssh/"$repository_name"_deploy-key
rm ~/.ssh/"$repository_name"_deploy-key.pub

sed -z "s/\n\nHost ${repository_name}\n  Hostname github.com\n  User git\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~\/.ssh\/${repository_name}_deploy-key//g" -i ~/.ssh/config

echo The deploy key has been revoked.
