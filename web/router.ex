defmodule GaragePi.Router do
  use GaragePi.Web, :router

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

  scope "/", GaragePi do
    pipe_through :browser # Use the default browser stack

    get "/", RemoteController, :show
  end

  # Other scopes may use custom stacks.
  scope "/api", GaragePi do
    pipe_through :api

    get "/press", RemoteController, :press
  end
end
