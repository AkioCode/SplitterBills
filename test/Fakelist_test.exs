defmodule FakelistTest do
  use ExUnit.Case

  test "generates an empty list" do
    assert Fakelist.genFakeList(0, "whatever") == []
  end

  test "generates a filled items list" do
    assert length(Fakelist.genFakeList(5,"items")) == 5
  end
  test "generates a filled emails list" do
    assert length(Fakelist.genFakeList(5,"emails")) == 5
  end
end
