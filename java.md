# Установка Java

Для работы с Java понадобятся:

* **Java Development Kit (JDK)** — набор, включающий в себя среду исполнения *Java Runtime* и другие инструменты для разработки. В первую очередь — компиллятор;
* **Gradle** — инструмент для сборки Java-проектов.

Установку можно выполнить с помощью пакетного менеджера:
* [WSL в Windows](#windows-wsl)
* [Homebrew в macOS](#macos-homebrew)
* [Менеджеры Linux](#менеджеры-linux)

Или же выполнить [ручную установку](#ручная-установка):
* [Windows](#windows)
* [macOS](#macos)
* [Linux](#linux)

Вам также может понадобиться [IDE для Java](#java-ide).

## Windows WSL

Мы рекомендуем работать в *nix-системах, так как они наиболее совместимы с языками программирования и софтом, который нужен для обучения на Hexlet.

Если вы работаете на Windows, установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит получить все преимущества Linux без переустановки системы.

Далее воспользуйтесь [инструкцией для Ubuntu](#менеджеры-linux) для установки софта. 


## macOS Homebrew

Установка производится пакетным менеджером Homebrew. Если он ещё не установлен, откройте терминал и выполните следующую команду:

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Запустите [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) - это понадобится для установки JDK.
```shell
brew tap adoptopenjdk/openjdk
```

Установка JDK:
```shell
brew cask install homebrew/cask-versions/java11
```

Установка Gradle:
```shell
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
sudo apt install -y openjdk-11-jdk
```

Установка Gradle:
```shell
sudo add-apt-repository ppa:cwchien/gradle
sudo apt update
sudo apt install -y gradle
```

### Другие дистрибутивы

Есть множество способов установки JDK, но наиболее простым является 
менеджер SDKMAN.

Установка SDKMAN:
```shell
curl -s "https://get.sdkman.io" | bash
```

Установка JDK:
```shell
sdk install java 11.0.2-open
```

Установка Gradle:
```shell
sdk install gradle
```


## Ручная установка

Выполнять ручную установку рекомендуется только опытным пользователям, хорошо знакомым со своей системой, установкой переменных окружения и прочими механизмами. Если у вас нет такого опыта, лучше выбрать установку пакетным менеджером. 

### Windows

Ручная установка JDK:
1. Скачайте **OpenJDK 11 (LTS)** из [AdoptOpenJDK](https://adoptopenjdk.net/releases.html?variant=openjdk11#x64_win)
1. Запустите установщик с настройками по умолчанию.

Ручная установка Gradle:
1. Скачайте "Binary only" дистрибутив с [сайта Gradle](https://gradle.org/install/).
1. Распакуйте архив в домашнюю директорию, например, `C:\Users\JohnDoe\Tools`.
1. Добавьте переменную окружения `GRADLE_HOME`, указав путь к распакованным файлам, например, `C:\Users\JohnDoe\Tools\gradle-x.y`.
1. Добавьте в переменную `PATH` путь к исполняемым файлам из каталога *bin* примерно таким образом: `path=...;%GRADLE_HOME%\bin`.


### macOS

Ручная установка JD

Ручная установка JDK:
1. Скачайте **OpenJDK 11 (LTS)** из [AdoptOpenJDK](https://adoptopenjdk.net/releases.html?variant=openjdk11#x64_win)
1. Запустите установщик с настройками по умолчанию.


Ручная установка Gradle:
1. Скачайте "Binary only" дистрибутив с [сайта Gradle](https://gradle.org/install/).
1. Распакуйте архив:
    ```shell
    mkdir ~/tools
    cd ~/tools
    unzip ~/Downloads/gradle-*-bin.zip
    cd gradle*
    ```
1. Конфигурация Gradle и добавление в `PATH`:
    ```shell
    cat << DONE >> ~/.bashrc
    export GRADLE_HOME=`pwd`
    export PATH=\$PATH:\$GRADLE_HOME/bin
    ```

### Linux

Ручная установка JDK:
1. Скачайте **OpenJDK 11 (LTS)** из [AdoptOpenJDK](https://adoptopenjdk.net/releases.html?variant=openjdk11#x64_win)
1. Запустите установщик с настройками по умолчанию.


Ручная установка Gradle:
1. Скачайте "Binary only" дистрибутив с [сайта Gradle](https://gradle.org/install/).
1. Распакуйте архив:
    ```shell
    mkdir ~/tools
    cd ~/tools
    unzip ~/Downloads/gradle-*-bin.zip
    cd gradle*
    ```
1. Конфигурация Gradle и добавление в `PATH`:
    ```shell
    cat << DONE >> ~/.bashrc
    export GRADLE_HOME=`pwd`
    export PATH=\$PATH:\$GRADLE_HOME/bin
    ```

## Java IDE

Существуют различные Java IDE, наиболее популярные из них:
* [IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=linux) (версия "Community")
* [Eclipse](https://www.eclipse.org/downloads/)
* [NetBeans](https://netbeans.apache.org/download/index.html)
