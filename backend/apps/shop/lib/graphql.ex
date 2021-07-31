defmodule Shop.Graphql do
  use Absinthe.Schema.Notation

  object :shop do
    field(:uuid, :string)
    field(:domain, :string)
  end

  object :shop_queries do
    @desc "Get a shop by domain"
    field :shop_by_domain, :shop do
      arg(:domain, non_null(:string))

      resolve(fn _parent, args, _resolution ->
        Shop.shop_by_domain(args.domain)
      end)
    end
  end

  object :shop_mutations do
    @desc "Create a shop"
    field :create_shop, :shop do
      arg(:domain, non_null(:string))

      resolve(fn _parent, args, _resolution ->
        Shop.create_shop(args)
      end)
    end
  end
end
