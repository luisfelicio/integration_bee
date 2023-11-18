defmodule IntegrationBee.Competition.Student do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w[name course]a
  @optional_fields ~w[]a

  @type id :: Ecto.UUID.t()
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "students" do
    field :course, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
