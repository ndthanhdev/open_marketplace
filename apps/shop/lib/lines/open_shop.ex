defmodule OpenShop do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil
end

defmodule ShopOpened do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil
end

defmodule OpenShopLine do
  defmacro __using__(_opts) do
    quote do
      def execute(%Shop{}, %OpenShop{
            id: id,
            domain: domain
          }) do
        %ShopOpened{id: id, domain: domain}
      end

      def apply(%Shop{} = shop, %ShopOpened{} = event) do
        %ShopOpened{id: id, domain: domain} = event
        %Shop{shop | id: id, domain: domain}
      end
    end
  end
end
