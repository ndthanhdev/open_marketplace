defmodule Backend.Counter do
  require Logger

  use GenServer

  def start_link(host: host, port: port, password: password) do
    GenServer.start_link(__MODULE__, [host: host, port: port, password: password],
      name: __MODULE__
    )
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  def increase do
    GenServer.call(__MODULE__, :increase)
  end

  # server

  def init(host: host, port: port, password: password) do
    Logger.info("connect to url #{host}")

    case Redix.start_link(host: host, port: port, password: password) do
      {:ok, conn} -> {:ok, conn}
      {:error, err} -> {:error, err}
    end
  end

  def handle_call(:get, _from, conn) do
    case Redix.command(conn, ["GET", "mykey"]) do
      {:ok, nil} ->
        {:reply, 0, conn}

      {:ok, value} ->
        {:reply, value, conn}

      {:error, _err} ->
        {:reply, -1, conn}
    end
  end

  def handle_call(:increase, _from, conn) do
    {:reply, execute_with_lock(conn), conn}
  end

  def my_function(conn) do
    value =
      case Redix.command(conn, ["GET", "mykey"]) do
        {:ok, nil} ->
          0

        {:ok, value} ->
          String.to_integer(value)

        {:error, _err} ->
          -99
      end

    value = String.to_integer(value)

    next = 1 + value

    case Redix.command(conn, ["SET", "mykey", next]) do
      {:ok, res} ->
        {:ok, res}

      {:error, _err} ->
        raise "error"
    end
  end

  def execute_with_lock(conn) do
    resource = "increase"
    lock_exp_sec = 10

    case Redlock.transaction(resource, lock_exp_sec, fn -> my_function(conn) end) do
      {:ok, value} ->
        Logger.info("this is the return-value of increase/0")
        {:ok, value}

      {:error, :lock_failure} ->
        Logger.info("if locking has failed, Redlock returns this error")
        {:error, :lock_failure}

      {:error, value} ->
        Logger.info("this is the return-value of increase/0")
        {:error, value}
    end
  end
end
