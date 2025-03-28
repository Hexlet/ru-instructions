# Установка Node.js

Перед тем как начать, убедитесь, что:

* Вы используете операционную систему, удобную для разработки (например Ubuntu, MacOS). Владельцам Windows мы рекомендуем настроить Windows Subsystem for Linux (WSL). О том, как это сделать мы написали [гайд](https://ru.hexlet.io/blog/posts/ubuntu-linux-in-windows).
* Вы знаете, как запустить терминал, и можете выполнить команды в нём
* Вы знакомы с основами Git

## Используя менеджер версий (рекомендованный)

* Установите менеджер версий asdf. О том, как это сделать, мы писали в гайде ["Что такое "Менеджер версий""](https://ru.hexlet.io/blog/posts/version-managers)
* Выполните команды:

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
```

## Используя менеджер пакетов

Пользователи MacOS, у которых установлен Homebrew, могут установить Node.js командой:

```bash
brew install node
```

Пользователи Ubuntu могут установить Node.js командой:

```bash
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

## Используя пакеты с официального сайта

Последнюю версию *Node.js* можно скачать на официальном сайте
[тут](https://nodejs.org/en/download). Выберите подходящий для Вашей операционной системы файл и скачайте его.

### MacOS

Достаточно запустить файл, чтобы началась установка. Установщик добавит
необходимые файлы в нужные директории автоматически.

### Ubuntu Linux

К сожалению, автоматического установщика для Linux нет, и по ссылке загрузится архив.
Распакуйте его и скопируйте полученную директорию в директорию */usr/local/lib/nodejs*. Затем
добавьте */usr/local/lib/nodejs/node-v18.15.0-linux-x64/bin* в переменную `$PATH` (имя архива и директории 'node-...' может отличаться в зависимости от текущей актуальной версии node).
Например, если у вас стоит Bash, то порядок действий будет следующий:

```bash
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-v18.15.0-linux-x64.tar.xz -C /usr/local/lib/nodejs
echo 'export PATH=$PATH:/usr/local/lib/nodejs/node-v18.15.0-linux-x64/bin' >> $HOME/.profile
source $HOME/.profile
```

После того, как вы установили Node.js любым из
вышеперечисленных методов, нужно перезапустить
терминал. Проверить, успешно ли прошла установка можно запустив в терминале:

```bash
# Вывод может отличаться, главное чтобы не было ошибок
node -v
v18.15.0
```

Если команда возвращает ошибку, то на Linux и MacOS стоит проверить, добавлена ли директория *bin* в переменную окружения `$PATH`.
