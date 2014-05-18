defmodule MovieClient.CLI do
  def run(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    { [ {_, framework } ], _, _ } = OptionParser.parse(argv)

    case framework do
      :sinatra -> 9292
      :chicago_boss -> 8001
      _ -> IO.puts "No match for framework"
    end
  end
end
