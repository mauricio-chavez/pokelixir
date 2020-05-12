defmodule PokelixirTest do
  use ExUnit.Case
  doctest Pokelixir

  test "pikachu is #25" do
    assert Pokelixir.get_pokemon(25) == "pikachu"
  end
end
