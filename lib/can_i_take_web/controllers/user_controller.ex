defmodule CanITakeWeb.UserController do
  use CanITakeWeb, :controller

  def show(conn, _params) do
    render(conn, "show.json", %{user: %{id: 1, username: "test"}})
  end

  def register(conn, %{"username"=> username, "email"=> _email, "password1"=> _password1, "password2"=> _password2}) do
    render(conn, "show.json", %{user: %{id: 1, username: username}})
  end

  def login(conn, %{"username"=> username, "password"=> _password}) do
    render(conn, "show.json", %{user: %{id: 1, username: username}})
  end
end
