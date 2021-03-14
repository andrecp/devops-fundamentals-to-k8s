# Setting up your environment

We're going to use Terraform to create a Virtual Machine in DigitalOcean with Ubuntu LTS 20.0.2.

## Set up

### DigitalOcean

1. Create a DigitalOcean account if you don't have one yet, you can create one [here](https://cloud.digitalocean.com/registrations/new). DigitalOcean usually gives free credit for new accounts, at the time of writing [this url](https://try.digitalocean.com/developerbrand/) is giving $100 free. Google "Digital ocean register".
2. Create a DigitalOcean Personal Access Token, which you can create via the DigitalOcean control panel. Instructions to do that can be found [here](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2#HowToGenerateaPersonalAccessToken)
3. Add a ssh key to your DigitalOcean account, instructions [here](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets)

### Terraform

1. Follow the instructions [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install the terraform CLI in your platform.

## Create a virtual machine

At the time of writing the most basic Droplet (what DigitalOcean calls a Virtual Machine) costs $5.00 per month, or, $0.0074/hour. You're only going to be charged while the Droplet is running. Check the prices [here](https://www.digitalocean.com/pricing) as it might have changed since I wrote! 

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

# Connect to it
> ssh root@164.90.145.67 
```

If you want to know what else you can do with DigitalOcean and Terraform read the [docs](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs) on the Terraform DigitalOcean provider.

## Useful links
* [ssh key api](https://developers.digitalocean.com/documentation/v2/#ssh-keys)
