defmodule Shop.Queries.ShopByDomain do
  import Ecto.Query

  alias Shop.Projection

  def new(domain) do
    from(u in Projection,
      where: u.domain == ^domain
    )
  end
end
