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

### SSH

```
$ ssh vagrant@localhost -p 2222 -i .vagrant/machines/default/virtualbox/private_key
```


## Licence

MIT


## Author

[sfus](https://github.com/sfus)
