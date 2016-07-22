defmodule Investigator.Investigation do
  defstruct id: nil,
            subjects: %{},
            person_of_interests: %{},
            intels: %{}

  def put_subject(investigation = %Investigator.Investigation{subjects: subjects}, subject) do
    %Investigator.Investigation{investigation | subjects: Map.put(subjects, subject.id, subject)}
  end

  def delete_subject(investigation = %Investigator.Investigation{subjects: subjects}, %{id: id}) do
    %Investigator.Investigation{investigation | subjects: Map.delete(subjects, id)}
  end

  def put_intel(investigation = %Investigator.Investigation{intels: intels}, intel) do
    %Investigator.Investigation{investigation | intels: Map.put(intels, intel.id, intel)}
  end

  def delete_intel(investigation = %Investigator.Investigation{intels: intels}, %{id: id}) do
    %Investigator.Investigation{investigation | intels: Map.delete(intels, id)}
  end
end
