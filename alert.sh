#!/usr/bin/env bash

# Import credentials form config file
. /opt/ssh-login-alert-feishu/credentials.config

if [ -n "$SSH_CLIENT" ]; then
	CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')

	SRV_HOSTNAME=$(hostname -f)
	SRV_READABLE_HOSTNAME=$READABLE_HOSTNAME

	IPINFO="https://ipinfo.io/${CLIENT_IP}"

	JSON="
	{
		\"msg_type\": \"interactive\",
		\"card\": {
			\"elements\": [{
				\"tag\": \"div\",
				\"text\": {
						\"content\": \"IP ${CLIENT_IP} 登录了服务器 ${SRV_READABLE_HOSTNAME}\n\n登录用户：${USER}\n\n查询详细地址：[${IPINFO}](${IPINFO})\n\n\",
						\"tag\": \"lark_md\"
				}
			}],
			\"header\": {
				\"template\": \"red\",
				\"title\": {
						\"content\": \"服务器登录提醒\",
						\"tag\": \"plain_text\"
				}
			}
		}
	}"

	curl -X POST -H "Content-Type: application/json" \
	-d "$JSON" \
	$WEBHOOK_URL > /dev/null
fi
