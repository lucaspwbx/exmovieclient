defmodule MovieClient.CLI do
  def run(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    { [ {_, framework } ], _, _ } = OptionParser.parse(argv)

    case framework do
      :sinatra -> process(:sinatra)
      :chicago_boss -> 8001
      _ -> IO.puts "No match for framework"
    end
  end

  def process(framework) do
    MovieClient.Fetcher.fetch(framework)
    |> decode_response
  end

  def decode_response({:ok, body}), do: :jsx.decode(body)
  def decode_response({:error, msg}) do
    IO.puts "Error fetching from movies API"
    System.halt(2)
  end
end
