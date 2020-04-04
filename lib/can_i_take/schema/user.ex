defmodule CanITake.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CanITake.Schema.Service
  alias CanITake.Schema.Device

  @timestamps_opts [type: :utc_datetime_usec]

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string
    field :email_verified, :boolean
    field :verification_code, :string

    has_many(:services, Service)
    has_many(:devices, Device)

    timestamps()
  end

  def changeset(nil, attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :email_verified, :verification_code])
    |> validate_format(:email, ~r/[\w-_\.\d]*@[\w-\.]*/)
    |> validate_required([:username, :email, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
