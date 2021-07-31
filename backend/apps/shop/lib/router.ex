defmodule Shop.Router do
  use Commanded.Commands.Router

  alias Shop.{Commands}

  alias Shop.Supports.Middlewares.{Validate}

  middleware(Validate)

  identify(Shop.Aggregate,
    by: :id
  )

  dispatch(Commands.CreateShop, to: Shop.Aggregate, identity: :id)
  dispatch(Commands.Withdraw, to: Shop.Aggregate, identity: :id)
end
