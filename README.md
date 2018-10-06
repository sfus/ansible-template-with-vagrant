ansible-template-with-vagrant
====

Overview

## Description

This is a template of Ansible with Vagrant.

## Requirement

- vagrant
- ansible

## Usage

### Vagrant initialization

```
$ vagrant init bento/centos-7.2
```

or `$ make init`

### Uncomment private_network in Vagrantfile

```Vagrantfile
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"
```

### Start

```
$ vagrant up
```

or `$ make up`

### Confirm SSH config

```
$ vagrant ssh-config
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /PATH_TO_HERE/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

### Ansible inventory file

#### hosts

```hosts
vagrant-machine ansible_host=127.0.0.1 ansible_port=2222 ansible_user=vagrant ansible_ssh_private_key_file=.vagrant/machines/default/virtualbox/private_key
```

#### ansible.cfg

```ansible.cfg
[defaults]
host_key_checking = False
```

#### ping

```
$ ansible all -i hosts -m ping
```

or `$ make ping`

### SSH

```
$ ssh vagrant@localhost -p 2222 -i .vagrant/machines/default/virtualbox/private_key
```

### Run Ansible playbook

#### Install roles from ansible-galaxy into ./roles directory

```
$ ansible-galaxy install -r roles/requirements.yml -p roles
```

or `$ make deps`

#### site.yml

```
- name: site.yml sample
  become: yes
  hosts: vagrant-machine
  roles:
    - role: roles/geerlingguy.nginx
``` 

#### Run ansible-playbook with verbose log

```
$ ansible-playbook -i hosts site.yml --ask-become-pass -vv
```

or `$ make run`

pw: `vagrant`


## Licence

MIT


## Author

[sfus](https://github.com/sfus)
