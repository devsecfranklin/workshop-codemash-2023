# Test

## In Container

* Execute `bootstrap.sh` inside the Docker container from the top level.

## Local System

* Execute `bootstrap.sh` from the top level.
* Execute `./configure` from the top level.
* Execute `. _build/bin/activate` from the top level.
* Execute `make python` from the top level.

## Docker

```sh
export CR_PAT=(pass show ghcr) ## fish shell
export CR_PAT=$(pass show ghcr) ## bash shell
docker buildx build --platform linux/amd64 Dockerfile -t $(shell docker images -q | head -1)
```
