# GitHub Deploy Key Generator

Scripts to simplify the management of GitHub deploy keys on linux servers

## Generate a GitHub deploy key

To generate a deploy key execute the `generate-deploy-key` script

The script

* generates a new ssh key with the provided name and email;
* appends the required host configuration to the SSH config file (the file will be created if it doesn't exist);
* prints the generated public key for you to copy and paste it in GitHub;

The script accepts three required arguments:

* `repository_name`: the name of the repository you are generating the key for (e.g. `github-deploy-key-generator`)
* `email_address`: is passed as comment (`-C`) to the `ssh-keygen` command
* `dir`: absolute path to the root directory where the keys must be installed (e.g. `/root/.ssh`)

E.g.: 

```bash
./generate-deploy-key.sh github-deploy-key-generator davidetrisolini@yahoo.it "/root/.ssh/"
```

## Revoke a GitHub deploy key

To revoke a deploy key execute the `revoke-deploy-key` script.

The script

* deletes the public and private key files;
* removes the host configuration from the SSH config file

The scripts accepts two required parameters:

* `repository_name`: the name of the repository owning the key you want to revoke (e.g. `github-deploy-key-generator`)
* `dir`: absolute path to the root directory where the keys are installed (e.g. `/root/.ssh`)

E.g.: 

```bash
./revoke-deploy-key.sh github-deploy-key-generator "/root/.ssh/"
```
