defmodule Investigator.InvestigationTest do
  use ExUnit.Case, async: true
  doctest Investigator.Investigation

  alias Investigator.Investigation

  setup do
    {:ok, [investigation: %Investigation{}]}
  end

  test "initial state", %{investigation: investigation} do
    assert investigation.subjects == %{}
    assert investigation.id == nil
  end

  test "add subject", %{investigation: investigation} do
    investigation = investigation
                    |> Investigation.put_subject(%{id: 1})
                    |> Investigation.put_subject(%{id: 2})

    assert investigation.subjects == %{1 => %{id: 1}, 2 => %{id: 2}}
  end

  test "delete subject", %{investigation: investigation} do
    investigation = investigation
                    |> Investigation.put_subject(%{id: 1})
                    |> Investigation.put_subject(%{id: 2})
                    |> Investigation.delete_subject(%{id: 1})
                    |> Investigation.delete_subject(%{id: -1})

    assert investigation.subjects == %{2 => %{id: 2}}
  end
end
