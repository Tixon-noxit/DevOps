#!/bin/bash

STAGE_TYPE=$1
BOT_TOKEN="6733129223:AAH7TuBAEPB5op7Ud6XIOqKwaoeBXR_2OC0"
CHAT_ID="-1002046013425"

sleep 5

if [ "$CI_JOB_STATUS" = "success" ]; then
  MESSAGE="✅ Стадия $STAGE_TYPE 👉$CI_JOB_NAME👈 успешно завершена ✅ $CI_PROJECT_URL/pipelines"
else
  MESSAGE="🚫 Стадия $STAGE_TYPE 👉$CI_JOB_NAME👈 завершилась с ошибкой! 🚫 $CI_PROJECT_URL/pipelines"
fi

curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"