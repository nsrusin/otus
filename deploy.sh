#!/bin/bash
rm ~/.ssh/known_hosts
export ANSIBLE_HOST_KEY_CHECKING=False
cd /home/vagrant/otus
ansible-playbook -i inventory -l all pb-all.yml
ansible-playbook -i inventory -l balance pb-balance.yml
ansible-playbook -i inventory -l web pb-web.yml
ansible-playbook -i inventory -l db pb-db.yml
ansible-playbook -i inventory -l master pb-master.yml
ansible-playbook -i inventory -l slave pb-slave.yml
ansible-playbook -i inventory -l slave pb-slave2.yml
ansible-playbook -i inventory -l elk pb-elk.yml
