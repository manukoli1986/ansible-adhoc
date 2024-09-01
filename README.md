# ansible-adhoc
Usage
-----

Define your playbook that uses this role. For example, create a playbook named site.yml:
```
---
- hosts: k8-master1
  roles:
    - roles: k8s-cert-sync

    - role: check_domain_availability
      vars:
        domain_name: "anotherdomain.com"
        adcli_options: "--verbose"



ansible-playbook -i inventory tower-main.yml
```