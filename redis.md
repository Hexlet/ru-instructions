# Установка Redis

Перед тем как начать, убедитесь, что:

- Вы используете операционную систему, удобную для разработки (например Ubuntu, MacOS). Владельцам Windows мы рекомендуем настроить Windows Subsystem for Linux (WSL). О том, как это сделать мы написали [гайд](https://ru.hexlet.io/blog/posts/ubuntu-linux-in-windows).
- Вы знаете, как запустить терминал, и можете выполнить команды в нём
- Вы знакомы с основами Git

## Windows

Мы рекомендуем работать в \*nix-системах, так как они наиболее совместимы с языками программирования и софтом, который
нужен для обучения на Хекслет.

Если вы работаете на Windows,
установите [Windows Subsystem for Linux](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) (WSL). Это позволит
получить все преимущества Linux без переустановки системы. Далее
воспользуйтесь [инструкцией для Linux](#linux) для установки софта.

Поскольку Redis официально не поддерживается на Windows, установка на WSL2 является единственным способом установить Redis на Windows.

## macOS

Установка производится с помощью пакетного менеджера Homebrew. Перед началом установки убедитесь, что он установлен на вашей системе с помощью команды:

```bash
brew --version
```

Если команда завершилась с ошибкой, установите Homebrew командой:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Установка Redis:

```bash
brew install redis
```

## Linux

Добавьте репозиторий Redis в apt индекс с помощью команды:

```bash
sudo add-apt-repository ppa:redislabs/redis
```

или:

```bash
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
```

Далее обновите индекс и установите Redis с помощью:

```bash
sudo apt-get update
sudo apt-get install redis
```

## Дополнительные способы

### Snapcraft

Если на вашем Linux дистрибутиве доступен [Snapcraft store](https://snapcraft.io/store), то вы можете установить Redis командой:

```bash
sudo snap install redis
```

### Source-код

При желании вы также можете скомпилировать и установить Redis из Source-кода проекта. Для этого выполните следующие действия:

- Скачайте самую свежую стабильную версию Redis:

```bash
wget https://download.redis.io/redis-stable.tar.gz
```

- Скомпилируйте скачанные файлы:

```bash
tar -xzvf redis-stable.tar.gz
cd redis-stable
make
```

- Запустите установку:

```bash
make install
```

### Docker

Наконец, вы также можете установить Redis через Docker командой:

```bash
docker run --name local-redis -d redis/redis-stack-server
```

## Подключение

### Локальное подключение

После установки Redis сервер нужно запускать вручную командой:

```bash
redis-server
```

Пример запуска:

````bash
redis-server
11760:C 07 Dec 2021 18:25:26.103 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
11760:C 07 Dec 2021 18:25:26.103 # Redis version=6.2.6, bits=64, commit=00000000, modified=0, pid=11760, just started
11760:C 07 Dec 2021 18:25:26.103 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
11760:M 07 Dec 2021 18:25:26.104 * Increased maximum number of open files to 10032 (it was originally set to 256).
11760:M 07 Dec 2021 18:25:26.104 * monotonic clock: POSIX clock_gettime
                _._
           _.-``__ ''-._
      _.-``    `.  `_.  ''-._           Redis 6.2.6 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 11760
  `-._    `-._  `-./  _.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |           https://redis.io
  `-._    `-._`-.__.-'_.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |
  `-._    `-._`-.__.-'_.-'    _.-'
      `-._    `-.__.-'    _.-'
          `-._        _.-'
              `-.__.-'

11760:M 07 Dec 2021 18:25:26.105 # Server initialized
11760:M 07 Dec 2021 18:25:26.105 * Ready to accept connections
````

Такой способ подходит для академических целей, но не используется в производственных окружениях. Обычно Redis сервер запускается как [демон (daemon)](<https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BC%D0%BE%D0%BD_(%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B0)>):

```bash
redis-server --daemonize yes
```

Также можно запустить Redis как сервис командой:

```bash
sudo service redis-server start
```

Когда сервер запущен, можно попробовать подключиться к нему с помощью утилиты redis-cli:

```bash
redis-cli

127.0.0.1:6379>
```

Чтобы удостовериться, что сервер работает корректно, достаточно запустить команду info:

```bash
127.0.0.1:6379> info
# Server
redis_version:6.2.6
redis_git_sha1:00000000
redis_git_dirty:0
redis_build_id:c6f3693d1aced7d9
redis_mode:standalone
os:Darwin 19.5.0 x86_64
arch_bits:64
...
```

### macOS

В качестве альтернативы, на macOS вы можете запустить Redis в фоновом режиме с использованием launchd данной командой:

```bash
brew services start redis
```

После запуска вы можете проверить статус Redis, запустив:

```bash
brew services info redis
```

Если сервис запущен, вы увидите нечто подобное:

```bash
redis (homebrew.mxcl.redis)
Running: ✔
Loaded: ✔
User: miranda
PID: 67975
```

Для остановки сервиса, воспользуйтесь командой:

```bash
brew services stop redis
```

### Подключение с Docker

В разделе установки через Docker Redis сервер запускается в контейнере с именем local-redis. Используем это же имя для подключения:

```bash
docker exec -it local-redis redis-cli
```
