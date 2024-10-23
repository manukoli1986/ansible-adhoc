# DB Test Functionality

I need ansible role which test database functionality. As a start, this role will test functionality of mariadb on all different vms that have a mariadb database on them. 

It will, for each database:
1. write a piece of test data to the database
2. read that piece of test data from database
3. delete that piece of test data from the database to not leave anything behind.

Acceptance Criteria:
1. For mariadb - Check, read/write/delete to Database
2. This rile will be written in such a way that by providing different variables you can run it on different tools without changing the role itself.


## Key Changes:
FQCN usage: The community.mysql.mysql_query module is used for all database operations (insert, select, delete).

login_unix_socket added: This is included in case you face connection issues with MariaDB, allowing for a more explicit protocol definition.

Better variable structure: The vars file now supports multiple databases with different credentials and specific details for each host.

With these updates, you can more efficiently manage MariaDB databases on different hosts. 


#### Sample

```bash 
[db_vms]
192.168.1.10
192.168.1.11
192.168.1.12

ansible-playbook -i inventory playbook.yml

```

