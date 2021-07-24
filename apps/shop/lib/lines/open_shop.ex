defmodule Shop.Commands.OpenShop do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil
end

defmodule Shop.Events.ShopOpened do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil
end

defmodule Shop.Agregate.OpenShop do
  defmacro __using__(_opts) do
    quote do
      def execute(%Shop.Aggregate{}, %Shop.Commands.OpenShop{
            id: id,
            domain: domain
          }) do
        %Shop.Events.ShopOpened{id: id, domain: domain}
      end

      def apply(%Shop.Aggregate{} = shop, %Shop.Events.ShopOpened{} = event) do
        %Shop.Events.ShopOpened{id: id, domain: domain} = event
        %Shop.Aggregate{shop | id: id, domain: domain, balance: 1000}
      end
    end
  end
end
