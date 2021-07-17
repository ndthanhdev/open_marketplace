defmodule Shop.Commands.OpenShop do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil
end

defmodule Shop.Events.ShopOpened do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil
end

defmodule Shop.Agregates.OpenShop do
  defmacro __using__(_opts) do
    quote do
      def execute(%Shop{}, %Shop.Commands.OpenShop{
            id: id,
            domain: domain
          }) do
        %Shop.Events.ShopOpened{id: id, domain: domain}
      end

      def apply(%Shop{} = shop, %Shop.Events.ShopOpened{} = event) do
        %Shop.Events.ShopOpened{id: id, domain: domain} = event
        %Shop{shop | id: id, domain: domain, balance: 1000}
      end
    end
  end
end
