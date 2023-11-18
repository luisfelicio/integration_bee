defmodule IntegrationBee.CompetitionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IntegrationBee.Competition` context.
  """

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        course: "some course",
        name: "some name"
      })
      |> IntegrationBee.Competition.create_student()

    student
  end

  @doc """
  Generate a match.
  """
  def match_fixture(attrs \\ %{}) do
    {:ok, match} =
      attrs
      |> Enum.into(%{
        winner: "some winner"
      })
      |> IntegrationBee.Competition.create_match()

    match
  end
end
