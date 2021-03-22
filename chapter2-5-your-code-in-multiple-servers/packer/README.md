# Packer approach

Let's create a virtual machine template with packer.

## Build a digitalocean template for your VMs

```bash
# Replace xxxxxxx with your personal access token
> export DO_SSHKEY=yyyyyyy
> export DO_TOKEN=xxxxxxx
> export DO_TOKEN=xxxxxxx
> packer validate manifest.json
> packer build manifest.json
```

## Create VMs from your template

```bash
# Replace xxxxxxx with your personal access token and yyyyyyy with your ssh key id.
> export DO_SSHKEY=yyyyyyy
> export DO_TOKEN=xxxxxxx
> terraform apply --var do_sshkey=$DO_SSHKEY --var do_token=$DO_TOKEN 
```
