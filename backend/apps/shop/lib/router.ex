defmodule Shop.Router do
  use Commanded.Commands.Router

  alias Shop.{Commands}

  alias Shop.Supports.Middlewares.{Validate}

  middleware(Validate)

  identify(Shop.Aggregate,
    by: :uuid
  )

  dispatch(Commands.CreateShop, to: Shop.Aggregate, identity: :uuid)
  dispatch(Commands.Withdraw, to: Shop.Aggregate, identity: :uuid)
end
