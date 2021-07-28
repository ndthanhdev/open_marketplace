FROM elixir:alpine

RUN apk update \
  && apk add git

WORKDIR /open_marketplace/
COPY . .
RUN mix deps.get

WORKDIR /open_marketplace/apps/api
RUN mix local.rebar --force

CMD ["iex", "-S", "mix", "phx.server"]
