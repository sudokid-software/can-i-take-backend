defmodule CanITakeWeb.UserView do
  use CanITakeWeb, :view

  alias CanITakeWeb.UserView

  def render("show.json", %{user: user}) do
    render_one(user, UserView, "user.json")
  end

  def render("show.json", %{users: users}) do
    render_many(users, UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    %{
      username: user.username,
      email: user.email
    }
  end
end
