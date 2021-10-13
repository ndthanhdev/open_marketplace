defmodule Backend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Backend.PubSub}
      # Start a worker by calling: Backend.Worker.start_link(arg)
      # {Backend.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Backend.Supervisor)
  end
end
