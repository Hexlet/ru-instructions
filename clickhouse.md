# Установка ClickHouse

ClickHouse состоит из сервера, который хранит таблицы и выполняет запросы, и клиента, через который мы отправляем серверу SQL. Обе программы собраны в один исполняемый файл `clickhouse`, поэтому вместе с сервером всегда ставится и клиент.

Перед тем как начать, убедитесь, что вы умеете запускать терминал и выполнять в нём команды.

## Windows

ClickHouse не работает в Windows напрямую. Установите [Windows Subsystem for Linux](https://learn.microsoft.com/ru-ru/windows/wsl/install) (WSL), о настройке мы написали [гайд](https://ru.hexlet.io/blog/posts/ubuntu-linux-in-windows). Дальше команды выполняются в терминале Ubuntu по [инструкции для Linux](#linux) или через [Docker](#docker).

## Docker

Самый короткий путь подходит для любой системы, где установлен [Docker](/docker.md). Сервер запускается в отдельном контейнере `course-clickhouse` из официального образа с тегом `lts`, клиент входит в тот же образ. Это имя контейнера используется в командах курса ClickHouse на Хекслете.

```bash
docker run -d \
  --name course-clickhouse \
  --ulimit nofile=262144:262144 \
  -e CLICKHOUSE_SKIP_USER_SETUP=1 \
  clickhouse:lts
```

Первый запуск загружает образ и может занять несколько минут. Переменная `CLICKHOUSE_SKIP_USER_SETUP=1` оставляет пользователя `default` без пароля. Порты наружу не открываются, клиент работает внутри контейнера, поэтому такой сервер доступен только через `docker exec`.

Проверьте, что сервер отвечает.

```bash
docker exec course-clickhouse clickhouse-client --query 'SELECT version()'
```

Команда выводит номер версии сервера. Если клиент сообщает об отказе соединения, сервер ещё запускается, и через несколько секунд команду стоит повторить. Если ответа нет дольше 30 секунд, причину покажет журнал контейнера.

```bash
docker logs course-clickhouse
```

Интерактивный клиент открывается так.

```bash
docker exec -it course-clickhouse clickhouse-client
```

Контейнер сохраняет данные между остановками. Остановить его можно командой `docker stop course-clickhouse`, снова запустить командой `docker start course-clickhouse`.

## Linux

В Ubuntu и Debian ClickHouse ставится из официального репозитория пакетов. Сначала добавьте ключ и сам репозиторий.

```bash
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL 'https://packages.clickhouse.com/rpm/lts/repodata/repomd.xml.key' | sudo gpg --dearmor -o /usr/share/keyrings/clickhouse-keyring.gpg
ARCH=$(dpkg --print-architecture)
echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg arch=${ARCH}] https://packages.clickhouse.com/deb lts main" | sudo tee /etc/apt/sources.list.d/clickhouse.list
sudo apt-get update
```

Затем установите сервер и клиент.

```bash
sudo apt-get install -y clickhouse-server clickhouse-client
```

Во время установки пакет спрашивает пароль пользователя `default`. Для учебного сервера на своём компьютере поле можно оставить пустым и нажать Enter. Если пароль задан, клиент запускается с флагом `--password` и запрашивает его.

Запустите сервер и проверьте, что он отвечает.

```bash
sudo service clickhouse-server start
clickhouse-client --query 'SELECT version()'
```

Интерактивный клиент открывается командой `clickhouse-client`. Сервер останавливается командой `sudo service clickhouse-server stop`.

## macOS

На macOS ClickHouse скачивается одним файлом скриптом с официального сайта.

```bash
mkdir ~/clickhouse && cd ~/clickhouse
curl https://clickhouse.com/ | sh
```

В каталоге появится исполняемый файл `clickhouse`. Сервер запускается из этого каталога и хранит данные рядом с файлом.

```bash
./clickhouse server
```

Сервер занимает терминал, пока работает. Клиент открывается во втором терминале из того же каталога.

```bash
cd ~/clickhouse
./clickhouse client
```

Остановить сервер можно сочетанием клавиш Ctrl+C в его терминале. Тот же способ работает и в Linux, если ставить пакеты не хочется.

## Проверка установки

В клиенте выполните запрос.

```sql
SELECT version();
```

Клиент выводит номер версии, например `26.8.36.3`. Из клиента выходят командой `exit`.

## Если сервер не запускается

Свежие версии ClickHouse на x86-64 используют инструкции процессора AVX2. На процессорах без них, например Intel до 2013 года, программа `clickhouse` завершается сразу после запуска. В терминале это выглядит как сообщение `Illegal instruction`, установка пакетов в Linux заканчивается ошибкой `dpkg: error processing package clickhouse-server`, а контейнер Docker останавливается с кодом 132 и пустым журналом.

Проверить процессор можно командой в Linux или WSL.

```bash
grep -c avx2 /proc/cpuinfo
```

Если команда выводит `0`, инструкций AVX2 нет. В этом случае подойдёт более ранняя версия, например образ `clickhouse:25.3` в Docker. Он запускается той же командой, что и выше, с другим тегом в конце.
