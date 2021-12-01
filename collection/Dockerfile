FROM elixir:alpine AS Builder

ENV MIX_ENV=prod \
  LANG=C.UTF-8

WORKDIR /app/

COPY mix.* ./
COPY lib/ ./lib
COPY test/ ./test

RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix deps.get && \
  mix deps.compile

RUN mix release

FROM elixir:alpine as App

ENV LANG=C.UTF-8

RUN apk add --no-cache --update busybox-extras bash openssl curl

WORKDIR /app

COPY --from=Builder /app/_build/prod/ /app/_build/prod/
CMD ["/app/_build/prod/rel/collection/bin/collection", "start"]