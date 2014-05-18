defmodule MovieClient.Fetcher do
  HTTPotion.start

  alias HTTPotion.Response

  def fetch(framework) do
    case HTTPotion.get(url(framework)) do
      %Response{body: body, status_code: status, headers: _headers}
      when status in 200..299 ->
        { :ok, body }
      %Response{body: body, status_code: _status, headers: _headers} ->
        { :error, body }
    end
  end

  def url(framework) do
    case framework do
      :sinatra -> "http://localhost:9292/movies"
      :chicagoboss -> "http://localhost:8001"
      _ -> IO.puts "No url"
    end
  end
end
