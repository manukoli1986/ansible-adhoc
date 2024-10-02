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

## How It Works 
#### Role - test_db - This is the role's task file that performs the MariaDB operations (insert, select, delete) using the community.mysql.mysql_query module

1. How it will work. 

- The main playbook (playbook.yml) applies the role to all hosts defined in the inventory file under the db_servers group.
- The vars/var.yml file dynamically replaces the values (IP addresses, credentials, database details) for each host.
- The role's tasks iterate over the list of databases and perform the INSERT, SELECT, and DELETE operations on each host with the respective credentials and data.

2. Run the Playbook
```ansible-playbook -i inventory playbook.yml```

This will:

- Install MariaDB on the target hosts.
- Run the database operations (insert, select, delete) using the credentials and IPs specified in vars/var.yml.