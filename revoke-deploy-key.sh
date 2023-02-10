#!/bin/bash

repository_name=$1
dir=$2

rm ~/.ssh/"$repository_name"_deploy-key
rm ~/.ssh/"$repository_name"_deploy-key.pub

sed -z "s/\n\nHost ${repository_name}\n  Hostname github.com\n  User git\n  IdentityFile ${dir}/${repository_name}_deploy-key//g" -i "$dir"/config

echo The deploy key has been revoked.
