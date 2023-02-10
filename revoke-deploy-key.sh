#!/bin/bash

repository_name=$1
dir=$2

rm "$dir"/"$repository_name"_deploy-key
rm "$dir"/"$repository_name"_deploy-key.pub

sed -z "s|Host ${repository_name}\n  Hostname github.com\n  User git\n  IdentityFile ${dir}/${repository_name}_deploy-key\n  IdentitiesOnly yes||g" -i "$dir"/config
sed -z "s|\n\n\n|\n|g" -i "$dir"/config

echo The deploy key has been revoked.
