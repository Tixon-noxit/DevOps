#!/bin/bash

# Адрес второй виртуальной машины
REMOTE_HOST="10.10.0.1"

# Пользователь на второй виртуальной машине
REMOTE_USER="essiecel"

# Порт SSH на второй виртуальной машине
REMOTE_PORT="22"  # Укажите необходимый порт SSH

# Путь к директории /usr/local/bin на второй виртуальной машине
REMOTE_DIR="/usr/local/bin"

# Пути к файлам локально после сборки (артефакты)
LOCAL_CAT_FILE="./src/cat/s21_cat"
LOCAL_GREP_FILE="./src/grep/s21_grep"

# Проверяем, существуют ли локальные файлы
if [ ! -f "$LOCAL_CAT_FILE" ] || [ ! -f "$LOCAL_GREP_FILE" ]; then
    echo "Error: One or both local files do not exist."
    exit 1
fi

# Копируем файлы на вторую виртуальную машину
scp -P "$REMOTE_PORT" "$LOCAL_CAT_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"
scp -P "$REMOTE_PORT" "$LOCAL_GREP_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

# Проверяем успешность копирования
if [ $? -eq 0 ]; then
    echo "Files copied successfully."
else
    echo "Error: Copying files failed."
fi


