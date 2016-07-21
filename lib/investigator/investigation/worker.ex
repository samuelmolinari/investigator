defmodule Investigator.Investigation.Worker do
  use GenServer

  alias Investigator.Investigation

  # Client API

  def start_link(id: id) do
    GenServer.start_link(__MODULE__, {:ok, id}, name: {:global, process_name(id)})
  end

  def call(id, action) do
    whereis(id)
    |> GenServer.call(action)
  end

  def cast(id, action) do
    whereis(id)
    |> GenServer.cast(action)
  end

  def read(id) do
    call(id, {:read})
  end

  def put_subject(id, subject) do
    cast(id, {:put_subject, subject})
  end

  def delete_subject(id, subject) do
    cast(id, {:delete_subject, subject})
  end

  # Server API

  def init({:ok, id}) do
    {:ok, %Investigation{id: id}}
  end

  def handle_call({:read}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:put_subject, subject}, state) do
    {:noreply, Investigation.put_subject(state, subject)}
  end

  def handle_cast({:delete_subject, subject}, state) do
    {:noreply, Investigation.delete_subject(state, subject)}
  end

  def whereis(id) do
    process_name(id)
    |> :global.whereis_name
  end

  def process_name(id) do
    {:investigation, id}
  end
end
