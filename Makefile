all: start_server auto_connect

re: clean all

clean:
	docker compose down --rmi local

start_server:
	docker compose create --no-recreate telnet-server
	docker compose start telnet-server

stop_server:
	docker compose stop telnet-server

auto_connect:
	@ if [ -n "$$(docker ps -q -f name='telnet-server')" ]; then \
		docker compose run --rm telnet-client; \
	else \
		echo "Telnet server isn't running. Please use \"make start_server\" before \"make connect\" again."; \
	fi

connect:
	@ read -p "Enter hostname (e.g., telnet-server): " hostname; \
	read -p "Enter port number (e.g., 23): " port; \
	docker compose run --rm telnet-client $$hostname $$port;

logs:
	docker compose logs
