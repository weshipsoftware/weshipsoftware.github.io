defmodule Helpers do
  def include(source, assigns),
    do: Markdown.render("priv/live/#{source}", assigns)
end
