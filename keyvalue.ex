defmodule Keyvalue do
  @moduledoc """
    Demonstrating State capabulity of elixir
  """
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  @doc """
    This method actually performing the map functionality
  """
  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
