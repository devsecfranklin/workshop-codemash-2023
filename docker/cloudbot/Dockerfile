# syntax=docker/dockerfile:1

FROM node:12-alpine

LABEL org.opencontainers.image.authors="Franklin D <devsecfranklin@duck.com>"
LABEL org.opencontainers.image.source=https://github.com/devsecfranklin/workshop-codemash-2023
LABEL org.opencontainers.image.description="Codemash 2023 Precompiler Workshop"
LABEL org.opencontainers.image.licenses=MIT

ENV NODE_ENV=production

COPY ["app.js", "package.json", "package-lock.json", "./"]

RUN npm install --production

COPY . .

ENTRYPOINT ["node", "app.js"]
