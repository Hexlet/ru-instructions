# Установка Java

Для работы с Java понадобятся:

* **Java Development Kit (JDK)** — набор, включающий в себя среду исполнения *Java Runtime* и другие инструменты для разработки. В первую очередь — компиллятор;
* **Gradle** — инструмент для сборки Java-проектов.

## Windows

Мы рекомендуем работать в *nix-системах, так как они наиболее совместимы с языками программирования и софтом, который нужен для обучения на Хекслет.

Если вы работаете на Windows, установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит получить все преимущества Linux без переустановки системы. Далее воспользуйтесь [инструкцией для Ubuntu](#менеджеры-linux) для установки софта.

Если такой возможности нет, то скачайте инсталятор [тут](https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot) и выполните его. Затем установите Gradle по [инструкции официального сайта(https://gradle.org/install/)

## macOS Homebrew

Установка производится пакетным менеджером Homebrew. Если он ещё не установлен, откройте терминал и выполните следующую команду:

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Установка:

```shell
# Java
brew install openjdk
# Сборщик проектов
brew install gradle
```

## Менеджеры Linux

### Debian

Для Debian-дистрибутивов, таких, как Ubuntu, используйте пакетный менеджер *apt*:

Установка JDK:

```shell
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt update
sudo apt install -y openjdk-17-jdk
```

Установка Gradle:
```shell
sudo add-apt-repository ppa:cwchien/gradle
sudo apt update
sudo apt install -y gradle
```
