# Requirements

Application server OS : Oracle Enterprise Linux 8 and 7


Database version: Any 


Ansible controller server OS: Any

# Steps

Clone repository and go to the folder
```bash
  git clone https://github.com/renanguilhermef/ansible.git
  cd ansible
```

Change private key permission to connect on the application server
```bash
  chmod 400 inventory/<private_key>.key
```

add all your network/admin files to connect on the database with TNS Alias on playbook/roles/install_client_oel/files/

Modify playbook/roles/oracle_tasks/defaults/main.yml if you wish to change connection parameters

```yaml
  oracle_address: add TNS_ALIAS, Easy Connection or TNS String
  db_user: user to connect on the database
  db_pass: password to connect on the database
```
execute ansible playbook
```bash
  ansible-playbook -i inventory/hosts.ini playbook/run-gather-data.yml
