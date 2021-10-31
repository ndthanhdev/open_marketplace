# FROM node:latest as Builder

# RUN npm i -g ts-node

# COPY ./ ./web

# WORKDIR /web


FROM nginx:latest as App
COPY ./index.html /usr/share/nginx/html/index.html