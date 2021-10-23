defmodule Backend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    redis_host = Application.get_env(:backend, :redis_host)
    redis_port = Application.get_env(:backend, :redis_port)
    redis_password = Application.get_env(:backend, :redis_password)

    readlock_opts = [
      pool_size: 2,
      drift_factor: 0.01,
      max_retry: 3,
      retry_interval_base: 300,
      retry_interval_max: 3_000,
      reconnection_interval_base: 500,
      reconnection_interval_max: 5_000,

      # you must set odd number of server
      servers: [
        [
          host: redis_host,
          port: redis_port,
          auth: redis_password
        ]
      ]
    ]

    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Backend.PubSub},
      # Start a worker by calling: Backend.Worker.start_link(arg)
      # {Backend.Worker, arg}
      {Backend.Counter, [host: redis_host, port: redis_port, password: redis_password]},
      {Redlock, readlock_opts}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Backend.Supervisor)
  end
end
