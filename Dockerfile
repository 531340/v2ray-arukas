from nginx:stable-alpine

ENV ID="e92d4093-dbe9-4d6a-b615-e4971ee62fac"  VER=3.19 

COPY conf/ /
ADD entrypoint.sh /entrypoint.sh

RUN apk update \
	&& apk add curl bash supervisor \
	&& mkdir  /var/log/v2ray \
	&& chmod +x /entrypoint.sh \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/* \
	&& rm -rf v2ray.zip \
	&& rm -rf v2ray-v$VER-linux-64 

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
