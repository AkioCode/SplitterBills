defmodule SplitbillsTest do
  use ExUnit.Case
  @moduledoc """
  ...

  This module provide unit tests for Splitbills module
  """

  test "people do not buy anything" do
    assert Splitbills.splitBills(
      [],
      [
        "clumsy-penguin@mail.com",
        "grumpy-seagull@mail.com",
        "happy-whale@mail.com"]) == [%{bill: "$0,00", email: "clumsy-penguin@mail.com"},%{bill: "$0,00", email: "grumpy-seagull@mail.com"},%{bill: "$0,00", email: "happy-whale@mail.com"}]
  end

  test "people buy things and receive equally bills" do
    assert Splitbills.splitBills([
      %{features: %{price: 200, quantity: 1}, name: "rice"},
      %{features: %{price: 100, quantity: 2}, name: "bread"},
      %{features: %{price: 400, quantity: 2}, name: "cheese"},
      %{features: %{price: 300, quantity: 2}, name: "ram"}
    ],
    [
      "clumsy-penguin@mail.com",
      "grumpy-seagull@mail.com",
      "happy-whale@mail.com"]) == [%{bill: "$6,00", email: "clumsy-penguin@mail.com"}, %{bill: "$6,00", email: "grumpy-seagull@mail.com"}, %{bill: "$6,00", email: "happy-whale@mail.com"}]
  end

  test "people buy things and all receive balanced but not equally bills" do
    assert Splitbills.splitBills([
      %{features: %{price: 200, quantity: 2}, name: "rice"},
      %{features: %{price: 100, quantity: 2}, name: "bread"},
      %{features: %{price: 400, quantity: 2}, name: "cheese"},
      %{features: %{price: 300, quantity: 2}, name: "ram"}
    ],
    [
      "clumsy-penguin@mail.com",
      "grumpy-seagull@mail.com",
      "happy-whale@mail.com"]) == [%{bill: "$6,66", email: "clumsy-penguin@mail.com"}, %{bill: "$6,67", email: "grumpy-seagull@mail.com"}, %{bill: "$6,67", email: "happy-whale@mail.com"}]
  end

  test "people buy things and some receive bills" do
    assert Splitbills.splitBills([
      %{features: %{price: 2, quantity: 1}, name: "rice"}
    ],
    [
      "clumsy-penguin@mail.com",
      "grumpy-seagull@mail.com",
      "happy-whale@mail.com"]) == [%{bill: "$0,00", email: "clumsy-penguin@mail.com"}, %{bill: "$0,01", email: "grumpy-seagull@mail.com"}, %{bill: "$0,01", email: "happy-whale@mail.com"}]
  end
end
