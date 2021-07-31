defmodule Shop do
  alias Shop.{Commands, App, Repo, Projection}

  def create_shop(%{} = attrs) do
    id = UUID.uuid4()

    create_shop = Map.put(attrs, :id, id) |> Commands.CreateShop.new()

    with :ok <- App.dispatch(create_shop) do
      get(Projection, id)
    end
  end

  @doc """
  Get a single shop by their UUID
  """
  def shop_by_uuid(uuid) when is_binary(uuid) do
    Repo.get(Shop.Projection, uuid)
  end

  defp get(schema, id) do
    case Repo.get(schema, id) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
