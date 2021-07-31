defmodule Shop.Repo.Migrations.CreateShopSchema do
  use Ecto.Migration

  def change do
    create table(:shop_projection, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:domain, :text)
    end
  end
end
