defmodule Splitbills do
  @moduledoc """
  ...
  """

  @doc """
  Returns a list of maps with email (person) and their splitted bill

  ## Parameters

    - Shopping list: A list of maps with purchased items in the following format:
      %{
          name: _item_name,
          features: ${
          price: _item_price,
          quantity: _item_quantity
          }
      }
    - E-mail list: A list of e-mails.

  ## Examples

      iex> SplitBills.splitBills(
        [],
        [
          "clumsy-penguin@mail.com",
          "grumpy-seagull@mail.com",
          "happy-whale@mail.com"
        ])
      Total: 0
      Remainder: 0
      Split bill: 0
      Result: [%{bill: "$0,00", email: "clumsy-penguin@mail.com"},%{bill: "$0,00", email: "grumpy-seagull@mail.com"},%{bill: "$0,00", email: "happy-whale@mail.com"}]
      [%{bill: "$0,00", email: "clumsy-penguin@mail.com"},%{bill: "$0,00", email: "grumpy-seagull@mail.com"},%{bill: "$0,00", email: "happy-whale@mail.com"}]

      iex> SplitBills.splitBills(
        [
          %{features: %{price: 200, quantity: 2}, name: "rice"},
          %{features: %{price: 100, quantity: 2}, name: "bread"},
          %{features: %{price: 400, quantity: 2}, name: "cheese"},
          %{features: %{price: 300, quantity: 2}, name: "ram"}
        ],
        [
          "clumsy-penguin@mail.com",
          "grumpy-seagull@mail.com",
          "happy-whale@mail.com"
        ])
      Total: 2000
      Remainder: 2
      Split bill: 666
      Result: [%{bill: "$6,00", email: "clumsy-penguin@mail.com"}, %{bill: "$6,00", email: "grumpy-seagull@mail.com"}, %{bill: "$6,00", email: "happy-whale@mail.com"}]
      [%{bill: "$6,00", email: "clumsy-penguin@mail.com"}, %{bill: "$6,00", email: "grumpy-seagull@mail.com"}, %{bill: "$6,00", email: "happy-whale@mail.com"}]
  """
  @spec splitBills(list(), list(charlist())) :: [any]
  def splitBills([], []),
    do: raise("You need to insert an e-mail list with at least one element!")

  def splitBills([], emailList) when is_list(emailList) do
      result = result(emailList,0,0)
      outMessage(0,0,0,result)
      result
    end

  def splitBills(
        itemList,
        emailList
      )
      when is_list(emailList) and is_list(itemList) do
    total = total(itemList)
    remainder = remainder(total, emailList)
    bill = bill(total, emailList)
    result = result(emailList, remainder, bill)

    outMessage(total,remainder,bill,result)
    result
  end

  defp costByItem(
         item = %{name: _item_name_, features: %{price: _item_price, quantity: _item_quantity}},
         acc
       ) do
    item.features.price * item.features.quantity + acc
  end

  defp total(itemList) do
    Enum.reduce(itemList, 0, fn item, acc -> costByItem(item, acc) end)
  end

  defp remainder(total, emailList) do
    rem(total, length(emailList))
  end

  defp bill(total, emailList) do
    div(total, length(emailList))
  end

  defp result(emailList, remainder, bill) do
    (Enum.take(emailList, length(emailList) - remainder)
     |> Enum.map(fn mail -> %{email: mail, bill: to_money(bill)} end)) ++
      (Enum.take(emailList, -remainder)
       |> Enum.map(fn mail -> %{email: mail, bill: to_money(bill+1)} end))
  end

  defp to_money(bill) do
    "$"<>String.pad_leading(Regex.replace(~r/^(\d*)?(\d{2})$/, String.pad_leading(Integer.to_string(bill), 2, "0"), "\\g{1},\\g{2}"),4,"0")
  end

  defp outMessage(total,remainder,bill,result) do
    IO.puts("Total: #{total}")
    IO.puts("Remainder: #{remainder}")
    IO.puts("Split bill: #{bill}")
    IO.puts("Result: #{inspect(result)}")
  end
end
