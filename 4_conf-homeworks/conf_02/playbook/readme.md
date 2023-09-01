<img style="vertical-align:middle;margin:0 45% 0 45%" src="https://www.linode.com/docs/guides/applications/configuration-management/ansible/feature.png" height="64px"/>

# Ansible-Playbook для настройки сервера Clickhouse и Vector

- [Требования](#require)
- [Что делает этот Playbook?](#what-does-it-do)
- [Параметры и теги](#parameters-and-tags)

## <a id="require"></a>Требования

Использование данного Playbook предполагает что вы уже подготовили сервер. А именно:

- развернули сервер на базе `Centos`;
- назначили серверу ip-адрес;
- организовали доступ к серверу по ssh-ключу;
- внесли ip-адрес сервера в качестве значения переменной `ansible_host` в inventory-файле [prod.yml](inventory/prod.yml)

## <a id="what-does-it-do"></a>Что делает этот Playbook?

PLaybook настраивает `vector` для перенаправления логов операционной системы в базу данных `logs` сервиса `clickhouse`. 

Этапы работы:

1. Скачивает и устанавливает необходимые пакеты
2. Создает БД для `clickhouse`, запускает службы 
3. Создает конфигурацию для `vector`

Загружаемые rpm-пакеты:

  - **clickhouse-client-22.3.3.44.noarch.rpm**
  - **clickhouse-server-22.3.3.44.noarch.rpm**
  - **clickhouse-common-static-22.3.3.44.x86-64.rpm**
  - **vector-0.32.1-1.x86_64.rpm**

## <a id="parameters-and-tags"></a>Параметры и теги

После распаковки rpm-пакетов будут запущены службы:

  - **clickhouse-server.service**
  - **vector.service**

Создана база данных clickhouse:

  - **logs**

И сконфигурирован vector для работы с БД clickhouse. Файл конфигурации `/etc/vector/vector.toml`:

    [sources.system_logs]
    type = "file"
    include = [ "/var/log/messages" ]
    read_from = "end"

    [sinks.clickhouse]
    type = "clickhouse"
    inputs = ["system_logs"]
    endpoint = "http://localhost:8123"
    database = "logs"
    table = "system_logs"
    skip_unknown_fields = true