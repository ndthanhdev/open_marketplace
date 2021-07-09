defmodule Shop do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil

  use OpenShopLine
end


defmodule ShopApp do
  use Commanded.Application, otp_app: :shop

  router(ShopRouter)
end
