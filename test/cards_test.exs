defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 36 cards" do
    assert length(Cards.create_deck) == 36
  end
end
