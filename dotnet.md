# Установка .NET

Для разработки программ на C# потребуется _dotnet-sdk_. Рекомендуется ставить последнюю версию **.NET 11**, она поддерживается до ноября 2028 года. Если не используете пакетные менеджеры, то можно просто [скачать sdk с официального сайта](https://dotnet.microsoft.com/en-us/download). Если используете пакетные менеджеры, то см. инструкции ниже.

## Linux и macOS через mise (рекомендованный)

Установите mise по [инструкции](/mise.md). В Ubuntu и WSL .NET понадобится библиотека ICU, в минимальной установке системы её нет.

```shell
sudo apt install -y libicu-dev
```

Установите .NET 11 и сделайте его версией по умолчанию.

```shell
mise use -g dotnet@11
```

## Windows

Убедитесь что установлен [пакетный менеджер Chocolatey](https://chocolatey.org/install). Откройте консоль с правами администратора и выполните команду:

```shell
choco install dotnet-11.0-sdk -y
```

## macOS

Устанавливайте через [Homebrew](https://brew.sh/). Формула `dotnet-sdk` ставит последнюю версию .NET:

```shell
brew install --cask dotnet-sdk
```

## Linux (Ubuntu)

В стандартном репозитории Ubuntu 24.04 и 26.04 пока лежит только .NET 10, а Microsoft для этих версий Ubuntu собственных пакетов не выпускает. .NET 11 ставится из репозитория backports, который ведёт Canonical:

```shell
sudo add-apt-repository ppa:dotnet/backports
sudo apt update
sudo apt install -y dotnet-sdk-11.0
```

## Проверка

```shell
# Вывод может отличаться, главное чтобы версия начиналась с 11
dotnet --version
11.0.100
```
