defmodule Backend.Counter do
  use GenServer

  def init(state), do: {:ok, state}

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:increase, _from, state) do
    next = state + 1
    {:reply, next, next}
  end

  def start_link(state \\ 0) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def increase do
    GenServer.call(__MODULE__, :increase)
  end

end
