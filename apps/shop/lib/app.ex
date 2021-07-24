defmodule Shop.App do
  use Commanded.Application, otp_app: :shop

  router(Shop.Router)
end
