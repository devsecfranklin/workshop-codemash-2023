CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

build:
	npm install --save-exact
	docker build -t ghcr.io/devsecfranklin/build-pod .
	docker tag $(shell docker images -q | head -1) ghcr.io/devsecfranklin/build-pod:latest

.check-env-vars:
	@test $${CR_PAT?Push will fail. You need to export the CR_PAT token for GHCR}

push: .check-env-vars
	docker push ghcr.io/devsecfranklin/build-pod