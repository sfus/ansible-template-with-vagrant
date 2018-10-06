PLAYBOOKS := $(wildcard *.yml)

.PHONY: check
check: deps $(PLAYBOOKS)

.PHONY: clean
clean:
	git clean -fdx roles
	git clean -fdx *retry

init:
	vagrant init bento/centos-7.2

up:
	vagrant up

ping:
	ansible all -i hosts -m ping

ssh:
	ssh vagrant@localhost -p 2222 -i .vagrant/machines/default/virtualbox/private_key

deps:
	ansible-galaxy install -r roles/requirements.yml -p roles

run:
	ansible-playbook -i hosts site.yml --ask-become-pass -vv

.PHONY: *.yml
*.yml:
	ansible-playbook -i hosts $@ --syntax-check
