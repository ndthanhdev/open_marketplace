defmodule Shop.Graphql do
  use Absinthe.Schema.Notation

  object :shop do
    field(:id, :string)
    field(:domain, :string)
  end

  object :shop_queries do
    @desc "Get all the shops, optionally filtering"
    field :shop, list_of(:shop) do
      resolve(fn _parent, _args, _resolution ->
        {:ok, Shop.Projection |> Shop.Repo.all}
      end)
    end
  end
end
