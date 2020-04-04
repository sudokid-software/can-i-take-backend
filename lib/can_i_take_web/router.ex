defmodule CanITakeWeb.Router do
  use CanITakeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", CanITakeWeb do
    pipe_through :api

    get "/user", UserController, :show
    post "/user/register", UserController, :register
    post "/user/login", UserController, :login
  end
end
