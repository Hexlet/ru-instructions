# Установка Node.js

## Windows

Мы рекомендуем работать в *nix-системах, так как они наиболее совместимы с языками программирования и софтом, который нужен для обучения на Hexlet. Поэтому, если вы работаете на Windows, установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит получить все преимущества Linux без переустановки системы.

### Системный пакетный менеджер

Основной вариант установки Node.js — используя системный пакетный менеджер:

* Для Debian/Ubuntu инструкция находится на [странице Node.js в Github](https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions)
* Для macOS инструкция находится на [официальном сайте Node.js](https://nodejs.org/en/download/package-manager/#macos)

### Пакетный менеджер asdf

Универсальный способ получать нужную версию многих популярных языков — это менеджер *asdf*. Чтобы начать с ним работу:

* Установите менеджер по [инструкции на официальном сайте](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf)
* Установите Node.js через этот менеджер по [нашему гайду](https://guides.hexlet.io/version_managers/#универсальный-менеджер)

Подробнее о менеджере asdf можно прочитать в нашем [гайде](https://guides.hexlet.io/version_managers/).

### Установщики

Также, есть вариант использования [установщика с официального сайта](https://nodejs.org/en/download/). Но в случае с Windows мы рекомендуем воспользоваться WSL и установить Node.js через *asdf* или системный пакетный менеджер Ubuntu.
