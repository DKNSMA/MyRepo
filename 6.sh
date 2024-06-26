#!/bin/bash

URL="https://api.elrond.com/network/status/4294967295"

response=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$response" -ne 200 ]; then
  echo "Ошибка: код ответа $response. Завершение скрипта."
  exit 1
fi

response_body=$(curl -s $URL)
timestamp=$(echo $response_body | jq '.data.erd_block_timestamp')
nonce=$(echo $response_body | jq '.data.erd_highest_final_nonce')

human_readable_time=$(date -d @$timestamp)

echo "Timestamp: $timestamp ($human_readable_time)" > time.txt
echo "Highest Final Nonce: $nonce" >> time.txt
