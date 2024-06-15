FROM debian:bookworm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		telnetd \
		xinetd \
	&& rm -rf /var/lib/apt/lists/*

COPY telnet_xinetd.conf /etc/xinetd.d/telnet
COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 23

ENTRYPOINT ["./usr/local/bin/entrypoint.sh"]
