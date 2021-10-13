FROM elixir:alpine AS Builder

ENV MIX_ENV=prod \
  LANG=C.UTF-8

WORKDIR /backend_umbrella/

COPY mix.* ./
COPY config/ ./config
COPY apps/ ./apps

RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix deps.get && \
  mix deps.compile

WORKDIR /backend_umbrella/apps/backend_web
RUN mix phx.digest

WORKDIR /backend_umbrella/
RUN mix release

FROM elixir:alpine as App

ENV LANG=C.UTF-8

RUN apk add --no-cache --update busybox-extras bash openssl curl

WORKDIR /backend_umbrella

COPY --from=Builder /backend_umbrella/ /backend_umbrella/
CMD ["/backend_umbrella/_build/prod/rel/backend_umbrella/bin/backend_umbrella", "start"]