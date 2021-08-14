FROM elixir:alpine

RUN apk update
RUN apk add git
RUN apk add openssh
RUN apk add busybox-extras

RUN mix local.rebar --force
RUN mix local.hex --force

WORKDIR /open_marketplace/backend/
COPY . .
RUN mix setup

# CMD ["iex", "-S", "mix", "phx.server"]
# CMD ["sleep", "infinity"]
RUN chmod ugo+x /open_marketplace/backend/docker-entrypoint.exs
ENTRYPOINT [ "/open_marketplace/backend/docker-entrypoint.exs" ]
