defmodule IntegrationBee.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :name, :string
      add :course, :string

      timestamps(type: :utc_datetime)
    end
  end
end
