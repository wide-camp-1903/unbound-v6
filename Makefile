vlan4020 = ens160

.PHONY: default
default: run log

.PHONY: init
init: clean
	docker network create --driver bridge --ipv6 -o parent=$(vlan4020) vlan4020v6
	docker-compose build

.PHONY: run
run:
	docker-compose up --build -d

.PHONY: log
log:
	docker-compose logs -f

.PHONY: clean
clean:
	docker-compose kill
	docker-compose rm -f
	docker network rm vlan4020v6 || true
