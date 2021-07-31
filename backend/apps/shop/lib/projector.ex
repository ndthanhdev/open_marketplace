defmodule Shop.Projector do
  use Commanded.Projections.Ecto,
    application: Shop.App,
    repo: Shop.Repo,
    name: "Shop.Projector"

  alias Shop.{Events}

  project(%Events.ShopCreated{id: id, domain: domain}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :shop_projection, %Shop.Projection{id: id, domain: domain})
  end)
end
