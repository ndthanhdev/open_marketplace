defmodule Shop.Router do
  use Commanded.Commands.Router

  dispatch(Shop.Commands.OpenShop, to: Shop, identity: :id)
  dispatch(Shop.Commands.Withdraw, to: Shop, identity: :id)
end
