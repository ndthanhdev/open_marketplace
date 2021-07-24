defmodule Shop.Aggregate do

  @derive Jason.Encoder
  defstruct id: nil, domain: nil, balance: nil

  use Shop.Agregate.OpenShop
  use Shop.Agregate.Withdraw
end
