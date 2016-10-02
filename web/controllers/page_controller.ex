defmodule Metr0.PageController do
  use Metr0.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
