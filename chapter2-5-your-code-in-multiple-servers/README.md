# Your code in multiple servers

Read [../chapter2-1-setting-up-your-environment/README.md](README.md) of setting up your environment to configure digital ocean and come back here!

## Create your servers

To create our server VMs we're going to be using the Terraform [script](main.tf) in this folder. Feel free to inspect it and change the region or the vm (we're using sfo3 and the cheapest vm)

```bash

> terraform init
> terraform validate

# Replace xxxxxxx with your personal access token and yyyyyyy with your ssh key id.
> export DO_SSHKEY=yyyyyyy
> export DO_TOKEN=xxxxxxx

# See what terraform will do!
> terraform plan --var do_sshkey=$DO_SSHKEY --var do_token=$DO_TOKEN

# Create the two VMs!
> terraform apply --var do_sshkey=$DO_SSHKEY --var do_token=$DO_TOKEN

# Get the IPs
# It should printed to your terminal, otherwise.
> terraform show | grep "ipv4"
```

## Provision your service

Have a read on both the [ansible](ansible/) and the [packer](packer/) approaches to configure your web app!

## Destroy the virtual machines

Once you're done, delete it so that you're no longer charged for it.

```bash
> terraform destroy --var do_sshkey=$DO_SSHKEY --var do_token=$DO_TOKEN
```

## Useful links

* [terraform digital ocean provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet)
* [ssh key api](https://developers.digitalocean.com/documentation/v2/#ssh-keys)
