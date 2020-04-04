defmodule CanITake.Schema.UserService do
  use Ecto.Schema
  import Ecto.Changeset

  alias CanITake.Schema.User
  alias CanITake.Schema.Service

  @timestamps_opts [type: :utc_datetime_usec]

  schema "user_services" do
    belongs_to(:user, User)
    belongs_to(:service, Service)

    timestamps()
  end

  def changeset(nil, attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(service, attrs) do
    service
    |> cast(attrs, [:user_id, :service_id])
    |> validate_required([:user_id, :service_id])
    |> unique_constraint(:user_service, name: :user_service)
  end
end
