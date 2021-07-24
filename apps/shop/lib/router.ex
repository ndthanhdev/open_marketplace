defmodule Shop.Router do
  use Commanded.Commands.Router

  alias Shop.{Commands}

  dispatch(Commands.OpenShop, to: Shop.Aggregate, identity: :id)
  dispatch(Commands.Withdraw, to: Shop.Aggregate, identity: :id)
end
