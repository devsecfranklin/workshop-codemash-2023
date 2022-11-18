CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

build:
	docker build -f docker/Dockerfile -t ghcr.io/devsecfranklin/cloudbot-dev .
	docker push ghcr.io /devsecfranklin/cloudbot-dev:latest

run:
	docker run -it -v $(pwd):/home/franklin ghcr.io/devsecfranklin/cloudbot-dev:latest bash

