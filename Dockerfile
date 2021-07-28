FROM elixir:latest

RUN apk update \
  && apk add git
