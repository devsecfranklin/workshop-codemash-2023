FROM python:3.11-slim-bullseye

LABEL maintainer="Franklin D <franklin@bitsmasher.net>"
LABEL org.opencontainers.image.source="https://github.com/devsecfranklin/workshop-codemash-2023"

COPY . .

RUN ls

