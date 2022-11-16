# Docker

```sh
docker build -t gcr.io/gcp-gcs-pso/cloudbot-dev .
docker run -it -v $(pwd):/home/franklin gcr.io/gcp-gcs-pso/cloudbot-dev:latest bash
```
