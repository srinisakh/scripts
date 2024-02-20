#!/bin/bash

token=$(cat ~/.ssh/cloudflare_token)

zone=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones" -H "Authorization: Bearer $token" -H "Content-Type:application/json" | jq -r '.result[0].id')

curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone/dns_records" -H "Authorization: Bearer $token" -H "Content-Type:application/json" | jq -r '.result[0] | [.zone_name, .content] | @tsv'

