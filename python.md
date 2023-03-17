# Установка Python

Перед тем как начать, убедитесь, что:

- Вы используете операционную систему, удобную для разработки (например Ubuntu,
  MacOS). Владельцам Windows мы рекомендуем настроить Windows Subsystem for
  Linux (WSL). О том, как это сделать мы написали
  [гайд](https://guides.hexlet.io/ubuntu-linux-in-windows/).
- Вы знаете, как запустить терминал, и можете выполнить команды в нём
- Python уже не установлен в вашей системе по умолчанию, выполнив команду:

```bash
python3 -V
```

- Вы знакомы с основами Git

## Используя менеджер версий (рекомендованный)

- Установите менеджер версий asdf. О том, как это сделать, мы писали в гайде
  ["Что такое "Менеджер версий""](https://guides.hexlet.io/version_managers/)
- Выполните команды:

```bash
asdf plugin-add python https://github.com/asdf-community/asdf-python.git
asdf install python3 latest
```

## Используя менеджер пакетов

### MacOS (если установлен Homebrew)

```bash
brew install python3
```

### Ubuntu Linux

```bash
sudo apt install python3
```

## Используя пакеты с официального сайта

Последнюю версию ** можно скачать на официальном сайте [тут](https://www.python.org/downloads/). Выберите подходящий для Вашей операционной системы файл и скачайте его.
