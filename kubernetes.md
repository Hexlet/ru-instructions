# Установка Kubernetes (kubectl + minikube)

Перед началом убедитесь, что:

- у вас есть терминал и вы умеете запускать команды
- система поддерживает виртуализацию (BIOS/UEFI) и она включена
- свободно хотя бы 2 CPU и 4–8 ГБ памяти
- в Windows используется WSL2

Ниже показан минимальный путь для обучения: установить `kubectl` и локальный кластер через `minikube`.

- [kubectl: установка и команды](https://kubernetes.io/docs/tasks/tools/)
- [minikube: установка](https://minikube.sigs.k8s.io/docs/start/)
- [Kubernetes Basics (интерактивный туториал)](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [kubectl Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## Установка kubectl

### macOS

```bash
brew install kubectl
```

### Linux

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

### Windows

Если установлен Chocolatey:

```powershell
choco install kubernetes-cli
```

Или установите вручную [по инструкции](https://kubernetes.io/docs/tasks/tools/) из официальной документации.

## Установка minikube

### macOS

```bash
brew install minikube
```

### Linux

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### Windows

Если установлен Chocolatey:

```powershell
choco install minikube
```

Или следуйте [официальной инструкции](https://minikube.sigs.k8s.io/docs/start).

## Запуск кластера

```bash
minikube start
```

Minikube создаст локальный кластер и настроит kubeconfig автоматически.

## Проверка установки

```bash
kubectl version --client
kubectl cluster-info
kubectl config current-context
```

Если версия клиента выводится, `cluster-info` показывает адрес API-сервера, а контекст установлен — можно переходить к практическим заданиям.
