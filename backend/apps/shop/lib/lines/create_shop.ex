defmodule Shop.Commands.CreateShop do
  @derive Jason.Encoder
  defstruct uuid: nil, domain: nil

  use ExConstructor
  use Vex.Struct

  validates(:uuid, uuid: true, by: &Shop.Validators.UniqueUUID.validate/2)

  validates(:domain,
    presence: true,
    length: [min: 4],
    by: &Shop.Validators.UniqueDomain.validate/2
  )
end

defmodule Shop.Events.ShopCreated do
  @derive Jason.Encoder
  defstruct uuid: nil, domain: nil

  use ExConstructor
  use Vex.Struct

  validates(:uuid, uuid: true)
  validates(:domain, presence: true, length: [min: 4])
end

defmodule Shop.Agregate.CreateShop do
  defmacro __using__(_opts) do
    quote do
      def execute(%Shop.Aggregate{}, %Shop.Commands.CreateShop{} = open_shop) do
        %Shop.Events.ShopCreated{uuid: open_shop.uuid, domain: open_shop.domain}
      end

      def apply(%Shop.Aggregate{} = shop, %Shop.Events.ShopCreated{} = event) do
        %Shop.Events.ShopCreated{uuid: uuid, domain: domain} = event
        %Shop.Aggregate{shop | uuid: uuid, domain: domain}
      end
    end
  end
end
