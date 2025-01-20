## Установка tmux
[**tmux**](https://github.com/tmux/tmux) позволяет создавать, разделять, управлять, отсоединять и подключаться к терминальным сессиям в рамках одной программы.

**На Linux**
```bash
sudo apt update
sudo apt install tmux
```

**На macOS**
```bash
brew install tmux
```

**Проверить версию**
```bash
tmux -V
```

## Испоьзование tmux

**Запуск новой сессии**
```bash 
tmux new -s session_name
```

**Использование существущей сессии**
```bash 
tmux attach -t session_name
```

**Список существующих сессий**
```bash 
tmux list-sessions
```

**Завершить сессию**
```bash
exit
# or Ctrl d
```

**Отключение от сессии без ее завершения**
```bash
Ctrl+b d
```

**Справка по коммандам**
```bash
Ctrl+b ?
```

**Завершение всех сессий**
```bash
tmux kill-server
```
