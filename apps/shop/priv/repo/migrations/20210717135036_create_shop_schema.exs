defmodule Shop.Repo.Migrations.CreateShopSchema do
  use Ecto.Migration

  def change do
    create table(:shop_projections, primary_key: false) do
      add(:id, :text, primary_key: true)
      add(:domain, :text)
    end
  end
end
