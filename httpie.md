# Установка HTTPie

Процесс установки HTTPie зависит от вашей операционной системы

## Установка HTTPie на Linux (Ubuntu, Debian, Mint и др.)

```bash
curl -SsL https://packages.httpie.io/deb/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/httpie.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | sudo tee /etc/apt/sources.list.d/httpie.list > /dev/null
sudo apt update
sudo apt install httpie
```

## Установка HTTPie на Linux (Arch, Manjaro, EndeavourOS и др.)

```bash
curl -SsL https://packages.httpie.io/deb/KEY.gpg | sudo gpg --dearmor -o /usr/share/pacman/keyrings/httpie.gpg
echo "deb [arch=amd64 signed-by=/usr/share/pacman/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | sudo tee /etc/apt/sources.list.d/httpie.list > /dev/null
sudo pacman -Sy
sudo pacman -S httpie
```

## Установка HTTPie на macOS

Вы можете установить Postman на MacOS, используя менеджер пакетов [Homerbrew](https://brew.sh/)

```bash
brew update
brew install httpie
```

## Установка HTTPie на Windows

Для установки вам потребуется пакетный менеджер [Chocolatey](https://chocolatey.org/). Если он не установлен, установите его по инструкции на [официальном сайте](https://chocolatey.org/install)

Для установки HTTPie выполните команду

```bash
choco install httpie
```

## Как проверить, что установка прошла успешно

Чтобы проверить, что установка прошла успешно, выполните команду:

```bash
http --version

# Версия может отличаться
# Главное - что команда выполнилась успешно
3.2.1
```
