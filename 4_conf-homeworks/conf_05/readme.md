# Домашнее задание к занятию 4 «Работа с roles»

## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles. 

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей. 

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачайте себе эту роль.
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

### Ответы

1. Ок
2. Скачал.
3. Сделал.
4. Заполнил роль `vector-role`.
5. Перенес шаблон `vector.toml.j2`
6. Написал документацию:

 - [LightHouse role README](playbook/lighthouse-role/README.md)
 - [Vector role README](playbook/vector-role/README.md)

7. Создал и заполнил роль `lighthouse-role`.
8. Выложил:

 - [LightHouse role git repo](https://github.com/vdolgikh/lighthouse-role)
 - [Vector role git repo](https://github.com/vdolgikh/vector-role)

    Добавил роли в `requirements.yml`:

```yaml
  - src: git@github.com:vdolgikh/lighthouse-role.git
    scm: git
    version: "1.0.0"
    name: lighthouse-role
  - src: git@github.com:vdolgikh/vector-role.git
    scm: git
    version: "1.0.0"
    name: vector-role
```

9. Переработал playbook.
10. [Ссылка на репозиторий с Playbook](https://github.com/vdolgikh/devops-netology/tree/main/4_conf-homeworks/conf_04/playbook)
