defmodule Investigator do
  use Application
  use Supervisor

  def start(_type, _args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    workers = [
      supervisor(Investigator.Supervisor, [])
    ]

    supervise(workers, strategy: :one_for_one)
  end

end
