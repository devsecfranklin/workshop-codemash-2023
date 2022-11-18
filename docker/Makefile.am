CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

build:
	export CR_PAT=$()
	docker-compose build cloudbot-dev
	@echo "Tagging image:  $(shell docker images -q | head -1)"
	docker tag $(shell docker images -q | head -1) ghcr.io/devsecfranklin/cloudbot-dev:latest
	docker push ghcr.io/devsecfranklin/cloudbot-dev:latest

latex:
	docker build -t ghcr.io/devsecfranklin/latex -f Dockerfile.latex .
run: 
	$(MAKE) build
	docker run -it -v $(..):/home/franklin ghcr.io/devsecfranklin/cloudbot-dev:latest bash

