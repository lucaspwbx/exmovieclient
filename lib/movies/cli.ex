defmodule MovieClient.CLI do
  def run(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv)

    case parse do
      { [ {_,:sinatra} ], _, _ } -> 9292
      { [ {_,:chicago_boss} ], _, _ } -> 8001

      _ -> IO.puts "No match for framework"
    end
  end
end
