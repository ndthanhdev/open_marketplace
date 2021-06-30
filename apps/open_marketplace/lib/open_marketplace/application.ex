defmodule OpenMarketplace.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: OpenMarketplace.PubSub}
      # Start a worker by calling: OpenMarketplace.Worker.start_link(arg)
      # {OpenMarketplace.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: OpenMarketplace.Supervisor)
  end
end
