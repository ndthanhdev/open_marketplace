FROM elixir:alpine

RUN apk update
RUN apk add git
RUN apk add openssh

WORKDIR /open_marketplace/
COPY . .

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.get

WORKDIR /open_marketplace/apps/api

CMD ["iex", "-S", "mix", "phx.server"]
