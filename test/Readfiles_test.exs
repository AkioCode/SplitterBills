defmodule ReadfilesTest do
  use ExUnit.Case

  test "reads a file and returns an empty list" do
    assert length(Readfiles.readFile(0,"data/emails.csv","emails")) == 0
  end

  test "reads e-mails file and returns a list with 5 e-mails" do
    assert length(Readfiles.readFile(5,"data/emails.csv","emails")) == 5
  end

  test "reads items file and returns a list with 5 items" do
    assert length(Readfiles.readFile(5,"data/items.csv","emails")) == 5
  end
end
