Role Name
=========

Copying the KUBECONFIG file to remote server so that they can communicate with Kube-API.


Dependencies
------------

The renew script should be run before executing role "k8s-cert-sync".

 
Usage
-----

Define your playbook that uses this role. For example, create a playbook named site.yml:
```
---
- hosts: k8-master1
  roles:
    - copy_kube_config



ansible-playbook -i inventory site.yml
```
