defmodule CanITake.Schema.Service do
  use Ecto.Schema
  import Ecto.Changeset
  alias CanITake.Schema.User

  @timestamps_opts [type: :utc_datetime_usec]

  schema "services" do
    field :name, :string
    field :code, :string

    belongs_to(:user, User)
    timestamps()
  end

  def changeset(nil, attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
