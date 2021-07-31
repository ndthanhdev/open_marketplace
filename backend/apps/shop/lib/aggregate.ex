defmodule Shop.Aggregate do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil, balance: nil

  use Shop.Agregate.CreateShop
  use Shop.Agregate.Withdraw
end
