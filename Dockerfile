FROM alpine:latest

RUN apk add --no-cache gcc build-base make file

WORKDIR /app

COPY sqlite-amalgamation-3260000/ .

RUN gcc -shared -fPIC sqlite3.c -lpthread -ldl -lm -o libsqlite3.so