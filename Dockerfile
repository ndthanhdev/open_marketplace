FROM elixir:alpine

RUN apk update \
  && apk add git
