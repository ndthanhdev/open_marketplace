defmodule Shop.Commands.CreateShop do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil

  use ExConstructor
  use Vex.Struct

  validates(:id, uuid: true)

  validates(:domain,
    presence: true,
    length: [min: 4]
  )
end

defmodule Shop.Events.ShopCreated do
  @derive Jason.Encoder
  defstruct id: nil, domain: nil

  use ExConstructor
  use Vex.Struct

  validates(:id, uuid: true)
  validates(:domain, presence: true, length: [min: 4])
end

defmodule Shop.Agregate.CreateShop do
  defmacro __using__(_opts) do
    quote do
      def execute(%Shop.Aggregate{}, %Shop.Commands.CreateShop{} = open_shop) do
        %Shop.Events.ShopCreated{id: open_shop.id, domain: open_shop.domain}
      end

      def apply(%Shop.Aggregate{} = shop, %Shop.Events.ShopCreated{} = event) do
        %Shop.Events.ShopCreated{id: id, domain: domain} = event
        %Shop.Aggregate{shop | id: id, domain: domain}
      end
    end
  end
end
