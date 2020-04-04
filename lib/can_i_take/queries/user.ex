defmodule CanITake.Queries.User do
  import Ecto.Query, warn: false
  alias CanITake.Repo
  alias CanITake.Schema.User

  def insert_user!(%{username: username, email: email, password: password}) do
    User.changeset(%User{}, %{
      username: username,
      email: email,
      password: Argon2.hash_pwd_salt(password),
      verification_code: :crypto.strong_rand_bytes(256) |> :base64.encode_to_string()
    })
    |> Repo.insert!()
  end

  def update_user!({user, update_data}) do
    user
    |> User.changeset(update_data)
    |> Repo.update!()
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def verify_email?(%{id: id, verification_code: verification_code}) do
    user = get_user!(id)
    case user.verification_code == verification_code do
      true ->
        update_user!({user, %{verification_code: nil}})
        true
      false ->
        false
    end
  end

  def verify_user?(%{username: username, password: password}) do
    user = Repo.get_by!(User, username: username)
    Argon2.verify_pass(password, user.password)
  end
end
