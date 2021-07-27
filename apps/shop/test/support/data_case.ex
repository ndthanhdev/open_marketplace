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

  setup do
    {:ok, _} = Application.ensure_all_started(:shop)

    on_exit(fn ->
      :ok = Application.stop(:shop)

      Shop.Storage.reset!()
    end)

    :ok
  end
end
