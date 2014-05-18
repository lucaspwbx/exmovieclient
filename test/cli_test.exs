defmodule CliTest do
  use ExUnit.Case

  import MovieClient.CLI, only: [ parse_args: 1 ]

  test "sinatra" do
    assert parse_args(["--framework", :sinatra]) == 9292
  end

  test "chicago boss" do
    assert parse_args(["--framework", :chicago_boss]) == 8001
  end

  test "no framework provided" do
    assert parse_args(["--framework", :blabla]) == :ok
  end
end
