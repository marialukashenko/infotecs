SQLite Builder Docker Image
==========================

Этот Docker-образ собирает SQLite в виде разделяемой библиотеки (libsqlite3.so).

Требования:
- Установленный Docker
- Пользователь в группе docker (или использование sudo)

Инструкция:

1. Сборка образа
-----------------
docker build -t sqlite-builder .

2. (Опционально) Проверка содержимого образа
---------------------------------------------
# Запуск интерактивной оболочки для проверки:
docker run --rm -it sqlite-builder sh
# Проверка наличия файла внутри контейнера:
ls -la /app/libsqlite3.so

3. Копирование библиотеки на хост
---------------------------------
# Создание папки output (если её нет):
mkdir -p ./output

# Копирование файла из контейнера в папку /output:
docker run --name sqlite_temp sqlite-builder && \
docker cp sqlite_temp:/app/libsqlite3.so ./output/ && \
docker rm sqlite_temp

NtB: 
- sudo usermod -aG docker $USER && newgrp docker - добавление пользователя в группу docker
- Папка output создаётся в директории, содержащей Dockerfile