# Домашнее задание к занятию "Применение принципов IaaC в работе с виртуальными машинами"

## Задача 1

- Опишите своими словами основные преимущества применения на практике IaaC паттернов.
- Какой из принципов IaaC является основополагающим?

### Ответ:

- Основное преимущество заложено в самой аббревиатуре IaaC (инфраструктура как код), что позволяет процесс автоматизировать, масштабировать, относительно легко поддерживать с наименьшими трудозатратами в силу автоматизации.  
- Основополагающий принцип IaaC заключается в том, что создать необходимую инфраструктуру можно аналогично разработки ПО. То есть всё описывается кодом - файлами конфигурации.

## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

### Ответ:

- Ansible выгодно отличается от других систем управления тем, что не требует установки дополнительного клиентского ПО на удаленные хосты, а может использовать существующую ssh инфраструктуру и действовать методом push.
- Если говорить о надежности, то на мой взгляд это Pull метод. В силу того, что у вас может быть не один сервер приложений, а удаленные машины могут подключаться к любому из них и получать конфигурацию. То есть в случае отказа одного сервера приложений, всегда есть другой с которого её можно забрать.

## Задача 3

Установить на личный компьютер:

- VirtualBox
- Vagrant
- Ansible

### Ответ:

```bash
dolgikh@dolgikh:~> ansible --version
ansible [core 2.11.12]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/dolgikh/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/dolgikh/.local/lib/python3.6/site-packages/ansible
  ansible collection location = /home/dolgikh/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.6.12 (default, Dec 02 2020, 09:44:23) [GCC]
  jinja version = 3.0.3
  libyaml = False
dolgikh@dolgikh:~> vagrant -v
Vagrant 2.2.7
dolgikh@dolgikh:~> vboxmanage -v
6.1.22r144080
```

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

- Создать виртуальную машину.
- Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды
```
docker ps
```

### Ответ:

```bash
dolgikh@dolgikh:~> vagrant ssh
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-144-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed 28 Jun 2023 03:13:07 PM UTC

  System load:  0.37               Users logged in:          0
  Usage of /:   13.8% of 30.34GB   IPv4 address for docker0: 172.17.0.1
  Memory usage: 28%                IPv4 address for eth0:    10.0.2.15
  Swap usage:   0%                 IPv4 address for eth1:    10.101.3.3
  Processes:    141

 * Introducing Expanded Security Maintenance for Applications.
   Receive updates to over 25,000 software packages with your
   Ubuntu Pro subscription. Free for personal use.

     https://ubuntu.com/pro


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
vagrant@server1:~$ docker -v
Docker version 24.0.2, build cb74dfc
```
