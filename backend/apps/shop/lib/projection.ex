defmodule Shop.Projection do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}
  schema "shop_projection" do
    field(:domain, :string)
  end
end
