# Установка PHP

## Windows

Мы рекомендуем работать в *nix-системах, так как они наиболее совместимы с языками программирования и софтом, который нужен для обучения на Хекслет.

Если вы работаете на Windows, установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит получить все преимущества Linux без переустановки системы. Далее воспользуйтесь [инструкцией для Ubuntu](#менеджеры-linux) для установки софта.

## macOS Homebrew

Установка производится пакетным менеджером Homebrew. Если он ещё не установлен, откройте терминал и выполните следующую команду:

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Установка:

```shell
brew install php
```

## Ubuntu, Debian

Установка PHP:

```shell
sudo apt update
sudo apt install -y php
```
