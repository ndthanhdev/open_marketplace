defmodule Shop.Commands.Withdraw do
  @derive Jason.Encoder
  defstruct id: nil, amount: nil
end

defmodule Shop.Events.Withdrawed do
  @derive Jason.Encoder
  defstruct id: nil, amount: nil
end

defmodule Shop.Agregate.Withdraw do
  defmacro __using__(_opts) do
    quote do
      def execute(%Shop.Aggregate{}, %Shop.Commands.Withdraw{
            id: id,
            amount: amount
          }) do
        %Shop.Events.Withdrawed{id: id, amount: amount}
      end

      def apply(%Shop.Aggregate{} = shop, %Shop.Events.Withdrawed{} = event) do
        %Shop.Events.Withdrawed{id: id, amount: amount} = event
        %Shop.Aggregate{shop | id: id, balance: shop.balance - amount}
      end
    end
  end
end
