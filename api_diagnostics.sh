#!/bin/sh

API_URL="https://api.litres.ru/foundation/api/cart/status"  # замени на свой URL
HOST=$(echo $API_URL | awk -F[/:] '{print $4}')

echo "🔍 Проверка DNS"
dig $HOST

echo -e "\n📡 Пинг до хоста ($HOST)"
ping -c 4 $HOST

echo -e "\n🛣️ Traceroute до хоста ($HOST)"
traceroute $HOST

echo -e "\n📬 curl-запрос к API"
curl -w "@curl_format.txt" -o /dev/null -s $API_URL
