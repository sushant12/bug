defmodule Handin.BuildServer do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: name_for(state))
  end

  def name_for(state) do

      {:global, "build"}
  end

  @impl true
  def init(state) do

    {:ok, state, {:continue, :create_machine}}
  end

  @impl true
  def handle_continue(:create_machine, state) do
    SssiWeb.Endpoint.broadcast("xxx", "yyy", 123)
    {:stop, :normal, state}
  end
end
