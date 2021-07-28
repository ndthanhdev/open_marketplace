FROM elixir:alpine

RUN apk update
RUN apk add git
RUN apk add openssh

WORKDIR /open_marketplace/
COPY . .
RUN mix deps.get

WORKDIR /open_marketplace/apps/api
RUN mix local.rebar --force

CMD ["iex", "-S", "mix", "phx.server"]
