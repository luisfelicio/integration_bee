defmodule IntegrationBee.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :index, :integer

      add :winner, :string

      add :first_student_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :second_student_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end
  end
end
