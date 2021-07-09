defmodule ShopRouter do
  use Commanded.Commands.Router
  dispatch OpenShop, to: Shop, identity: :id
end
