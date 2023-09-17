Vector role
=========

The role install and configure Vector.

Requirements
------------

- Centos  == 7
- Ansible >= 2.10

Role Variables
--------------

All variables which can be overridden are stored in [defaults/main.yml](defaults/main.yml) file as well as in table below.

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `vector_version` | 0.32.1-1 | Vector package version. |


Example Playbook
----------------

```yaml
  - hosts: clickhouse
    roles:
      - vector-role
```

License
-------

MIT

Author Information
------------------

Valentin Dolgikh for Netology homework. 

2023 
