defmodule Metr0.Router do
  use Metr0.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Metr0 do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index

    delete "/logout", AuthController, :logout
    resources "/users", UserController
  end

  scope "/auth", Metr0 do
    pipe_through [:browser, :browser_auth]

    get "/:identity", AuthController, :login
    get "/:identity/callback", AuthController, :callback
    post "/:identity/callback", AuthController, :callback
  end
end
