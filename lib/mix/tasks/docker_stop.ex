defmodule Mix.Tasks.Docker.Stop do
  @moduledoc """
  Creates a custom mix task for stopping docker containers
  defined in your application's environment config file
  under the :divo key.
  """
  use Mix.Task
  alias Divo.TaskHelper

  @impl Mix.Task
  def run(_args) do
    TaskHelper.fetch_config()
    |> Enum.map(fn {x, _} -> Divo.Parser.create_name(x) end)
    |> Enum.map(&Divo.DockerCmd.stop/1)
  end
end