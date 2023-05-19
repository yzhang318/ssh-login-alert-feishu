# ssh-login-alert-feishu
SSH login alert for feishu. SSH 登录后自动发送飞书推送消息的工具。

Work on all popular linux system (Debian, Ubuntu, Arch Linux etc..)

Highly inspired by [https://github.com/vdeville/ssh-login-alert-telegram](https://github.com/vdeville/ssh-login-alert-telegram).

Since Feishu is a Chinese product, the following instructions are written in Chinese.

## 系统要求

需要安装以下工具：

- curl
- git

## 安装
1) 下载本项目到 `/opt/` 目录，注意需要使用有 `sudo` 权限的用户
```sh
cd /opt/ && git clone https://github.com/yzhang318/ssh-login-alert-feishu
```

2) 编辑 `crednetials.config` 文件，修改飞书机器人的 webhook 地址:
```sh
# 使用 vim
vim credentials.config

# 使用 nano
nano credentials.config
```

3) 执行安装脚本：
```sh
bash deploy.sh
```

4) 在机器上登录，检查是否收到飞书消息
