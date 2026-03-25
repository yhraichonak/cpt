# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/

ARG NODE_VERSION=19.5.0

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV production


WORKDIR /usr/src/app

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev

# install nodemon for hot-reloading
RUN npm install -g nodemon
RUN apk add --no-cache --upgrade bash
RUN apk add telegraf openrc
RUN rc-update add local default

# Copy the rest of the source files into the image.
COPY . .


# Run the application as a non-root user.
RUN  chown -R node /usr/src/app
USER root

EXPOSE 3000

COPY ./run_app_and_telegraf.sh /run_app_and_telegraf.sh

RUN  chmod 777 /run_app_and_telegraf.sh

ENTRYPOINT ["bash","-x","/run_app_and_telegraf.sh"]
