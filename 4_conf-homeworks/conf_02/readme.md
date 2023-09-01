# Домашнее задание к занятию 2 «Работа с Playbook»

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2.
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook).
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

## Ответы

1. Добавил ip-адрес своего тестового сервера и пользователя под которым будет осуществляться вход:

```
---
clickhouse:
  hosts:
    clickhouse-01:
      ansible_host: 158.160.105.128
  vars:
    ansible_user: centos
```

2. Добавил play для vector по аналогии с play для clickhouse. Создание шаблона описал так:

```
- name: Create configuration using jinja2
  become: true
  ansible.builtin.template:
    src: templates/vector_cfg.j2
    dest: /etc/vector/vector.toml
```

3. Использовал `get_url` и `template`.
4. Сделал
5. Исправил
6. Playbook останавливается с ошибкой на моменте попытки распаковки rpm по причине того что запуск произведен с ключом `--check`. Пакеты не скачиваются на самом деле.
7. Изменения произведены
8. Playbook идемпотентен:

```
PLAY RECAP ****************************
clickhouse-01              : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0 
```

9. Подготовил документацию в файле [readme.md](playbook/readme.md)
10. Ссылку прикрепил отдельно к ответу по ДЗ в личном кабинете нетологии.