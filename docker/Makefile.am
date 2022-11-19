CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

.check-env-vars:
	@test $${CR_PAT?Push will fail. You need to export the CR_PAT token for GHCR}

build: .check-env-vars
	docker-compose build cloudbot-dev
	@echo "Tagging image:  $(shell docker images -q | head -1)"
	docker tag $(shell docker images -q | head -1) ghcr.io/devsecfranklin/cloudbot-dev:latest

latex:
	docker-compose build cloudbot-latex
	@echo "Tagging image:  $(shell docker images -q | head -1)"
	docker tag $(shell docker images -q | head -1) ghcr.io/devsecfranklin/cloudbot-latex:latest

push:
	docker push ghcr.io/devsecfranklin/cloudbot-dev:latest

run: 
	docker run -it ghcr.io/devsecfranklin/cloudbot-dev:latest bash
