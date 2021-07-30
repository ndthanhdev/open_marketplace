defmodule Shop.Projection do
  use Ecto.Schema

  @primary_key {:id, :string, []}
  schema "shop_projection" do
    field(:domain, :string)
  end
end
