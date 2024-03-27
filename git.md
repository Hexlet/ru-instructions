# Установка git

Установка Git отличается в разных операционных системах. Проще всего она выполняется в MacOS и Ubuntu. Они позволяют поставить Git через пакетные менеджеры:

```bash
# MacOS
# https://brew.sh/
brew install git

# Ubuntu
sudo apt update # на всякий случай смотрим новые версии
sudo apt install git-all
```

В Windows для установки Git существует масса вариантов. Основной — через установку [Ubuntu on Windows](https://docs.microsoft.com/ru-ru/windows/wsl/install-win10) и затем [git](https://docs.microsoft.com/ru-ru/windows/wsl/tutorials/wsl-git). Эта настройка может потребовать время, но оно того стоит. Ubuntu on Windows добавляет разработчикам окружение, которое позволяет работать максимально эффективно и удобно. Кроме того, такое окружение очень похоже на среду, в которой будет запускаться код ваших проектов.

В случае если ваш Windows не поддерживает опции, указанные выше, есть несколько альтернативных вариантов:

1. Самый смелый: установить Ubuntu основной системой. Это очень просто.
1. Поставить Ubuntu в виртуальную машину. Наиболее безопасный способ, но требует достаточно мощного компьютера.

После установки Git нужно зайти в терминал и проверить, что он работает:

```bash
git --version

git version 2.28.0
# Ваша версия может отличаться, но важно, чтобы она была не ниже 2.23.0
```

Если у вас установилась более старая версия git, и вы работаете в Ubuntu или Ubuntu on Windows, то попробуйте выполнить следующие команды:

```bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

После установки Git нужно настроить. Для своей работы ему важно знать ваше имя и почту. Эти данные подставляются в историю изменений. Только так можно узнать, кто и что сделал в проекте:

```bash
# Выполняется из любой директории
git config --global user.name "<имя фамилия>"
git config --global user.email "<ваш емейл>"
```

## Установка редактора

Для дальнейшей работы понадобится специализированный редактор кода. Мы рекомендуем ставить [VSCode](https://code.visualstudio.com/). Сейчас это самый популярный (бесплатный!) редактор, обладающий не только широкими возможностями, но и обширной системой плагинов, позволяющих серьезно «прокачать» редактор.

## Аккаунт на GitHub

Также для работы понадобится создать аккаунт на [GitHub](https://github.com/) — это бесплатный (для одиночного использования) сервис, в котором хранят свои проекты большинство компаний и разработчиков. Его же используют рекрутеры для поиска сильных программистов. Они смотрят код и оценивают, насколько он популярный и сложный. GitHub-аккаунт с высокой активностью в проектах (своих или чужих) — один из ключевых элементов в трудоустройстве.

После создания аккаунта нужно выполнить еще одну важную операцию — добавления [ssh-ключей](https://guides.hexlet.io/ru/ssh/) на github.com. Если по-простому, то ключи позволяют работать репозиториям с GitHub без необходимости постоянно вводить логин и пароль при синхронизации локального и удаленного репозитория (находящегося на GitHub).

Эта задача выполняется в два этапа. Сначала нужно сгенерировать ssh-ключи, а затем один из них (публичный) добавить в настройки GitHub. Подробная инструкция по созданию ssh-ключей доступна на [сайте](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). В двух словах:

```bash
# Создание ssh-ключей
ssh-keygen -t ed25519  -C "your_email@example.com"
# Дальше будет несколько вопросов. На все вопросы нужно нажимать Enter.

# Запуск агента ssh, который следит за ключами
eval "$(ssh-agent -s)"

# Добавления нового ssh-ключа в агент
ssh-add ~/.ssh/id_ed25519
```

Когда ssh-ключи созданы и добавлены в систему, можно приступать к интеграции с GitHub. Подробно эта процедура описана в [документации](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account). В двух словах:

1. Выведите содержимое файла *~/.ssh/id_ed25519.pub* и скопируйте его:

    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```

1. [Добавьте](https://github.com/settings/keys) ssh-ключ в аккаунт GitHub. При добавлении вас попросят назвать ключ. Напишите что-нибудь в стиле *home*.

1. Проверьте, что подключение работает

    ```bash
    ssh -T git@github.com
    Hi tirion! You've successfully authenticated, but GitHub does not provide shell access.
    ```

## Возможные проблемы

### Github просит логин и пароль

```bash
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
fatal: Authentication failed for 'https://github.com/tirion/hexlet-git.git/'
```

Проверьте, что в в репозитории стоит ссылка на SSH url

```bash
git remote -v
origin	git@github.com:<username>/<repo>.git (fetch)
origin	git@github.com:<username>/<repo>.git (push)
```

Если это не так, то ссылку нужно обновить 

```bash
git remote set-url origin git@github.com:<username>/<repo>.git
```
