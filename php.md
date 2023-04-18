# Установка PHP

Перед тем как начать, убедитесь, что:

- Вы используете операционную систему, удобную для разработки (например Ubuntu,
  MacOS). Владельцам Windows мы рекомендуем настроить Windows Subsystem for
  Linux (WSL). О том, как это сделать мы написали
  [гайд](https://guides.hexlet.io/ubuntu-linux-in-windows/).
- Вы знаете, как запустить терминал, и можете выполнить команды в нём

## Windows

Мы рекомендуем работать в *nix-системах, так как они наиболее совместимы с языками программирования и софтом, который
нужен для обучения на Хекслет.

Если вы работаете на Windows,
установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит
получить все преимущества Linux без переустановки системы. Далее
воспользуйтесь [инструкцией для Ubuntu](#менеджеры-linux) для установки софта.

## macOS Homebrew

Установка производится пакетным менеджером Homebrew. Если он ещё не установлен, откройте терминал и выполните следующую
команду:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Установка:

```bash
brew install php
```

## Ubuntu или Ubuntu on Windows

Установка:

```bash
sudo apt update
sudo apt install -y php
```
