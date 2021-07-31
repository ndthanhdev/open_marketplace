defmodule Api.Schema do
  use Absinthe.Schema

  import_types(Shop.Graphql)

  query do
    import_fields(:shop_queries)
  end

  mutation do
    import_fields(:shop_mutations)
  end
end
