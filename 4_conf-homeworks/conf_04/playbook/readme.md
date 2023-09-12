<img style="vertical-align:middle;margin:0 45% 0 45%" src="https://www.linode.com/docs/guides/applications/configuration-management/ansible/feature.png" height="64px"/>

# Ansible-Playbook для настройки сервера Clickhouse и Vector с LightHouse GUI веб-интерфейсом

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

PLaybook настраивает `vector` для перенаправления логов операционной системы в базу данных `logs` сервиса `clickhouse`. Для удобства работы с сервисом `clickhouse` разворачивается веб-интерфейс `lighthouse` на веб-сервере `nginx`.

Этапы работы:

1. Скачивает и устанавливает необходимые пакеты
2. Настраивает веб сервер `nginx` для работы `lighthouse`
2. Создает БД для `clickhouse`, запускает службы 
3. Создает конфигурацию для `vector`

Загружаемые пакеты:

  - **epel-release**
  - **nginx**
  - **git**
  - **clickhouse-client-22.3.3.44.noarch.rpm**
  - **clickhouse-server-22.3.3.44.noarch.rpm**
  - **clickhouse-common-static-22.3.3.44.x86-64.rpm**
  - **vector-0.32.1-1.x86_64.rpm**

Загружаемые git-репозитории:

  - **https://github.com/VKCOM/lighthouse**

## <a id="parameters-and-tags"></a>Параметры и теги

После распаковки rpm-пакетов будут запущены службы:

  - **nginx**
  - **clickhouse-server.service**
  - **vector.service**

Создана база данных clickhouse:

  - **logs**

Конфигурации:

  -  Общая для веб-сервера NGINX. Файл конфигурации `/etc/nginx/nginx.conf`:
```
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 4096;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    include /etc/nginx/conf.d/*.conf;
}
```
  -  Сервер `lighthouse` для `nginx`. Файл конфигурации `/etc/nginx/conf.d/lighthouse.conf`:

```
server {
        listen       80;
        listen       [::]:80;
        server_name  _;
        root         /usr/share/nginx/lighthouse;

        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
    }
```

  -  `vector` для работы с БД `clickhouse`. Файл конфигурации `/etc/vector/vector.toml`:

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