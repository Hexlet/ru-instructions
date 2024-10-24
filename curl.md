# Установка Curl

Процесс установки Curl зависит от вашей операционной системы

## Установка Curl на Linux

```bash
sudo apt update
sudo apt install curl
```

## Установка Curl на macOS

Вы можете установить Postman на MacOS, используя менеджер пакетов [Homerbrew](https://brew.sh/)

```bash
brew update
brew install curl
```

## Установка Curl на Windows

Для установки вам потребуется пакетный менеджер [Chocolatey](https://chocolatey.org/). Если он не установлен, установите его по инструкции на [официальном сайте](https://chocolatey.org/install)

Для установки Curl выполните команду

```bash
choco install curl
```

## Как проверить, что установка прошла успешно

Чтобы проверить, что установка прошла успешно, выполните команду:

```bash
curl --version

# Версия может отличаться
# Главное - что команда выполнилась успешно
curl 7.81.0
...
```
