Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

Полный хэш: aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Комментарий к комииту: Update CHANGELOG.md

1. Какому тегу соответствует коммит 85024d3?
v0.12.23

2. Сколько родителей у коммита b8d720? Напишите их хеши.
Два родителя: 56cd7859e05c36c06b56d013b55a252d0bb7e158, 9ea88f22fc6269854151c571162c5bcf958bee2b

3. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
Если смотреть по ветке, то ситуация такая:
commit 85024d3100126de36331c6982bfaac02cdab9e76 "v0.12.23"
commit 225466bc3e5f35baa5d07197bbc079345b77525e "Cleanup after v0.12.23 release"
commit dd01a35078f040ca984cdd349f18d0b67e486c35 "Update CHANGELOG.md"
commit 4b6d06cc5dcb78af637bbb19c198faff37a066ed "Update CHANGELOG.md"
commit d5f9411f5108260320064349b757f55c09bc4b80 "command: Fix bug when using terraform login on Windows"
commit 06275647e2b53d97d4f0a19a0fec11f6d69820b5 "Update CHANGELOG.md"
commit 5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 "website: Remove links to the getting started guide's old location Since these links were in the soon-to-be-deprecated 0.11 language section, I think we can just remove them without needing to find an equivalent link."
commit 6ae64e247b332925b872447e9ce869657281c2bf "registry: Fix panic when server is unreachable. Non-HTTP errors previously resulted in a panic due to dereferencing the resp pointer while it was nil, as part of rendering the error message. This commit changes the error message formatting to cope with a nil response, and extends test coverage. Fixes #24384"
commit 3f235065b9347a758efadc92295b540ee0a5e26e "Update CHANGELOG.md"
commit b14b74c4939dcab573326f4e3ee2a62e23e12f89 "[Website] vmc provider links"
commit 33ff1c03bb960b332be3af2e333462dde88b279e "v0.12.24"

4. Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).
5e06e39fcc86bb622b962c87da84213d3331ddf8

5. Найдите все коммиты, в которых была изменена функция globalPluginDirs.
65c4ba7363 Remove terraform binary
125eb51dc4 Remove accidentally-committed binary
22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)
7c7e5d8f0a Don't show data while input if sensitive
35a058fb3d main: configure credentials from the CLI config file
c0b1761096 prevent log output during init
8364383c35 Push plugin discovery down into command package

6. Кто автор функции synchronizedWriters?
