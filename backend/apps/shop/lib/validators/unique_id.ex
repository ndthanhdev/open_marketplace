defmodule Shop.Validators.UniqueUUID do
  use Vex.Validator

  def validate(shop_uuid, _context) do
    case uuid_claimed?(shop_uuid) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  defp uuid_claimed?(shop_uuid) do
    case Shop.shop_by_uuid(shop_uuid) do
      %Shop.Aggregate{uuid: ^shop_uuid} -> false
      nil -> false
      _ -> true
    end
  end
end
