defmodule Shop.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Commanded.Assertions.EventAssertions
    end
  end

  setup_all do
    Mix.Task.run("ecto.create", ["--quiet"])
    Mix.Task.run("ecto.migrate", ["--quiet"])
    Mix.Task.run("event_store.create")
    Mix.Task.run("event_store.init")
    Shop.Storage.reset!()
    :ok
  end

  setup do
    {:ok, _} = Application.ensure_all_started(:shop)

    on_exit(fn ->
      :ok = Application.stop(:shop)

      Shop.Storage.reset!()
    end)

    :ok
  end
end
