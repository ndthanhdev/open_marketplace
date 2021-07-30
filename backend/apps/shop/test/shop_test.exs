defmodule ShopTest do
  use Shop.DataCase

  test "greets the world" do
    assert :world == :world
  end

  test "ensure any event of this type is published" do
    :ok = Shop.App.dispatch(%Shop.Commands.OpenShop{id: "s1", domain: "s1"})

    assert_receive_event(Shop.App, Shop.Events.ShopOpened, fn event ->
      assert event.domain == "s1"
    end)
  end
end
