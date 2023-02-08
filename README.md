# GitHub Deploy Key Generator

This is a script to simplify the management of GitHub deploy keys on linux servers

It

* Generates a new ssh key with the provided name and email
* Appends the required host configuration to the SSH config file (the file will be created if it doesn't exist)
* Prints the generated public key for you to copy and paste it in GitHub

The script accepts two required arguments:

* `repository_name`: the name of the repository you are generating the key for (e.g. `github-deploy-key-generator`)
* `email_address`: is passed as comment (`-C`) to the `ssh-keygen` command

E.g.: 

```bash
./generate-deploy-key github-deploy-key-generator davidetrisolini@yahoo.it
```
> NOTE: the ssh keys are stored in the `~/.ssh` directory