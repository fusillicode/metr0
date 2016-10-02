defmodule Metr0.UserController do
  use Metr0.Web, :controller

  alias Metr0.Repo
  alias Metr0.User
  alias Metr0.Authorization

  def new(conn, params, current_user, _claims) do
    render conn, "new.html", current_user: current_user
  end
end
