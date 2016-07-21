defmodule InvestigatorTest do
  use ExUnit.Case
  doctest Investigator

  setup do
    Investigator.start(:test, [])
    :ok
  end

  test "starts investigator supervisor" do
    refute Process.whereis(Investigator.Supervisor) == nil
  end
end
