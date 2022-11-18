# syntax=docker/dockerfile:1

FROM python:3.11-slim-bullseye

LABEL maintainer="Franklin D <franklin@bitsmasher.net>"
LABEL org.opencontainers.image.source="https://github.com/devsecfranklin/workshop-codemash-2023"

ENV DEBIAN_FRONTEND noninteractive
ARG USER="franklin"

WORKDIR /home/${USER}

COPY . /home/${USER}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install apt-utils -y && \
    apt-get install gcc -y && \
    bash bootstrap.sh

##################
# Set up my dude #
##################
RUN if [ -f "/home/${USER}/.bash_history" ]; then chmod 666 /home/${USER}/.bash_history; fi
RUN addgroup --gid 9001 engr && \
	adduser \
    	--disabled-password \
    	--gecos "" \
    	--home "/home/${USER}" \
    	--ingroup "engr" \
    	--no-create-home \
    	--uid "1000" \
    	"${USER}"; \
	chown -R ${USER}:engr /home/${USER}

USER ${USER} 

RUN python3 -m pip install lolcat
