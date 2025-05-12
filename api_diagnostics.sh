#!/bin/bash

API_URL="https://example.com/api"  # замени на свой URL
HOST=$(echo $API_URL | awk -F[/:] '{print $4}')

echo "🔍 Проверка DNS"
dig $HOST

echo -e "\n📡 Пинг до хоста ($HOST)"
ping -c 4 $HOST

echo -e "\n🛣️ Traceroute до хоста ($HOST)"
traceroute $HOST

echo -e "\n📬 curl-запрос к API"
curl -w "@curl-format.txt" -o /dev/null -s $API_URL
