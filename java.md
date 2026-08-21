# Установка Java

Перед тем как начать, убедитесь, что:

* Вы знаете, как запустить терминал, и можете выполнить команды в нём
* Вы знакомы с основами Git

Для работы с Java понадобятся:

* **Java Development Kit (JDK)** — набор, включающий в себя среду исполнения *Java Runtime* и другие инструменты для разработки. В первую очередь — компилятор;
* **Gradle** — инструмент для сборки Java-проектов.

Курсы рассчитаны на JDK 25 (последняя версия с длительной поддержкой) и Gradle 9.

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
brew install openjdk@25

# Установка сборщика проектов Gradle
brew install gradle
```

### Ubuntu Linux

Автоматически установить при помощи пакетного менеджера последнюю версию Gradle на Linux не получится. Воспользуйтесь менеджером версий *asdf* или скачайте архивы с официального сайта.

### Windows

Владельцам Windows мы рекомендуем настроить Windows Subsystem for Linux (WSL) и дальше идти по инструкции для Ubuntu. О том, как это сделать, мы написали [гайд](https://ru.hexlet.io/blog/posts/ubuntu-linux-in-windows).

Работать можно и в самой Windows, без WSL. Так проще, если курс связан с браузером: в WSL браузер и драйвер к нему приходится ставить отдельно, внутри подсистемы.

JDK ставится через *winget*, менеджер пакетов, встроенный в Windows. Откройте PowerShell и выполните:

```powershell
winget install EclipseAdoptium.Temurin.25.JDK
```

Gradle в winget нет, поэтому его ставят через *Scoop*. Если Scoop ещё не установлен:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

Дальше сам Gradle:

```powershell
scoop install gradle
```

Отдельно ставить Gradle нужно только для того, чтобы создать новый проект. В уже созданном проекте лежит Gradle Wrapper, и сборка запускается им: `.\gradlew.bat` вместо `gradle`.

## Используя менеджер версий (рекомендованный)

* Установите менеджер версий asdf. О том, как это сделать, мы писали в гайде ["Что такое Менеджер версий"](https://ru.hexlet.io/blog/posts/version-managers)
* Установите JDK, выполнив следующие команды:

    ```bash
    ## Устанавливаем JDK
    asdf plugin-add java https://github.com/halcyon/asdf-java.git
    asdf install java openjdk-25.0.2
    asdf global java openjdk-25.0.2

    ## Устанавливаем переменную окружения JAVA_HOME
    . ~/.asdf/plugins/java/set-java-home.bash
    ```

    Список доступных версий покажет команда `asdf list all java`.

* Установите сборщик пакетов Gradle

    Перед установкой Gradle убедитесь, что у вас установлена утилита *unzip*, выполнив команду `unzip --version`. Если не установлен, установите его командой `sudo apt install unzip`

    ```bash
    ## Устанавливаем Gradle
    asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
    asdf install gradle 9.7.0
    asdf global gradle 9.7.0
    ```

## Используя пакеты с официального сайта

Последнюю версию JDK можно скачать [тут](https://adoptium.net/temurin/releases/?version=25). Выберите подходящий для Вашей операционной системы файл и скачайте его

По ссылке загрузится архив. Скачайте архив и распакуйте его в директорию */usr/lib/jvm*. Затем установите значение для переменной окружения `$JAVA_HOME` */usr/lib/jvm/jdk-25.0.4* и добавьте путь */usr/lib/jvm/jdk-25.0.4* в переменную `$PATH`. Конкретные действия будут зависеть от оболочки, которую вы используете. Например, если у вас стоит Bash, то порядок действий будет следующий:

```bash
# Из директории, куда скачали архив
mkdir /usr/lib/jvm
tar -zxf OpenJDK25U-jdk_x64_linux_hotspot_25.0.4_7.tar.gz -C /usr/lib/jvm
## Имя конечной директории может отличаться, в зависимости от версии
echo 'export JAVA_HOME=/usr/lib/jvm/jdk-25.0.4' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/jdk-25.0.4/bin' >> $HOME/.bashrc
source $HOME/.bashrc
```

Если у вас стоит Zsh, то порядок действий будет тот же, но нужно заменить *.bashrc* на *.zshrc*.

Последнюю версию сборщика пакетов Gradle можно скачать [тут](https://gradle.org/releases/). Порядок действий практически не отличается от установки JDK. Скачайте архив, распакуйте его в директорию */opt/gradle* и добавьте путь */opt/gradle/gradle-9.7.0/bin* в переменную окружения `$PATH`

```bash
mkdir /opt/gradle
unzip -d /opt/gradle gradle-9.7.0-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-9.7.0/bin' >> $HOME/.bashrc
source $HOME/.bashrc
```

После того, как вы установили JDK и Gradle любым из вышеперечисленных методов, нужно перезапустить терминал. Проверить, успешно ли прошла установка можно запустив в терминале команды:

```bash
# Вывод может отличаться, главное чтобы не было ошибок

java --version

openjdk 25.0.4 2026-07-21 LTS
OpenJDK Runtime Environment Temurin-25.0.4+7 (build 25.0.4+7-LTS)
OpenJDK 64-Bit Server VM Temurin-25.0.4+7 (build 25.0.4+7-LTS, mixed mode, sharing)

gradle -v

-------------------------------------------------------
Gradle 9.7.0
-------------------------------------------------------
```
