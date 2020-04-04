defmodule CanITake.Schema.Device do
  use Ecto.Schema
  import Ecto.Changeset

  alias CanITake.Schema.User

  @timestamps_opts [type: :utc_datetime_usec]

  schema "user_services" do
    field :token, :string
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(nil, attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(service, attrs) do
    service
    |> cast(attrs, [:user_id, :token])
    |> validate_required([:user_id, :token])
    |> unique_constraint(:token)
  end
end
