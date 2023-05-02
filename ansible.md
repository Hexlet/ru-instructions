# Установка Ansible 
## Требования для узла управления
В качестве узла управления (так называется машина, на которой запускается Ansible) Вы можете использовать практически любую UNIX-подобную систему с установленным [Python](/python.md) версии 3.9 или новее.

## Выбор версии Ansible
Ansible-пакеты распространяются в двух основных формах: 
1) Облегчённый пакет, именуемый `ansible-core`;
2) Стандартный пакет, именуемый `ansible`, который включает в себя также подборку Ansible-Коллекций для автоматизации различных видов устройств. 

Инструкции ниже даны для установки пакета `ansible`.

## Установка и обновление Ansible
### Проверка версии Python
Перейдите с помощью консольной утилиты `cd` в директорию `/usr/bin/` и узнайте какие интерпретаторы `python` установлены в системе. К примеру, это можно сделать, используя следующую команду:

```$ ls | grep python```

Запомните необходимый вам интерпретатор (к примеру, `python3.10`). В инструкции ниже интерпретатор обозначен как `python3`. Таким образом, там, где в инструкции написано `python3`, вам необходимо указать интерпретатор, установленный в вашей системе.

### Проверка работоспособности модуля `pip`
Используйте следующую команду, чтобы проверить, установлен ли модуль `pip`:
```
$ python3 -m pip -V
```
Если модуль `pip` установлен правильно, должно появиться следующее сообщение (детали могут отличаться):
```
$ python3 -m pip -V
pip 21.0.1 from /usr/lib/python3.9/site-packages/pip (python 3.9)
```

Если вы увидели подобное сообщение, значит `pip` установлен правильно и можно переходить к установке непосредственно Ansible.

Если же на экране появилась ошибка вида `No module named pip`, то, перед продолжением установки Ansible, необходимо установить `pip`. Это означает установку нового пакета операционной системы (к примеру, `python3-pip`) или установку последней доступной версии `pip` напрямую из Python Packaging Authority с помощью следующей команды:
```
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
```
### Установка Ansible
Выполните следующую команду, чтобы установить пакет Ansible, используя `pip`:
```
$ python3 -m pip install --user ansible
```
### Обновление Ansible
Команда ниже позволяет обновить установленный Ansible до наиболее актуальной версии:
```
$ python3 -m pip install --upgrade --user ansible
```
### Подтверждение правильности установки
Для проверки правильности установки, введите следующую команду:
```
ansible --version
```
Вы должны увидеть следующее сообщение (может отличаться деталями):
```
config file = None
  configured module search path = ['/home/username/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/username/.local/lib/python3.10/site-packages/ansible
  ansible collection location = /home/username/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/username/.local/bin/ansible
  python version = 3.10.6 (main, Mar 10 2023, 10:55:28) [GCC 11.3.0] (/usr/bin/python3.10)
  jinja version = 3.1.2
  libyaml = True
```
Также проверить правильность установки можно, используя `pip`:
```
$ python3 -m pip show ansible
```
В этом случае должно появиться сообщение примерно такого содержания:
```
$ python3 -m pip show ansible                       

Name: ansible
Version: 7.4.0
Summary: Radically simple IT automation
Home-page: https://ansible.com/
Author: Ansible, Inc.
Author-email: info@ansible.com
License: GPLv3+
Location: /home/username/.local/lib/python3.10/site-packages
Requires: ansible-core
Required-by: 
```
Таким образом, Ansible был успешно установлен.
