# Установка Java

Для работы с Java понадобятся:

* **Java Development Kit (JDK)** — набор, включающий в себя среду исполнения *Java Runtime* и другие инструменты для разработки. В первую очередь — компилятор;
* **Gradle** — инструмент для сборки Java-проектов.

## Windows

Мы рекомендуем работать в *nix-системах, так как они наиболее совместимы с языками программирования и софтом, который нужен для обучения на Хекслет.

Если вы работаете на Windows, установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит получить все преимущества Linux без переустановки системы. Далее воспользуйтесь [инструкцией для Ubuntu](#ubuntu,-debian) для установки софта.

Если такой возможности нет, то скачайте инсталлятор [тут](https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot) и выполните его. Затем установите Gradle по [инструкции официального сайта](https://gradle.org/install/)

## macOS Homebrew

Установка производится пакетным менеджером Homebrew. Если он ещё не установлен, откройте терминал и выполните следующую команду:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Установка:

```bash
# Java
brew install openjdk@17

# Сборщик проектов
brew install gradle
```

## Ubuntu, Debian

Установка:

```bash
sudo apt update
sudo apt install -y software-properties-common

# Java
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt install -y openjdk-17-jdk

# Сборщик проектов
sudo add-apt-repository ppa:cwchien/gradle
sudo apt install -y gradle
```
