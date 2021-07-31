defmodule Shop.Validators.UniqueDomain do
  use Vex.Validator

  def validate(shop_domain, _context) do
    case domain_claimed?(shop_domain) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  defp domain_claimed?(shop_domain) do
    case Shop.shop_by_domain(shop_domain) do
      %Shop.Aggregate{domain: ^shop_domain} -> false
      nil -> false
      _ -> true
    end
  end
end
