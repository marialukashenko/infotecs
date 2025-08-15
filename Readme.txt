# Сборка образа
docker build -t sqlite-builder .

# Интерактивная работа (для проверки наличия файла библиотеки внутри контейнера):
docker run --rm -it sqlite-builder sh

# Скопировать файл из контейнера в папку /output:
docker run --name sqlite_temp sqlite-builder && \
docker cp sqlite_temp:/app/libsqlite3.so $(pwd)/output && \
docker rm sqlite_temp