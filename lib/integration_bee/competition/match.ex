defmodule IntegrationBee.Competition.Match do
  use Ecto.Schema
  import Ecto.Changeset

  alias IntegrationBee.Competition

  @required_fields ~w[index]a
  @optional_fields ~w[winner first_student_id second_student_id]a

  @type id :: Ecto.UUID.t()
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "matches" do

    field :index, :integer

    field :winner, Ecto.Enum, values: [:first, :second]

    belongs_to :first_student, Competition.Student
    belongs_to :second_student, Competition.Student

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
