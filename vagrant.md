# Инструкция по установке Vagrant

Vagrant — инструмент для создания и управления виртуальными машинами. Сам по себе он не
виртуализирует, а управляет **провайдером** — системой виртуализации. По умолчанию это
[VirtualBox](https://www.virtualbox.org/), но провайдер зависит от операционной системы и
архитектуры процессора (см. раздел про Apple Silicon ниже).

Поэтому установка состоит из двух шагов: поставить провайдер (обычно VirtualBox) и сам
Vagrant.

Перед установкой убедитесь, что:

- Вы умеете запускать терминал и выполнять в нём команды. Командная строка — основной
  способ работы с Vagrant.
- Если у вас Windows — настроен [WSL](https://learn.microsoft.com/ru-ru/windows/wsl/install).
  О том, как это сделать, есть [гайд](https://ru.hexlet.io/blog/posts/ubuntu-linux-in-windows/).

> **Пользователям из России:** часть сервисов (сайт HashiCorp, Vagrant Cloud, загрузка
> VirtualBox) может быть недоступна. Как это обойти — в разделе
> [«Зеркало для России»](#зеркало-для-россии).

## Ubuntu / Linux

Установите VirtualBox из репозитория дистрибутива:

```bash
sudo apt update
sudo apt install virtualbox
```

Установите Vagrant из официального apt-репозитория HashiCorp:

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install vagrant
```

Как вариант — можно скачать deb-пакет со [страницы загрузки](https://developer.hashicorp.com/vagrant/install).

## Windows

Работать с Vagrant на Windows рекомендуется через [WSL](https://learn.microsoft.com/ru-ru/windows/wsl/install) —
внутри него установка выполняется так же, как в разделе [Ubuntu / Linux](#ubuntu--linux).

Если WSL не используется, скачайте и установите два инсталлятора:

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://developer.hashicorp.com/vagrant/install) (выберите Windows)

После установки перезапустите терминал, чтобы `vagrant` появился в `PATH`.

## macOS

### Intel (процессоры Intel)

Проще всего установить через менеджер пакетов [Homebrew](https://brew.sh/):

```bash
brew install --cask virtualbox
brew install --cask vagrant
```

Либо скачайте установщики вручную: [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
и [Vagrant](https://developer.hashicorp.com/vagrant/install).

### Apple Silicon (M1/M2/M3 и новее)

На Apple Silicon **VirtualBox не рекомендуется**: поддержка ARM-архитектуры у него
экспериментальная и работает нестабильно. Вместо него используйте один из провайдеров
ниже. Команды и концепции Vagrant (`Vagrantfile`, `vagrant up`/`ssh`/`halt`/`destroy`,
провижининг) от выбора провайдера не зависят.

Сам Vagrant ставится через Homebrew:

```bash
brew install --cask vagrant
```

Далее выберите провайдер и установите плагин к нему:

- **UTM** + плагин [`vagrant_utm`](https://naveenrajm7.github.io/vagrant_utm/) —
  требуется UTM ≥ 4.6 и Vagrant ≥ 2.4.1:

  ```bash
  brew install --cask utm
  vagrant plugin install vagrant_utm
  vagrant init utm/bookworm
  vagrant up --provider=utm
  ```

- **QEMU** + плагин [`vagrant-qemu`](https://github.com/ppggff/vagrant-qemu)
  (есть ограничения с пробросом портов):

  ```bash
  brew install qemu
  vagrant plugin install vagrant-qemu
  vagrant up --provider=qemu
  ```

- **VMware Fusion** (бесплатен для личного использования) + плагин
  [`vagrant-vmware-desktop`](https://developer.hashicorp.com/vagrant/docs/providers/vmware).

- **Parallels** (платный, наиболее стабильный вариант) + плагин
  [`vagrant-parallels`](https://parallels.github.io/vagrant-parallels/).

> На Apple Silicon на практике используются **ARM64-боксы**. x86-боксы из учебных
> материалов (например `ubuntu/focal64`) лучше заменять на arm64-аналоги — см. раздел
> [«Боксы под Apple Silicon»](#боксы-под-apple-silicon).

## Проверка установки

Откройте терминал и убедитесь, что Vagrant работает:

```bash
vagrant -v
Vagrant 2.4.1
```

## Зеркало для России

Из России могут быть недоступны сайт HashiCorp (`releases.hashicorp.com`), каталог боксов
Vagrant Cloud (`app.vagrantup.com`) и загрузка VirtualBox. Есть несколько способов это
обойти.

### Зеркало для боксов

Укажите зеркало в переменной `VAGRANT_SERVER_URL` — проще всего прямо в начале
`Vagrantfile`:

```ruby
ENV['VAGRANT_SERVER_URL'] = 'https://vagrant.elab.pro'

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/focal64'
end
```

Зеркало `https://vagrant.elab.pro` из примера содержит образы для VirtualBox, включая `ubuntu/*`.

### Зеркало для установщика Vagrant

Если недоступен сайт HashiCorp, скачайте бинарник Vagrant с зеркала:

- `https://hashicorp-releases.yandexcloud.net/vagrant/`
- `https://hashicorp-releases.mcs.mail.ru/vagrant/`

> ⚠️ Используйте только доверенные зеркала: скачанный образ виртуальной машины исполняется
> у вас на компьютере, скомпрометированный бокс небезопасен.

## Боксы под Apple Silicon

На Apple Silicon (и любой ARM-архитектуре) на практике используются **ARM64-боксы**.
x86_64-боксы технически можно запустить через эмуляцию (UTM и QEMU это умеют), но она
работает заметно медленнее, поэтому если в задании указан x86-бокс (например
`ubuntu/focal64`), лучше заменить его на arm64-аналог. Например:

- `utm/bookworm` — Debian 12 (для провайдера UTM)
- `bento/ubuntu-22.04-arm64`
- `perk/ubuntu-2204-arm64`

Для боксов с несколькими провайдерами провайдер лучше указать явно:

```ruby
config.vm.provider 'utm'   # или qemu / vmware_desktop / parallels
```
