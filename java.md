# Установка Java

Перед тем как начать, убедитесь, что:

* Вы используете операционную систему, удобную для разработки (например Ubuntu, MacOS). Владельцам Windows мы рекомендуем настроить Windows Subsystem for Linux (WSL). О том, как это сделать мы написали [гайд](https://guides.hexlet.io/ru/ubuntu-linux-in-windows/).
* Вы знаете, как запустить терминал, и можете выполнить команды в нём
* Вы знакомы с основами Git

Для работы с Java понадобятся:

* **Java Development Kit (JDK)** — набор, включающий в себя среду исполнения *Java Runtime* и другие инструменты для разработки. В первую очередь — компилятор;
* **Gradle** — инструмент для сборки Java-проектов.

## Используя менеджер пакетов

### MacOS

Пользователи MacOS могут установить последние версии JDK и Gradle при помощи пакетного менеджера Homebrew. Если он ещё не установлен, откройте терминал и выполните следующую команду:

```bash
# Установка Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Выполните в терминале команды:

```bash
# Установка JDK
brew install openjdk@20

# Установка сборщика проектов Gradle
brew install gradle
```

### Ubuntu Linux

Автоматически установить при помощи пакетного менеджера последнюю версию JDK 20 и Gradle 8.2 на Linux не получится. Воспользуйтесь менеджером версий *asdf* или скачайте архив с официального сайта

## Используя менеджер версий

* Установите менеджер версий asdf. О том, как это сделать, мы писали в гайде ["Что такое "Менеджер версий""](https://guides.hexlet.io/ru/version-managers/)
* Установите JDK, выполнив следующие команды:

    ```bash
    ## Устанавливаем JDK
    asdf plugin-add java https://github.com/halcyon/asdf-java.git
    asdf install java openjdk-20.0.1
    asdf global java openjdk-20.0.1

    ## Устанавливаем переменную окружения JAVA_HOME
    . ~/.asdf/plugins/java/set-java-home.bash
    ```

* Установите сборщик пакетов Gradle

    Перед установкой Gradle убедитесь, что у вас установлена утилита *unzip*, выполнив команду `unzip --version`. Если не установлен, установите его командой `sudo apt install unzip`

    ```bash
    ## Устанавливаем Gradle
    asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
    asdf install gradle 8.2
    asdf global gradle 8.2
    ```

## Используя пакеты с официального сайта

Последнюю версию JDK можно скачать [тут](https://adoptium.net/temurin/releases/?version=20). Выберите подходящий для Вашей операционной системы файл и скачайте его

Автоматического установщика для Linux нет, и по ссылке загрузится архив. Скачайте архив и распакуйте его в директорию */usr/lib/jvm*. Затем установите значение для переменной окружения `$JAVA_HOME` */usr/lib/jvm/jdk-20.0.1* и добавьте путь */usr/lib/jvm/jdk-20.0.1* в переменную `$PATH`. Конкретные действия будут зависеть от оболочки, которую вы используете. Например, если у вас стоит Bash, то порядок действий будет следующий:

```bash
# Из директории, куда скачали архив
mkdir /usr/lib/jvm
tar -zxf openjdk-20*_bin.tar.gz -С /usr/lib/jvm
## Имя конечной директории может отличаться, в зависимости от версии
echo 'export JAVA_HOME=/usr/lib/jvm/jdk-20.0.1' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/jdk-20.0.1/bin' >> $HOME/.bashrc
source $HOME/.bashrc
```

Если у вас стоит Zsh, то порядок действий будет тот же, но нужно заменить *.bashrc* на *.zshrc*.

Последнюю версию сборщика пакетов Gradle можно скачать [тут](https://gradle.org/releases/). Порядок действий практически не отличается от установки JDK. Скачайте архив, распакуйте его в директорию */opt/gradle* и добавьте путь */opt/gradle/gradle-8.2/bin* в переменную окружения `$PATH`

```bash
mkdir /opt/gradle
unzip -d /opt/gradle gradle-8.2-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-8.2/bin' >> $HOME/.bashrc
source $HOME/.bashrc
```

После того, как вы установили JDK и Gradle любым из вышеперечисленных методов, нужно перезапустить терминал. Проверить, успешно ли прошла установка можно запустив в терминале команды:

```bash
# Вывод может отличаться, главное чтобы не было ошибок

java --version

openjdk 20 2023-03-21
OpenJDK Runtime Environment Homebrew (build 20)
OpenJDK 64-Bit Server VM Homebrew (build 20, mixed mode, sharing)

gradle -v

-------------------------------------------------------
Gradle 8.1
-------------------------------------------------------
```
