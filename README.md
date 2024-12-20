## Cloud-1
This is the readme section for a project where we used ansible to connect to a remote machine (or local machine, you just need to have ssh access to it), but we didn't stop there. we make sure take something good out of it. that is why we deploy an already exsiting application, called inception. Because the app is built using docker compose, it was quite easy to deploy it. so now I show how you can use it yourself.
# 1- Make sure you can access the targeted machine using ssh
- Preferably to use the ssh key instead of user password, here's how you can do this (repeat this for every targeted machine):
```
ssh-copy-id -i /path/to/pub-key <username>@<ip-address>
```
- Go to ansible/ansible.cfg, and modify the private_key_file to the same path you use in the last command.
- Open ansible/inventory, and adjust this accordongly to your setup
```
[machines]
<ip-address> ansible_ssh_user=<username>
(put other targets belows it)
```
# 2- Adjust the host vars
Go to ansible/host_vars and edit the name of the file to be: `ip-address.yaml`.\
you will have to create this file for every targeted machine.
