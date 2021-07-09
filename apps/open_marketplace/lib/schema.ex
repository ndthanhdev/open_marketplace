defmodule OpenMarketplace.Schema do
  use Absinthe.Schema

  query do
    @desc "Get a list of events"
    field :shop, non_null(:string) do
      resolve(fn _parent, _args, _resolution ->
        {:ok, "shop"}
      end)
    end
  end
end
