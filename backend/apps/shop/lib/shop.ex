defmodule Shop do
  alias Shop.{Commands, App, Repo, Projection, Queries}

  def create_shop(%{} = attrs) do
    uuid = UUID.uuid4()

    create_shop = Map.put(attrs, :uuid, uuid) |> Commands.CreateShop.new()

    with :ok <- App.dispatch(create_shop) do
      get(Projection, uuid)
    end
  end

  @doc """
  Get a single shop by their UUID
  """
  def shop_by_uuid(uuid) when is_binary(uuid) do
    Repo.get(Shop.Projection, uuid)
  end

  @doc """
  Get an existing user by their domain, or return `nil` if not registered
  """
  def shop_by_domain(domain) when is_binary(domain) do
    domain
    |> String.downcase()
    |> Queries.ShopByDomain.new()
    |> Repo.one()
  end

  defp get(schema, uuid) do
    case Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
