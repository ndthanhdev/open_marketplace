defmodule Shop.DataTypes do
  use Absinthe.Schema.Notation

  object :shop do
    field(:id, :string)
    field(:domain, :string)
  end

  object :shop_queries do
    @desc "Get all the shops, optionally filtering"
    field :shop, list_of(:string) do
      resolve(fn _parent, _args, _resolution ->
        {:ok, ["shop 1"]}
      end)
    end
  end
end
