defmodule Investigator.Investigation.WorkerTest do
  use ExUnit.Case, async: true
  doctest Investigator.Investigation.Worker

  alias Investigator.Investigation.Worker
  alias Investigator.Investigation

  setup do
    id = :random.uniform * 10000
         |> Float.round
    Worker.start_link(id: id)
    {:ok, [id: id]}
  end

  test 'call read', %{id: id} do
    assert Worker.read(id) == %Investigation{id: id}
  end

  test 'cast put subject', %{id: id} do
    subject = %{id: 11}
    Worker.put_subject(id, subject)

    assert Worker.read(id).subjects == %{subject.id => subject}
  end

  test 'cast delete subject', %{id: id} do
    subject = %{id: 11}
    Worker.put_subject(id, subject)
    Worker.delete_subject(id, subject)

    assert Worker.read(id).subjects == %{}
  end

  test 'cast put intel', %{id: id} do
    intel = %{id: 11}
    Worker.put_intel(id, intel)

    assert Worker.read(id).intels == %{intel.id => intel}
  end

  test 'cast delete intel', %{id: id} do
    intel = %{id: 11}
    Worker.put_intel(id, intel)
    Worker.delete_intel(id, intel)

    assert Worker.read(id).intels == %{}
  end
end
