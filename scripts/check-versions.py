"""Сверяет версии из инструкций с endoflife.date и печатает отчёт в markdown.

Правила лежат в .github/versions.json. Для каждого продукта скрипт ищет версии
по шаблонам во всех *.md корня и сообщает о трёх случаях:
- самая новая версия в файле ниже последней (только LTS, если "lts": true);
- версия уже не поддерживается (isEol);
- версии нет среди циклов продукта, то есть шаблон поймал лишнее.
"latest": false отключает первую проверку, когда версию держим осознанно.
Код выхода 1, если есть находки.
"""

import json
import re
import sys
import urllib.request
from pathlib import Path

API = "https://endoflife.date/api/v1/products/{}"
root = Path(sys.argv[1] if len(sys.argv) > 1 else ".")


def key(version):
    return tuple(int(part) for part in version.split("."))


def releases(product):
    request = urllib.request.Request(API.format(product), headers={"User-Agent": "ru-instructions-version-check"})
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)["result"]["releases"]


rules = json.loads((root / ".github/versions.json").read_text())
files = sorted(root.glob("*.md"))
findings = []

for rule in rules:
    product = rule["product"]
    cycles = {release["name"]: release for release in releases(product)}
    candidates = [r for r in cycles.values() if r["isLts"]] if rule.get("lts") else list(cycles.values())
    latest = max((r["name"] for r in candidates), key=key)

    for file in files:
        found = {}
        for number, line in enumerate(file.read_text().splitlines(), 1):
            for pattern in rule["patterns"]:
                for match in re.finditer(pattern, line):
                    found.setdefault(match.group(1), number)
        if not found:
            continue
        for version, number in sorted(found.items(), key=lambda item: key(item[0])):
            place = f"[{file.name}:{number}]({file.name}#L{number})"
            if version not in cycles:
                findings.append(f"| {place} | {product} | `{version}` | версии нет на endoflife.date, проверить шаблон |")
            elif cycles[version]["isEol"]:
                findings.append(f"| {place} | {product} | `{version}` | поддержка закончилась {cycles[version]['eolFrom']} |")
        newest = max(found, key=key)
        if rule.get("latest", True) and key(newest) < key(latest):
            number = found[newest]
            kind = "LTS " if rule.get("lts") else ""
            findings.append(f"| [{file.name}:{number}]({file.name}#L{number}) | {product} | `{newest}` | вышла {kind}{latest} |")

if findings:
    print("| Где | Продукт | Версия | Что не так |")
    print("| --- | --- | --- | --- |")
    print("\n".join(findings))
    sys.exit(1)
print("Все версии в инструкциях актуальны.")
