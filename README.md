# Avreg docker

## Описание

Запуск с помощью docker compose http://avreg.net/avreg.html 

## Порядок запуска
Корректируем настройки в `files/avreg.conf` (например указываем storage-dir)
Выполняем:
- `docker compose build`
- `docker compose up -d`

Заходим по адресу `http://127.0.0.1:8888/` используя логин `install` с пустым паролем.

Добавляем камеры, подробнее на сайте avreg.

## Примечания
Если необходимо монтируем папку\папки с хост машины в контейнер, например:
- в конфигурации указываем `storage-dir = '/mnt/videos'`
- в `docker-compose.yaml` добавляем в секцию `volumes`  монтирование папки с хост машины: `- /mnt/some_dir:/mnt/videos` (в формате <ПУТЬ НА ХОСТ МАШИНЕ>:<ПУТЬ В КОНТЕЙНЕРЕ>)