defmodule Api.Schema do
  use Absinthe.Schema

  import_types Shop.DataTypes;

  query do
    import_fields :shop_queries;
  end
end
