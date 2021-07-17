defmodule Shop do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil, balance: nil

  use Shop.Agregates.OpenShop
  use Shop.Agregates.Withdraw
end

defmodule Shop.App do
  use Commanded.Application, otp_app: :shop

  router(Shop.Router)
end
