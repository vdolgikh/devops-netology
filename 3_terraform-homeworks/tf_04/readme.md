# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

## Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.

### Ответы

1. Сделал
2. По примеру создал отдельный файл `config.tf` с таким содержимым:

```
data template_file "cloud-init" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key     = file("/home/dolgikh/.ssh/id_rsa.pub")
  }
}
```
3. Добавил 1 строку в конце файла:

```
packages:
 - vim
 - nginx
```
4. Скриншот:

![task_1](img/task_01.png)


## Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.
6. Сгенерируйте документацию к модулю с помощью terraform-docs.    

### Ответ

1. Написал модуль `vpc_network`:

![task_2-1](img/task_02-1.png)

2. Передал переменные указав их в секции модуля корневого файла `main.tf` и в файле переменных модуля `variables.tf`:

main.tf:
![task_2-2-1](img/task_02-2-1.png)

variables.tf:
![task_2-2-2](img/task_02-2-2.png)

3. Скриншот информации о модуле из terraform console: 

![task_2-2](img/task_02-2.png)

4. Сделал. Пришлось изменить 2 строки. 

Было:
```
network_id      = yandex_vpc_network.develop.id
subnet_ids      = [ yandex_vpc_subnet.develop.id ]
```

Стало:
```
network_id      = module.vpc_network.vpc_network_id
subnet_ids      = module.vpc_network.vpc_subnet[*]
```

5. Скриншот информации о модуле из terraform console: 

![task_2-2-3](img/task_02-2-3.png)

6. ([Ссылка на файл сформированный с помощью terraform-docs](https://github.com/vdolgikh/devops-netology/blob/main/3_terraform-homeworks/tf_04/src/docs.md))

## Задание 3

1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.

Приложите список выполненных команд и скриншоты процессы.

### Ответ

1. Скриншот списка ресурсов:

![task_3-1](img/task_03-1.png)

2. Скриншот после удаления модуля vpc_network:

![task_3-2](img/task_03-2.png)

3. Скриншот после удаления модуля test-vm:

![task_3-3](img/task_03-3.png)

4. Импортировал следующими командами:

```
terraform import 'module.vpc_network.yandex_vpc_network.develop' enpq5ldr1ce8i3s0v4bv
terraform import 'module.vpc_network.yandex_vpc_subnet.develop' e9bghgsbdek4ui4se9s0
terraform import 'module.test-vm.yandex_compute_instance.vm[0]' fhm2t2p23tf39vsj4esn
terraform import 'module.test-vm.yandex_compute_instance.vm[1]' fhmal2qvmrnt0so5hkuq

```
