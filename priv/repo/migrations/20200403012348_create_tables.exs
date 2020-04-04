defmodule CanITake.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :email_verified, :bool, default: false
      add :verification_code, :string

      timestamps  # inserted_at and updated_at
    end
    create unique_index(:users, [:username])
    create unique_index(:users, [:email])

    create table(:services) do
      add :user_id, references(:users)
      add :name, :string, null: false
      add :code, :string, null: false

      timestamps  # inserted_at and updated_at
    end
    create index(:services, [:user_id])
    create unique_index(:services, [:name, :code], name: :code_name)

    create table(:user_services) do
      add :user_id, references(:users)
      add :service_id, references(:users)

      timestamps  # inserted_at and updated_at
    end
    create unique_index(:user_services, [:user_id, :service_id], name: :user_service)

    create table(:devices) do
      add :user_id, references(:user)
      add :token, :string
    end
    unique_index(:devices, :token)
    create index(:devices, [:user_id])
  end
end
