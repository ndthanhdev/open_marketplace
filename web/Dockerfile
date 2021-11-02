FROM node:latest as Builder

COPY ./ /web

WORKDIR /web

RUN yarn install

RUN ./scripts/build.ts

FROM nginx:latest as App

COPY --from=Builder /web/modules/shell/build/ /usr/share/nginx/html/