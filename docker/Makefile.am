CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

build: 
	docker-compose build cloudbot-dev
	@echo "Size of image: $(shell docker image ls| grep ^cloudbot-dev | awk -F '  +' '{print $$5}')"
	@echo "Tagging image:  $(shell docker image ls| grep ^cloudbot-dev | awk -F '  +' '{print $$3}')"
	docker tag $(shell docker images -q | head -1) ghcr.io/devsecfranklin/cloudbot-dev:latest

.check-env-vars:
	@test $${CR_PAT?Push will fail. You need to export the CR_PAT token for GHCR}

push: .check-env-vars
	docker push ghcr.io/devsecfranklin/cloudbot-dev:latest

run: 
	docker run -it ghcr.io/devsecfranklin/cloudbot-dev:latest bash
