defmodule CLI do
  @moduledoc """
  ...

  This module provides the Command Line Interface.
  Options:
    --mode, -m (l|r), -> Method to get data randomly from files (l) or from code (r)
    --emailsFile, -e_f path/to/emailsFile,
    --itemsFile, -i_f path/to/itemsFile,
    --emails, -e, -> Number of emails to get
    --items, -i   -> Number of items to get
  """
  def main(args) do
    options = [
      [
        "--mode","(l|r|m)",
        "--emailsFile",
        "path/to/emailsFile",
        "--itemsFile",
        "path/to/itemsFile",
        "--emails", 100,
        "--items", 100,
        "--verbose"],
      aliases: [
        m: :mode,
        e: :emails,
        i: :items
        ] ,
      strict: [
        mode: :string,
        emailsFile: :string,
        itemsFile: :string,
        emails: :integer,
        items: :integer
        ]
      ]
    {opts,_,_}= OptionParser.parse(args, options)
    # IO.inspect opts, label: "Command Line Arguments"
    optsMapped = Enum.into(opts, %{})
    [itemList, emailList] = getData(optsMapped)
    Splitbills.splitBills(itemList, emailList)
  end

  defp getData(%{mode: m, emailsFile: eFile, itemsFile: iFile, emails: e, items: i}) when m == "l" do
    [Readfiles.readFile(i, iFile, "items"),Readfiles.readFile(e, eFile, "emails")]
  end
  defp getData(%{mode: m, emails: e, items: i}) when m == "r" do
    [Fakelist.genFakeList(i, "items"),Fakelist.genFakeList(e, "emails")]
  end
end
