# Установка mise

mise это менеджер версий. Он скачивает языки и инструменты нужной версии в домашний каталог и переключает их без `sudo`, поэтому одна программа заменяет nvm, pyenv, asdf и похожие менеджеры. В наших инструкциях mise рекомендованный способ установки для Linux и macOS. Документация проекта лежит на сайте [mise.jdx.dev](https://mise.jdx.dev/).

Владельцам Windows мы рекомендуем настроить Windows Subsystem for Linux (WSL) по [гайду](https://ru.hexlet.io/blog/posts/ubuntu-linux-in-windows) и ставить mise внутри Ubuntu по разделу для Linux.

## Linux и WSL

В Ubuntu оболочка по умолчанию Bash. Скрипт установки кладёт mise в _~/.local/bin/mise_ и дописывает в _~/.bashrc_ строку, которая подключает mise к оболочке. Для загрузки скрипта нужна утилита `curl`.

```bash
sudo apt update
sudo apt install -y curl
curl -fsSL https://mise.run/bash | sh
```

Если вы пользуетесь Zsh, замените в адресе `bash` на `zsh`, и строка подключения попадёт в _~/.zshrc_.

## macOS

В macOS оболочка по умолчанию Zsh, и `curl` в системе уже есть.

```bash
curl -fsSL https://mise.run/zsh | sh
```

Если у вас стоит Homebrew, mise можно поставить им. Строку подключения к оболочке тогда добавьте сами.

```bash
brew install mise
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
```

## Проверка

Перезапустите терминал, чтобы оболочка прочитала строку подключения, и выполните команды.

```bash
mise --version
# Вывод может отличаться
2026.11.9 linux-x64 (2026-11-16)

mise doctor
# Неполный вывод
activated: yes
```

Строка `activated: yes` в выводе `mise doctor` означает, что mise подключён к оболочке и установленные им программы будут запускаться по имени. Если там `activated: no`, проверьте, что в _~/.bashrc_ (или _~/.zshrc_) есть строка с `mise activate`, и снова перезапустите терминал.

## Установка языков и инструментов

Команда `mise use -g` скачивает указанную версию и делает её версией по умолчанию для вашего пользователя. Например, Node.js 26 ставится так.

```bash
mise use -g node@26
node -v
```

Выбранные версии mise записывает в _~/.config/mise/config.toml_. Список установленного показывает `mise ls`, а `mise upgrade` ставит свежие выпуски в пределах выбранных версий, то есть для `node@26` последний Node.js 26.

Команды для конкретных языков и инструментов лежат в их инструкциях.

- [Node.js](/nodejs.md)
- [Python](/python.md)
- [Java](/java.md)
- [Go](/go.md)
- [Ruby](/ruby.md)
- [.NET](/dotnet.md)
- [uv](/uv.md)
- [Terraform](/terraform.md)
- [Kubernetes (kubectl + minikube)](/kubernetes.md)
- [Velero](/velero.md)

## Версии проекта

Проект может требовать свою версию языка. Если в каталоге проекта лежит файл _mise.toml_ или _.tool-versions_ от asdf, mise при входе в каталог переключается на версии из этого файла. Недостающие версии ставит команда `mise install`, которую запускают в каталоге проекта. Файлу из чужого репозитория mise сначала не доверяет и попросит подтвердить его командой `mise trust`.
