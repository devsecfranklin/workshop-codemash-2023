# syntax=docker/dockerfile:1

FROM python:3.11-slim-bullseye

LABEL org.opencontainers.image.authors="Franklin D <franklin@bitsmasher.net>"
LABEL org.opencontainers.image.source="https://github.com/devsecfranklin/workshop-codemash-2023"

ENV DEBIAN_FRONTEND noninteractive
ARG USER="franklin"

WORKDIR /workspaces/workshop-codemash-2023

COPY ./ /workspaces/workshop-codemash-2023

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install apt-utils -y && \
    apt-get install gcc sudo -y && \
    bash ${WORKDIR}/bootstrap.sh

##################
# Set up my dude #
##################
RUN if [ -f "${WORKDIR}/.bash_history" ]; then chmod 666 ${WORKDIR}/.bash_history; fi
RUN addgroup --gid 9001 engr && \
	adduser \
    	--disabled-password \
    	--gecos "" \
    	--home "${WORKDIR}" \
    	--ingroup "engr" \
    	--no-create-home \
    	--uid "1000" \
    	"${USER}"; \
	chown -R ${USER}:engr ${WORKDIR}; \
	usermod -a -G sudo ${USER};\
	echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}

RUN python3 -m pip install lolcat
