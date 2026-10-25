defmodule Server do
  use Plug.Builder

  @target Application.compile_env! :wss, :target

  plug Plug.Logger, log: :debug
  plug Plug.Static, at: "/", from: @target
  plug :not_found

  def not_found(conn, _) do
    case {html?(conn), path(conn)} do
      {false, _}   -> send_resp conn, 404, "Not Found"
      {true, nil}  -> send_file conn, 404, "#{@target}/404.html"
      {true, file} -> send_file conn, 200, file
    end
  end

  defp html?(conn) do
    get_req_header(conn, "accept")
    |> Enum.any?(& String.contains? &1, "text/html")
  end

  defp path(conn) do
    path = Enum.join(conn.path_info, "/")
    [".html", "/index.html"]
    |> Enum.map(& "#{@target}/#{path}#{&1}")
    |> Enum.find(&File.exists?/1)
  end
end
