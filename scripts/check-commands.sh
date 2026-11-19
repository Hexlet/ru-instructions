#!/usr/bin/env bash
# Ставит инструменты из переменной TOOLS через mise и проверяет их так, как это
# делает студент после перезапуска терминала: каждая команда идёт в новой
# интерактивной оболочке, которая подключает mise строкой из ~/.bashrc или ~/.zshrc.
#
# Строка TOOLS устроена как «что ставить | чем проверить». Каждая программа,
# с которой начинается проверка, должна браться из каталога данных mise, иначе на
# runner с предустановленными Java и Node.js проверка прошла бы без mise.
# Оболочку задаёт CHECK_SHELL: bash на Linux, zsh на macOS.
set -u

: "${TOOLS:?переменная TOOLS не задана}"
shell="${CHECK_SHELL:-bash}"
# Почти всё лежит в installs/, а .NET mise ставит в dotnet-root/, поэтому сверяем весь каталог данных
mise_data="$HOME/.local/share/mise/"

# Интерактивная оболочка без терминала жалуется на управление заданиями, эти строки выкидываем
in_shell() {
  "$shell" -ic "$1" 2>&1 | grep -v -e 'no job control' -e 'cannot set terminal process group' -e 'inappropriate ioctl'
  return "${PIPESTATUS[0]}"
}

in_shell 'mise --version && mise doctor | grep activated' || exit 1

failed=()
while IFS='|' read -r tools check; do
  tools=$(xargs <<<"$tools")
  check=$(sed -e 's/^ *//' -e 's/ *$//' <<<"$check")
  [ -n "$tools" ] || continue

  script="set -e; $check"
  # shellcheck disable=SC2013 # нужны слова: имена программ
  for bin in $(grep -oE '(^|&& *)[a-z][a-z0-9-]*' <<<"$check" | sed 's/^&& *//'); do
    script+="; case \$(command -v $bin) in $mise_data*) ;; *) echo \"$bin взят не из mise: \$(command -v $bin)\"; exit 1;; esac"
  done

  echo "::group::$tools"
  if in_shell "mise use -g $tools" && in_shell "$script"; then
    echo "::endgroup::"
    echo "OK $tools"
  else
    echo "::endgroup::"
    echo "::error::$tools: установка или проверка упала"
    failed+=("$tools")
  fi
done <<<"$TOOLS"

if [ "${#failed[@]}" -gt 0 ]; then
  {
    echo "### Упали на ${RUNNER_OS:-} ${CHECK_LABEL:-}"
    # shellcheck disable=SC2016 # обратные кавычки это разметка markdown
    printf -- '- `%s`\n' "${failed[@]}"
  } >>"${GITHUB_STEP_SUMMARY:-/dev/stdout}"
  exit 1
fi
echo "Все инструменты поставились и запускаются."
