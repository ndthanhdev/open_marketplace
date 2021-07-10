defmodule Shop.Handlers.Balance do
  use Commanded.Event.Handler,
    application: Shop.App,
    name: __MODULE__

  def init do
    with {:ok, _pid} <- Agent.start_link(fn -> 1000 end, name: __MODULE__) do
      :ok
    end
  end

  def handle(%Shop.Events.Withdrawed{amount: amount}, _metadata) do
    Agent.update(__MODULE__, fn balance -> balance - amount end)
  end

  def current_balance do
    Agent.get(__MODULE__, fn balance -> balance end)
  end
end
