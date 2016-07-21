defmodule Investigator.SupervisorTest do
  use ExUnit.Case, async: true
  doctest Investigator.Supervisor

  alias Investigator.Supervisor

  setup do
    Supervisor.start_link
    :ok
  end

  test "start and link investigation to the supervisor dynamically" do
    {:ok, i1} = Supervisor.start_investigation(1)
    {:ok, i2} = Supervisor.start_investigation(2)

    info = Supervisor
           |> Process.whereis
           |> Process.info
    links = info[:links]

    assert Enum.member?(links, i1)
    assert Enum.member?(links, i2)
  end
end
