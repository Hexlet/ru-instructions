# Установка Ansible

## Требования для узла управления

В качестве узла управления (так называется машина, на которой запускается Ansible) вы можете использовать практически любую UNIX-подобную систему: Linux, macOS или WSL в Windows. Свежий Ansible требует Python 3.13 или новее. В Ubuntu 26.04 системный Python 3.14 подходит, а в Ubuntu 24.04 стоит Python 3.12. Поэтому Ansible ставится через [uv](/uv.md), он сам скачает подходящую версию Python и не затронет системную.

## Выбор версии Ansible

Ansible-пакеты распространяются в двух основных формах:

1) Облегчённый пакет, именуемый `ansible-core`;
2) Стандартный пакет, именуемый `ansible`, который включает в себя также подборку Ansible-Коллекций для автоматизации различных видов устройств.

Инструкции ниже даны для установки пакета `ansible`.

## Установка и обновление Ansible

### Установка uv

Если uv ещё не установлен, поставьте его по [инструкции](/uv.md) и проверьте, что команда доступна:

```bash
uv --version
```

### Установка Ansible

Выполните следующую команду, чтобы установить пакет Ansible:

```bash
# --with-executables-from добавляет команды ansible, ansible-playbook и другие из ansible-core
# --python 3.14 фиксирует версию Python, на которой проверена работа Ansible
uv tool install --python 3.14 --with-executables-from ansible-core ansible
```

Команда `pip install --user ansible` из старых инструкций в Ubuntu 24.04 и новее завершается ошибкой `externally-managed-environment`, потому что системный Python запрещает ставить пакеты в обход apt.

### Обновление Ansible

Команда ниже позволяет обновить установленный Ansible до наиболее актуальной версии:

```bash
uv tool upgrade ansible
```

### Подтверждение правильности установки

Для проверки правильности установки введите следующую команду:

```bash
ansible --version
```

Вы должны увидеть следующее сообщение (может отличаться деталями):

```text
ansible [core 2.21.6]
  config file = None
  configured module search path = ['/home/username/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/username/.local/share/uv/tools/ansible/lib/python3.14/site-packages/ansible
  ansible collection location = /home/username/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/username/.local/bin/ansible
  python version = 3.14.4 (main, Aug 20 2026, 10:41:58) [GCC 15.2.0] (/home/username/.local/share/uv/tools/ansible/bin/python)
  jinja version = 3.1.6
  pyyaml version = 6.0.3 (with libyaml v0.2.5)
```

Также можно проверить, что Ansible выполняет команды, запустив модуль `ping` на своей машине:

```bash
ansible localhost -m ping

localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

Таким образом, Ansible был успешно установлен.
