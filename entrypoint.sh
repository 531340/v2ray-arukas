#!/bin/bash
sed -i "s/ID/$ID/g" /etc/config.json
sed -i "s/PORT/$PORT/g" /etc/nginx/conf.d/default.conf

if [ ! -f "/usr/local/bin/v2ray" ]; then
curl -L -H "Cache-Control: no-cache" -o v2ray.zip http://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
unzip v2ray.zip
mv ./v2ray-v$VER-linux-64/v2ray /usr/local/bin/
mv ./v2ray-v$VER-linux-64/v2ctl /usr/local/bin/
chmod +x /usr/local/bin/*
rm -rf v2ray.zip
rm -rf v2ray-v$VER-linux-64
fi

supervisord -c /etc/supervisord.ini
