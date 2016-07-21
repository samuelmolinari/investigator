defmodule Investigator.Investigation do
  defstruct id: nil, subjects: %{}

  def put_subject(investigation = %Investigator.Investigation{subjects: subjects}, subject) do
    %Investigator.Investigation{investigation | subjects: Map.put(subjects, subject.id, subject)}
  end

  def delete_subject(investigation = %Investigator.Investigation{subjects: subjects}, %{id: id}) do
    %Investigator.Investigation{investigation | subjects: Map.delete(subjects, id)}
  end
end
