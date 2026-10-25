defmodule Watcher do
  require Logger
  use GenServer

  @target Application.compile_env! :wss, :target

  def start_link(args), do: GenServer.start_link(__MODULE__, args)

  def init(dirs) do
    {:ok, pid} = FileSystem.start_link dirs: dirs
    FileSystem.subscribe pid
    Logger.info "Watching for changes"
    Mix.Task.rerun "build"
    {:ok, {nil, nil, nil, nil}}
  end

  def handle_info({:file_event, _pid, {path, _e}}, state) do
    event = path |> directory() |> inode() |> time()
    {path, directory, inode, time} = event
    if directory == @target, do: Mix.Task.rerun("build", ["sitemap"])
    if directory == "priv" && (time != state.time || inode != state.inode) do
      case Path.extname(path) do
        ".md" -> Mix.Task.rerun "build", ["markdown"]
        ext when ext == ".css" or ext == ".js" -> Mix.Task.rerun "build", ["assets"]
        _ -> :ok
      end
    end
    {:noreply, event}
  end

  defp directory(path) do
    directory = path
    |> String.replace_prefix(File.cwd!, "")
    |> String.split("/")
    |> Enum.at(1)
    {path, directory}
  end

  defp inode({path, directory}) do
    inode = if File.exists?(path), do: File.stat!(path) |> then(& &1.inode), else: -1
    {path, directory, inode}
  end

  defp time({path, directory, inode}) do
    time = System.os_time :second
    {path, directory, inode, time}
  end
end
