defmodule Readfiles do
  @moduledoc """
  ...

  Provides the reading files, retrieving random data and storing into
  maps
  """

  def readFile(0, _path, _type),do: []
  def readFile(n, path, type) when type == "emails" do
    body = openFile(path)

    itemList =
      Enum.map(1..n, fn _i ->
        Enum.random(body)
      end)

    itemList
  end

  def readFile(n, path, type) when type == "items" do
    body = openFile(path)

    emailList =
      Enum.map(1..n, fn _i ->
        line = Enum.random(body)
        extractItem(line)
      end)

    emailList
  end

  def readFile(_n, _body, _type), do: raise("Invalid type (emails or items)")

  defp openFile(path) do
    {:ok, file} = File.open(path, [:read])
    {:ok, body} = File.read(path)
    File.close(file)
    [_ | body] = String.split(body, "\n")
    body
  end

  defp extractItem(line) do
    att = String.split(line, ",", trim: true)
    {price, _} = Integer.parse(String.replace(Enum.at(att, 1), ".", ""))
    {quantity, _} = Integer.parse(Enum.at(att, 2))
    %{name: Enum.at(att, 0), features: %{price: price, quantity: quantity}}
  end
end
