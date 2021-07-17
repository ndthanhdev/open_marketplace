defmodule Shop.Projector do
  use Commanded.Projections.Ecto,
    application: Shop.Application,
    repo: Shop.Repo,
    name: "shop_projection"

  project(%Shop.Events.ShopOpened{id: id, domain: domain}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :shop_projection, %Shop.Projection{id: id, domain: domain})
  end)
end
