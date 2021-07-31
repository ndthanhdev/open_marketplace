defmodule Shop.Projector do
  use Commanded.Projections.Ecto,
    application: Shop.App,
    repo: Shop.Repo,
    name: "Shop.Projector",
    consistency: :strong

  alias Shop.{Events}

  project(%Events.ShopCreated{uuid: uuid, domain: domain}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :shop_projection, %Shop.Projection{uuid: uuid, domain: domain})
  end)
end
