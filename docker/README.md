# Docker

```sh
sudo sysctl -w net.ipv6.conf.all.forwarding=1
echo $CR_PAT | docker login ghcr.io -u devsecfranklin --password-stdin
docker build -t ghcr.io/devsecfranklin/cloudbot-dev .
docker run -it -v $(pwd):/home/franklin ghcr.io/devsecfranklin/cloudbot-dev:latest bash
```

## LaTeX

This image borrows heavily from [Ming Chen's work on LaTeX and Docker](https://github.com/mingchen/docker-latex)

