# Инструкция по установке terraform

Перед установкой нужно установить [vpn](https://github.com/Hexlet/hexlet-unblock#vpn)
Чтобы заработал Terraform Cloud

## Ubuntu

Чтобы установить Terraform на Ubuntu, следуйте этим шагам:


- Откройте терминал и обновите список пакетов:

```bash
sudo apt update
```

- Установите необходимые пакеты для загрузки и установки:

```bash
sudo apt install wget unzip
```

- Перейдите в папку, в которую вы хотите установить ПО, например:

```bash
cd ~
```

- Загрузите последнюю версию с веб-сайта Hashicorp:

```bash
wget https://releases.hashicorp.com/terraform/0.x.x/terraform_0.x.x_linux_amd64.zip
```
Замените 0.x.x на нужную вам версию. Найти список доступных версий вы сможете на [странице релизов](https://releases.hashicorp.com/terraform).


- Распакуйте архив:

```bash
unzip terraform_0.x.x_linux_amd64.zip
```

- Переместите распакованный файл в папку /usr/local/bin:

```bash
sudo mv terraform /usr/local/bin/
```

- Проверьте версию Terraform и убедитесь, что он установлен и доступен:


```bash
terraform -v
```

## Менеджер версий asdf

Установка:

```bash
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
```
Ссылка на [плагин](https://github.com/asdf-community/asdf-hashicorp)
Использование:

Посмотрите [asdf](https://asdf-vm.com/guide/getting-started.html) для получения инструкций о том, как устанавливать версии и управлять ими.

## Windows

Перейдите по ссылке и [скачайте](https://developer.hashicorp.com/terraform/downloads) нужную вам версию

После загрузки разархивируйте содержимое в удобную для вас папку. Например, в C:\Terraform

Рекомендуется использовать wsl

Последняя версия установлена. Но через командную строку ей можно пользоваться только указав к ней полный путь:

```bash
C:\Windows\system32>terraform -v
```

```bash
'terraform' is not recognized as an internal or external command,
operable program or batch file.
```
```bash
C:\Windows\system32>C:\Terraform\terraform -v
```
```bash
Terraform v1.3.6
on windows_amd64
```

## Чтобы в командной строке обращаться к Terraform просто с помощью названия этого инструмента, необходимо добавить его в переменную окружения PATH. Для этого следуйте этой инструкции:

- Откройте «Панель управления» и перейдите в раздел «Система и безопасность».
- В разделе «Система» нажмите на ссылку «Изменение системных переменных среды».
- В открывшемся окне «Свойства системы» перейдите на вкладку «Дополнительно».
- Нажмите на кнопку «Переменные среды».
- В списке «Системные переменные» найдите переменную PATH и нажмите на кнопку «Изменить».
- В открывшемся окне «Изменение переменной среды» нажмите «Создать» и укажите путь к директории, в которую вы разархивировали Terraform. В нашем случае Terraform был установлен в папку C:\Terraform. 
- Нажмите «ОК».

Проверим успешность операции в командной строке:

```bash
terraform -v
```
```bash
Terraform v1.3.6
on windows_amd64
```


## MacOs

Первым делом установим менеджер пакетов [Homebrew](https://brew.sh/).


Для установки Homebrew вы можете воспользоваться командой:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

В данном руководстве рассматривается установка при помощи терминального эмулятора [iTerm2](https://iterm2.com/).

- Подключаем репозиторий с формулами для Homebrew с помощью команды:

```bash
brew tap hashicorp/tap
```

- Запустим установку Terraform с помощью команды:

```bash
brew install hashicorp/tap/terraform

```

- Далее можно посмотреть установленную версию Terraform с помощью команды:

```bash
terraform -version
```

## Все готово для использования Terraform.