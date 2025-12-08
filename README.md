# SABAinterview

Документация / статический сайт проекта **SABAinterview** — исходники в папке `docs/`, конфигурация MkDocs в `mkdocs.yml`. Репозиторий содержит также собранный сайт в папке `site/`. Автор: `petrvAlex`. ([GitHub][1])

---

## Краткое описание

Это репозиторий документации (статический сайт), собранный с помощью MkDocs. Исходные страницы содержатся в `docs/`, конфигурация — в `mkdocs.yml`, а в `site/` — результат сборки. Язык контента — Markdown / HTML / JS. ([GitHub][1])

---

## Что внутри репозитория

* `docs/` — исходники страниц (Markdown). ([GitHub][1])
* `mkdocs.yml` — конфигурация MkDocs. ([GitHub][1])
* `site/` — собранный статический сайт. ([GitHub][1])
* `.github/workflows/` — рабочие процессы CI/CD (для деплоя на GitHub Pages). ([GitHub][1])

---

## Быстрый старт (локально)

1. Установите Python 3.8+ и pip.

2. Установите MkDocs и тему Material (рекомендовано):

```bash
python -m pip install --upgrade pip
pip install mkdocs mkdocs-material
```

(если вы используете виртуальное окружение — активируйте его заранее). Для подробностей по конфигурации MkDocs смотрите официальную документацию. ([mkdocs.org][2])

3. Собрать сайт:

```bash
mkdocs build
# содержимое готового сайта появится в папке "site/"
```
4. Запустите локальный сервер для разработки и просмотра в браузере:

```bash
mkdocs serve
# по умолчанию доступно по http://127.0.0.1:8000

```

---

## Деплой на GitHub Pages

Проще всего (если репозиторий привязан к GitHub) — использовать встроенную команду:

```bash
mkdocs gh-deploy
```

Или настроить GitHub Actions — в репозитории уже есть конфигурация CI в `.github/workflows/`, её можно доработать/использовать для автоматического деплоя при push в `main`. ([GitHub][1])

---

## Структура добавления/изменения контента

1. Добавьте/отредактируйте Markdown-файлы в `docs/`.
2. (При необходимости) обновите `nav` в `mkdocs.yml`, чтобы страницы появлялись в меню.
3. Локально проверяйте с `mkdocs serve`.
4. Создайте ветку, сделайте коммит и отправьте PR в `main`.

Подсказка: по умолчанию структура `docs/index.md` становится главной страницей сайта. ([mkdocs.org][3])

---

## Полезные команды

```bash
# локальный просмотр
mkdocs serve

# собрать статический сайт
mkdocs build

# деплой на GitHub Pages
mkdocs gh-deploy

# проверить конфигурацию/валидацию
mkdocs build --strict
```

(Если используются дополнительные плагины или расширения Markdown — установите их и добавьте в `mkdocs.yml`.)

---

## Рекомендации и улучшения (опционально)

* Добавить `README.md` с этим текстом (если его ещё нет). ([GitHub][1])
* Проверить и при необходимости добавить файл `LICENSE` — сейчас репозиторий не содержит релизов/лицензии. ([GitHub][1])
* Рекомендую держать плагины/зависимости в `requirements.txt` для удобства установки.
* Настроить GitHub Actions для автоматического `mkdocs gh-deploy` на push в `main`.

---

## Контакты / автор

Автор: `petrvAlex` (ссылка на профиль и GitHub Pages указан в репозитории). ([GitHub][1])

---

## Полезные ссылки

* Документация MkDocs — конфигурация, написание страниц, сборка. ([mkdocs.org][2])
* Material for MkDocs — тема и шаблоны. ([squidfunk.github.io][4])

---

[1]: https://github.com/petrvAlex/SABAinterview/tree/main "GitHub - petrvAlex/SABAinterview"
[2]: https://www.mkdocs.org/user-guide/configuration/?utm_source=chatgpt.com "Configuration"
[3]: https://www.mkdocs.org/user-guide/writing-your-docs/?utm_source=chatgpt.com "Writing Your Docs"
[4]: https://squidfunk.github.io/mkdocs-material/creating-your-site/?utm_source=chatgpt.com "Creating your site - Material for MkDocs - GitHub Pages"
