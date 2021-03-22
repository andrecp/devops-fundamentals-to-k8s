# Ansible approach

* Change your `ansible.cfg` to have the path to your digital ocean private key
* Change your `hosts.ini` to have the IP of your servers created via terraform as per [../README.md](README.md)

```bash
> ansible-playbook install-webapp.yaml
```
