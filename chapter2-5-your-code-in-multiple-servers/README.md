# Your code in a server

Read [../chapter2-2-your-code-in-your-workstation/README.md](README.md) of setting up your environment to configure digital ocean and come back here!

## Create a virtual machine to be your server

To create a virtual machine we're going to be using the Terraform [script](main.tf) in this folder. Feel free to inspect it and change the region or the vm (we're using sfo3 and the cheapest vm)

```bash

> terraform init
> terraform validate

# Replace xxxxxxx with your personal access token and yyyyyyy with your ssh key id.

# See what terraform will do!
> terraform plan --var do_sshkey=yyyyyyy --var do_token=xxxxxxx

# Create the VM!
> terraform apply --var do_sshkey=yyyyyyy --var do_token=xxxxxxx

# Get the IP
> terraform show | grep "ipv4"

# Connect to it, replace 164.90.145.67 with your IP.
> ssh root@164.90.145.67 
```

## Destroy the virtual machine

Once you're done, delete it so that you're no longer charged for it.

```bash
> terraform destroy --var do_sshkey=yyyyyyy --var do_token=xxxxxxx
```

## Useful links

* [terraform digital ocean provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet)
* [ssh key api](https://developers.digitalocean.com/documentation/v2/#ssh-keys)
