defmodule Watcher do
  require Logger
  use GenServer

  @tgt Application.compile_env!(:wss, :tgt)

  def start_link(args), do: GenServer.start_link(__MODULE__, args)

  def init(dirs) do
    {:ok, pid} = FileSystem.start_link(dirs: dirs)
    FileSystem.subscribe(pid)
    Logger.info("Watching for changes")
    Mix.Task.rerun("build")

    {:ok, {nil, nil, nil, nil}}
  end

  def handle_info({:file_event, _pid, {path, _e}}, {_, _, p_inode, p_time}) do
    event = path |> directory() |> inode() |> time()
    {path, dir, inode, time} = event

    if dir == @tgt, do: Mix.Task.rerun("build", ["sitemap"])

    if dir == "priv" && (inode != p_inode || time != p_time) do
      case Path.extname(path) do
        ".css" -> Mix.Task.rerun("build", ["assets"])
        ".md" -> Mix.Task.rerun("build", ["markdown"])
        ".js" -> Mix.Task.rerun("build", ["assets"])
        _ -> :ok
      end
    end

    {:noreply, event}
  end

  defp directory(path) do
    dir =
      path
      |> String.replace_prefix(File.cwd!(), "")
      |> String.split("/")
      |> Enum.at(1)

    {path, dir}
  end

  defp inode({path, dir}) do
    inode =
      if File.exists?(path) do
        stat = File.stat!(path)
        stat.inode
      else
        -1
      end

    {path, dir, inode}
  end

  defp time({path, dir, inode}) do
    time = System.os_time(:second)
    {path, dir, inode, time}
  end
end
