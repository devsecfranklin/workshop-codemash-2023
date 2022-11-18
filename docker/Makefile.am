CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

build:
	docker build -t ghcr.io/devsecfranklin/cloudbot-dev .
	docker push ghcr.io /devsecfranklin/cloudbot-dev:latest

latex:
	docker build -t ghcr.io/devsecfranklin/latex -f Dockerfile.latex .
run: 
	$(build)
	docker run -it --user="$(id -u):$(id -g)" -v $(pwd):/home/franklin ghcr.io/devsecfranklin/cloudbot-dev:latest bash

