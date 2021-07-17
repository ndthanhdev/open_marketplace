defmodule Shop.Projection do
  use Ecto.Schema

  @primary_key {:id, :string, []}
  schema "shop_projections" do
    field(:domain, :string)
  end
end
