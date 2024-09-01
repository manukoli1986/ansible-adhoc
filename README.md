# ansible-adhoc
Usage
-----

Define your playbook that uses this role. For example, create a playbook named site.yml:
```
---
- hosts: k8-master1
  roles:
    - k8-cert-sync



ansible-playbook -i inventory tower-main.yml
```