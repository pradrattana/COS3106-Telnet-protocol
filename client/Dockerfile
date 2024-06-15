FROM debian:bookworm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		telnet \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["telnet"]
CMD ["telnet-server", "23"]
