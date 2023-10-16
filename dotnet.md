# Установка .NET

Для разработки программ на C# потребуется _dotnet-sdk_. Рекомендуется ставить версию **.NET 6**, которая будет находится на длительной поддержке (LTS) почти до конца 2024 года. Если не используете пакетные менеджеры, то можно просто [скачать sdk с официального сайта](https://dotnet.microsoft.com/en-us/download). Если используете пакетные менеджеры, то см. инструкции ниже.

## Windows

Убедитесь что установлен [пакетный менеджер Chocolatey](https://chocolatey.org/install). Откройте консоль с правами администратора и выполните команду:

```shell
choco install dotnet-sdk -y
```

## MacOS

Устанавливайте через [Homebrew](https://brew.sh/):

```shell
brew install --cask dotnet-sdk
```

## Linux (Ubuntu)

Сперва нужно добавить ключи. Url отличается для разных версий Ubuntu. Например для версии 20.04, откройте терминал и выполните:

```shell
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

Для других версий замените `20.04` в url на соответствующую версию. Установка самого dotnet-sdk:

```shell
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
```
