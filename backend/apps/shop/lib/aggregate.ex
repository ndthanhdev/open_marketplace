defmodule Shop.Aggregate do
  @derive Jason.Encoder
  defstruct uuid: nil, domain: nil, balance: nil

  use Shop.Agregate.CreateShop
  use Shop.Agregate.Withdraw
end
