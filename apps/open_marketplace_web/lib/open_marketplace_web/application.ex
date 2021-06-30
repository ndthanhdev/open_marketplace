defmodule OpenMarketplaceWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OpenMarketplaceWeb.Telemetry,
      # Start the Endpoint (http/https)
      OpenMarketplaceWeb.Endpoint
      # Start a worker by calling: OpenMarketplaceWeb.Worker.start_link(arg)
      # {OpenMarketplaceWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpenMarketplaceWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OpenMarketplaceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
