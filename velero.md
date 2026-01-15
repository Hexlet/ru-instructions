# Установка Velero

----
Перед началом убедитесь, что:

- установлен `kubectl` и есть доступ к кластеру
- настроен объектный стор (S3/GCS/Azure Blob или MinIO)
- у вас есть ключи доступа для выбранного сториджа

----

Ниже — минимальная установка Velero для бэкапа ресурсов Kubernetes и PVC.

## Установка CLI

<details><summary style="font-size:140%">Linux/macOS</summary>

```bash
VELERO_VERSION=1.12.0
curl -LO https://github.com/vmware-tanzu/velero/releases/download/v${VELERO_VERSION}/velero-v${VELERO_VERSION}-linux-amd64.tar.gz
tar -xvf velero-v${VELERO_VERSION}-linux-amd64.tar.gz
sudo mv velero-v${VELERO_VERSION}-linux-amd64/velero /usr/local/bin/
```

</details>

<details><summary style="font-size:140%">Windows</summary>

Скачайте архив с релизами Velero:
https://github.com/vmware-tanzu/velero/releases

Распакуйте `velero.exe` и добавьте папку в `PATH`.

</details>

## Установка в кластер (пример для AWS S3)

```bash
velero install \
  --provider aws \
  --bucket my-velero-backups \
  --secret-file ./credentials-velero \
  --backup-location-config region=us-east-1 \
  --use-node-agent \
  --default-volumes-to-fs-backup
```

Опции `--use-node-agent` и `--default-volumes-to-fs-backup` включают файловый бэкап PVC (Restic/Kopia).

## Проверка установки

```bash
velero version
velero backup-location get
```

Если версия и backup location отображаются без ошибок — Velero готов к работе.
