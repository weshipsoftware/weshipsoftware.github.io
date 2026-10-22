defmodule Watcher do
	require Logger
	use GenServer

	defstruct [:path, :directory, :inode, :time, :valid?]

	def start_link(args), do: GenServer.start_link(__MODULE__, args)

	def init(dirs) do
    {:ok, pid} = FileSystem.start_link(dirs: dirs)
    FileSystem.subscribe(pid)
    Logger.info("Watching for changes")
    Mix.Task.rerun("build")
    {:ok, %__MODULE__{}}
	end

	def handle_info({:file_event, _pid, {path, _e}}, state) do
	  event = state
		|> cast({path, state})
		|> tap(&build/1)
		{:noreply, event}
	end

	defp cast(event = %__MODULE__{}, {path, previous_event})
	when is_binary(path) do
	  %__MODULE__{event | path: path}
		|> cast(:directory)
		|> cast(:inode)
		|> cast(:time)
		|> cast({:valid, previous_event})
	end

	defp cast(event = %__MODULE__{}, :directory) do
	  %__MODULE__{event | directory: event.path
     	|> String.replace_prefix(File.cwd!, "")
     	|> String.split("/")
     	|> Enum.at(1)
		}
	end

	defp cast(event = %__MODULE__{}, :inode) do
	  %__MODULE__{event | inode: if(File.exists?(event.path),
			do: File.stat!(event.path) |> then(& &1.inode),
			else: -0
		)}
	end

	defp cast(event = %__MODULE__{}, :time),
	  do: %__MODULE__{event | time: System.os_time(:second)}

	defp cast(event = %__MODULE__{}, {:valid, previous_event}) do
    %__MODULE__{event | valid?:
         event.time  != previous_event.time
      || event.inode != previous_event.inode
    }
	end

	defp build(event) do
	  case {event.directory, Path.extname(event.path), event.valid?} do
			{"docs", _,      _}    -> Mix.Task.rerun("build", ["sitemap"])
			{"priv", ".css", true} -> Mix.Task.rerun("build", ["assets"])
			{"priv", ".js",  true} -> Mix.Task.rerun("build", ["assets"])
			{"priv", ".md",  true} -> Mix.Task.rerun("build", ["markdown"])
			_                      -> :ok
		end
	end
end
