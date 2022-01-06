# DevOps-HomeWork

выполнение дз №2.1

[Домашнее задание № 2.1](02-git-01-vcs/2.1.md)

выполнение дз №2.4

Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea. 

    git show -s --format=$'%H %s' aefea
    
    $aefead2207ef7e2aa5dc81a34aedf0cad4c32545 Update CHANGELOG.md


Какому тегу соответствует коммит 85024d3?

    git show -s --oneline 85024d3
    
    85024d310 (tag: v0.12.23) v0.12.23

Сколько родителей у коммита b8d720? Напишите их хеши.

    git show -s --format=%P b8d720
    
    56cd7859e05c36c06b56d013b55a252d0bb7e158 9ea88f22fc6269854151c571162c5bcf958bee2b

Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

    git log  v0.12.23..v0.12.24  --oneline

    33ff1c03b (tag: v0.12.24) v0.12.24
    b14b74c49 [Website] vmc provider links
    3f235065b Update CHANGELOG.md
    6ae64e247 registry: Fix panic when server is unreachable
    5c619ca1b website: Remove links to the getting started guide's old location
    06275647e Update CHANGELOG.md
    d5f9411f5 command: Fix bug when using terraform login on Windows
    4b6d06cc5 Update CHANGELOG.md
    dd01a3507 Update CHANGELOG.md
    225466bc3 Cleanup after v0.12.23 release


Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).
    
    git log -pS 'func providerSource' --oneline
    5af1e6234 main: Honor explicit provider_installation CLI config when present

Найдите все коммиты в которых была изменена функция globalPluginDirs.
    
    git log -S 'globalPluginDirs' --oneline
    35a058fb3 main: configure credentials from the CLI config file
    c0b176109 prevent log output during init
    8364383c3 Push plugin discovery down into command package

Кто автор функции synchronizedWriters?

    git log -S 'func synchronizedWriters' --pretty=format:'%h %an' --reverse
    5ac311e2a Martin Atkins
    

