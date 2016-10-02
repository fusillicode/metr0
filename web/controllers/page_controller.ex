defmodule Metr0.PageController do
  use Metr0.Web, :controller
  alias Metr0.Repo

  def index(conn, _params, current_user, _claims) do
    render conn, "index.html", current_user: current_user
  end
end
