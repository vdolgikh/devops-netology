# Домашнее задание к занятию «Инструменты Git»

------

### Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.

Полный хэш: `aefead2207ef7e2aa5dc81a34aedf0cad4c32545`
Комментарий к комииту: `Update CHANGELOG.md`

Как нашел:
`git show aefea` (вариант как показывали на модуле)
или
`git log | grep -C5 "commit aefea"` (как еще можно найти)

### 1. Какому тегу соответствует коммит `85024d3`?

Тег: `v0.12.23`

Как нашел:
`git show 85024d3`

### 2. Сколько родителей у коммита `b8d720`? Напишите их хеши.

Два родителя: `56cd7859e05c36c06b56d013b55a252d0bb7e158`, `9ea88f22fc6269854151c571162c5bcf958bee2b`

Как нашел:
`git show -s --pretty=%P b8d720`

### 3. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.

Хэши коммитов с комментариями:
33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24) v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release

Как нашел:
`git log --pretty=oneline v0.12.23..v0.12.24`

### 4. Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).

Коммит: `8c928e83589d90a031f811fae52a81be7153e82f`

Как нашел:
`git log -S "func providerSource("`

### 5. Найдите все коммиты, в которых была изменена функция globalPluginDirs.

Коммиты:
78b12205587fe839f10d946ea3fdc06719decb05
52dbf94834cb970b510f2fba853a5b49ad9b1a46
41ab0aef7a0fe030e84018973a64135b11abcd70
66ebff90cdfaa6938f26f908c7ebad8d547fea17

Как нашел:
Находясь в корне каталога terraform выполнил поиск файла содержащего функцию
`grep -r "func globalPluginDirs" *`
Им оказался plugins.go, поэтому дальше просто указал функцию и файл
`git log -L :globalPluginDirs:plugins.go`
Проанализировав вывод команды, пришел к выводу что в первом коммите `8364383c359a6b738a436d1b7745ccdce178df47` функция была создана, а во всех последующих её изменяли.

### 6. Кто автор функции synchronizedWriters?
