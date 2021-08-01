defmodule ShopTest do
  use Shop.DataCase

  test "greets the world" do
    assert :world == :world
  end

  test "ensure any event of this type is published" do
    Shop.create_shop(%{domain: "shop-01"})

    assert_receive_event(Shop.App, Shop.Events.ShopCreated, fn event ->
      assert event.domain == "shop-01"
    end)
  end
end
