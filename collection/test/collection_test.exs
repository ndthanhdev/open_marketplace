defmodule CollectionTest do
  use ExUnit.Case
  doctest Collection

  test "greets the world" do
    assert Collection.hello() == :world
  end
end
